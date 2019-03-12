
<?php //com
	if(!isset($_POST['submit']) && !isset($_POST['btnDispatch']))
		header("Location: logcall.php");

	$con = mysql_connect("localhost","nickson_pessdb","000000");
				if(!$con)
			{
				die('Cannot connect to database: '.mysql_error());
			}
			mysql_select_db("11_nickson_pessdb",$con);

	if(isset($_POST["submit"]))
			{
			$sql = "INSERT INTO incident(callerName,phoneNumber,incidentTypeId,incidentLocation,incidentDesc,incidentStatusId) VALUES('$_POST[callerName]','$_POST[contactNo]','$_POST[incidentType]','$_POST[location]','$_POST[incidentDesc]','1')";
				
			if(!mysql_query($sql,$con))
			{
				die('Error:'.mysql_error());
			}
			}
?>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
	
</head>

<body>
	<?php include "header.php";
	/* Search and retrieve similar pending incidents and populate a table*/

	// connect to a database
	$con = mysql_connect("localhost","nickson_pessdb","000000");
	if(!$con)
	{
		die('Cannot connect to database:'.mysql_error());
	}

	//select a table in the database
	mysql_select_db("11_nickson_pessdb",$con);

	$sql = "SELECT patrolcarId, statusDesc FROM patrolcar INNER JOIN patrolcar_status ON patrolcar.patrolcarStatusId=patrolcar_status.statusId WHERE patrolcar.patrolcarStatusId='2' OR patrolcar.patrolcarStatusId='3'";

	$result = mysql_query($sql,$con);
	$incidentArray;
	$count=0;

	while($row = mysql_fetch_array($result))
	{
		$patrolcarArray[$count]=$row;
		$count++;
	}

	if(!mysql_query($sql,$con))
	{
		die('Error:'.mysql_error());
	}

	mysql_close($con);

	?>
	<form name="frmLogCall" onsubmit="return validateForm()" method="post" action="dispatch.php" >
	<fieldset>
	<legend>Dispatch Patrol Cars</legend>
	  <table style="margin-bottom: 30px">
		  <tr>
			  <td align="right">Caller Name:</td>
			  <td><p><input type="hidden" name="callerName" /><?php echo $_POST['callerName']?>
			  </p></td>
		  </tr>
		  <tr>
			  <td align="right">Contact Number:</td>
			  <td><p><input type="hidden" name="contactNo" /><?php echo $_POST['contactNo']?>
			  </p></td>
		  </tr>
		  <tr>
			  <td align="right">Location:</td>
			  <td><p><input type="hidden" name="location" /><?php echo $_POST['location']?>
			  </p></td>
		  </tr>
		  
		  <tr>
			  
			  <td align="right">Incident Type:</td>
			  <td><p><input type="hidden" name="incidentType" /><?php echo $_POST['incidentType']?>
			  </p></td>
		  </tr>
		  <tr></tr>
		  <tr>
			  <td align="right">Description:</td>
			  <td><textarea name="incidentDesc" rows="10" cols="30"><?php echo $_POST['incidentDesc']?></textarea></td>
		  </tr>
		</table>
	<table width="40%" border="1" align="center" cellpadding="4" cellspacing="8">
	<tr>
		<td width="20%">&nbsp;</td>
		<td width="51%">Patrol Car ID</td>
		<td width="29%">Status</td>
		</tr>
		
		<?php
		$i=0;
		while($i<$count){
			?>
		<tr>
		<td class="td_label"><input type="checkbox" name="chkPatrolcar[]" value="<?php echo $patrolcarArray[$i]['patrolcarId']?>"></td>
		<td><?php echo $patrolcarArray[$i]['patrolcarId']?></td>
		<td><?php echo $patrolcarArray[$i]['statusDesc']?></td>
		</tr>
	
	<?php $i++;
		} ?>
	</table>
	<table width="70%" border="0" align="right" cellpadding="4" cellspacing="4">
	<td with="46%" class="td_label"><input type="reset" name="btnCancel" id="btnCancel" value="Reset"></td>
		<td width="54%" class="td_Data">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="btnsubmit" id="btnsubmit" value="Submit">
		</td>
		</table>
		</form>
		</fieldset>
	<?php
	
	if(isset($_POST["btnsubmit"]))
	{
		//connect to database
		$con = mysql_connect("localhost","nickson_pessdb","000000");
		
	if(!$con)
	{
		die('Cannot connect to database :'.mysql_error());
	}
	
	mysql_select_db("11_nickson_pessdb",$con);
		
		
	// update patrolcar status table and dispatch table
	$patrolcarDispatched = $_POST["chkPatrolcar"];
		
	$c = count($patrolcarDispatched);
	// insert new incident
		$status;
		if($c>0){
			$status='2';
		} else {
			$status='1';
		}
		
		$sql = "INSERT INTO incident(callerName,phoneNumber,incidentTypeId,incidentLocation,incidentDesc,incidentStatusId) VALUES('".$_POST['callerName']."','".$_POST['contactNo']."','".$_POST['incidentType']."','".$_POST['location']."','".$_POST['incidentDesc']."','$status')";
		
		if(!mysql_query($sql,$con))
		{
			die('Error1:'.mysql_error());
		}
		// retrieve new incremental key for incidentId 
		$incidentId = mysql_insert_id($con);;
		
		for($i=0; $i<$c; $i++)
		{
			$sql = "UPDATE patrolcar SET patrolcarStatusId='1' WHERE patrolcarId='$patrolcarDispatched[$i]'";
			
			if(!mysql_query($sql,$con))
			{
				die('Error2:'.mysql_error());
			}
			
			$sql = "INSERT INTO dispatch (incidentId, patrolcarId, timeDispatched) VALUES ('$incidentId','$patrolcarDispatched[$i]',NOW())"; 

			if(!mysql_query($sql,$con))
			{
				die('Error3:'.mysql_error());
			}
		}
		mysql_close($con);
	}
	?>
</body>
</html>