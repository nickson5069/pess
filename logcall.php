<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Log Call</title>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
	<script>
		function validateForm() {
		  var x = document.forms["frmLogCall"]["callerName"].value;
		  var y = document.forms["frmLogCall"]["contactNum"].value;
		  var z = document.forms["frmLogCall"]["location"].value;
		  var j = document.forms["frmLogCall"]["incidentDesc"].value;
		  if ((x == "") || (y == "") || (z == "") || (j == "")) {
			alert("Name must be filled out");
			return false;
		  }
		}
	</script>
</head>


<body>
	<?php include "header.php";
				$con = mysql_connect("localhost","nickson_pessdb","000000");
				if(!$con)
				{
					die('Cannot connect to database: '.mysql_error());
				}

				mysql_select_db("11_nickson_pessdb",$con);

				$result = mysql_query("SELECT * FROM incident_type");
				
				$incidentType;
	
				while($row = mysql_fetch_array($result))
				{
				// incidentTypeID, incidentTypeDesc
				$incidentType[$row['incidentTypeId']]=$row['incidentTypeDesc'];
				}
	
				if(isset($_POST["submit"]))
				{
				$sql = "INSERT INTO incident(callerName,phoneNumber,incidentTypeId,incidentLocation,incidentDesc,incidentStatusId) VALUES('$_POST[callerName]','$_POST[contactNo]','$_POST[incidentType]','$_POST[location]','$_POST[incidentDesc]','1')";
				
				if(!mysql_query($sql,$con))
				{
					die('Error:'.mysql_error());
				}
				}
	
				mysql_close($con);
	?>
	
	<form name="frmLogCall" onsubmit="return validateForm()" method="post" action="dispatch.php" >
	<fieldset>
	<legend>Log Call</legend>
	  <table>
		  <tr>
			  <td align="right">Caller Name:</td>
			  <td><p><input type="text" name="callerName" />
			  </p></td>
		  </tr>
		  <tr>
			  <td align="right">Contact Number:</td>
			  <td><p><input type="text" name="contactNo" />
			  </p></td>
		  </tr>
		  <tr>
			  <td align="right">Location:</td>
			  <td><p><input type="text" name="location" />
			  </p></td>
		  </tr>
		  
		  <tr>
			  
			  <td align="right">Incident Type:</td>
			  <td class="td_Date">
			  <p>
			  <select name="incidentType" id="incidentType">
				  
			  <?php foreach( $incidentType as $key => $value){?>
				  
			  <option value="<?php echo $key?>"><?php echo $value ?></option>
				  
			  <?php }?>
			  </select></p>
			  </td>
		  </tr>
		  <tr></tr>
		  <tr>
			  <td align="right">Description:</td>
			  <td><textarea name="incidentDesc" rows="10" cols="30"></textarea></td>
		  </tr>
	  	  <tr>
			<td align="right"><input type="reset" name="reset" value="Reset"></td>
			<td align="right"><input type="submit" name="submit" value="Process Call..."></td>
		  </tr>
		</table>
	</fieldset>
	</form>
</body>
</html>
