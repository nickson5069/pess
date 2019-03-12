-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2019 at 09:15 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `11_nickson_pessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incidentid` int(11) NOT NULL,
  `patrolcarId` varchar(10) NOT NULL,
  `timeDispatched` datetime NOT NULL,
  `timeArrived` datetime NOT NULL,
  `timeCompleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incidentid`, `patrolcarId`, `timeDispatched`, `timeArrived`, `timeCompleted`) VALUES
(25, 'QX1111J', '2019-02-28 11:15:28', '2019-03-04 15:38:37', '2019-03-04 15:29:00'),
(27, 'QX1234A', '2019-03-04 16:11:26', '2019-03-04 16:11:50', '2019-03-04 16:12:09'),
(29, 'QX1234A', '2019-03-04 16:15:06', '0000-00-00 00:00:00', '2019-03-05 09:58:08'),
(29, 'QX2222K', '2019-03-04 16:15:06', '2019-03-04 16:15:27', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incidentid` int(11) NOT NULL,
  `callerName` varchar(30) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `incidentTypeId` varchar(3) NOT NULL,
  `incidentLocation` varchar(50) NOT NULL,
  `incidentDesc` varchar(100) NOT NULL,
  `incidentStatusId` varchar(1) NOT NULL,
  `timeCalled` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incidentid`, `callerName`, `phoneNumber`, `incidentTypeId`, `incidentLocation`, `incidentDesc`, `incidentStatusId`, `timeCalled`) VALUES
(1, 'Peter Leow', '81234567', '060', 'Junction of North Bridge Road and Middle Road', 'A bus collided with a taxi, 2 injuries', '', '2019-02-12 03:16:47'),
(2, 'Nickson', '87501000', '10', 'bukitbatok', '0', '1', '2019-02-26 02:01:06'),
(3, 'Nickson', '87501000', '10', 'bukitbatok', '0', '1', '2019-02-26 02:35:24'),
(4, 'Nickson', '87501000', '10', 'bukitbatok', 'v', '1', '2019-02-26 02:35:31'),
(5, 'Nickson', 'as', '10', 'as', 'as', '1', '2019-02-26 02:56:10'),
(6, 'Nickson', 'as', '10', 'as', 'as', '1', '2019-02-26 02:57:24'),
(7, 'nn', 'nn', '10', 'nn', 'nn', '1', '2019-02-26 02:57:30'),
(8, 'nn', 'nn', '10', 'nn', 'nn', '1', '2019-02-26 03:08:36'),
(9, 'Nickson', 'as', '10', 'bukitbatok', '00', '1', '2019-02-26 03:08:43'),
(10, 'Nickson', 'as', '10', 'bukitbatok', '00', '1', '2019-02-26 03:11:15'),
(11, 'Nickson', 'as', '10', 'bukitbatok', '000\r\n', '1', '2019-02-28 02:53:52'),
(12, '', '', '', '', '000', '2', '2019-02-28 03:00:38'),
(13, 'Nickson', 'as', '10', 'bukitbatok', '000\r\n', '1', '2019-02-28 03:00:50'),
(14, '', '', '', '', '000\r\n', '2', '2019-02-28 03:03:06'),
(15, '', '', '', '', '000\r\n', '2', '2019-02-28 03:03:42'),
(16, 'Nickson', 'as', '10', 'bukitbatok', '33', '1', '2019-02-28 03:03:52'),
(17, '', '', '', '', '03', '2', '2019-02-28 03:05:03'),
(18, 'Nickson', 'as', '10', 'bukitbatok', '123', '1', '2019-02-28 03:09:16'),
(19, '', '', '', '', '123', '2', '2019-02-28 03:09:19'),
(20, '', '', '', '', '123', '1', '2019-02-28 03:10:09'),
(21, '', '', '', '', '123', '2', '2019-02-28 03:10:09'),
(22, 'Nickson', 'as', '10', 'bukitbatok', '156', '1', '2019-02-28 03:11:17'),
(23, 'Nickson', 'as', '10', 'bukitbatok', '56\r\n', '1', '2019-02-28 03:13:52'),
(24, 'Nickson', 'as', '10', 'bukitbatok', '153', '1', '2019-02-28 03:15:21'),
(25, '', '', '', '', '153', '3', '2019-02-28 03:15:28'),
(26, 'Nickson', 'as', '10', 'bukitbatok', '00', '1', '2019-03-04 08:11:17'),
(27, '', '', '', '', '00', '3', '2019-03-04 08:11:25'),
(28, 'Nickson', 'as', '10', 'bukitbatok', '55', '1', '2019-03-04 08:15:00'),
(29, '', '', '', '', '55', '2', '2019-03-04 08:15:06'),
(30, 'Nickson', 'as', '10', 'bukitbatok', 'aa', '1', '2019-03-05 01:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`statusId`, `statusDesc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incidentTypeId` varchar(3) NOT NULL,
  `incidentTypeDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incidentTypeId`, `incidentTypeDesc`) VALUES
('10', 'Fire'),
('20', 'Riot'),
('30', 'Burglary'),
('40', 'Domestic Violent'),
('50', 'Fallen Tree'),
('60', 'Traffic Accident'),
('70', 'Loan Shark'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcarId` varchar(10) NOT NULL,
  `patrolcarStatusId` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcarId`, `patrolcarStatusId`) VALUES
('QX1111J', '3'),
('QX1234A', '3'),
('QX1342G', '1'),
('QX2222K', '4'),
('QX2288D', '3'),
('QX3456B', '2'),
('QX5555D', '2'),
('QX8723W', '2'),
('QX8769P', '3'),
('QX8923T', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`statusId`, `statusDesc`) VALUES
('1', 'Dispatched'),
('2', 'Patrol'),
('3', 'Free'),
('4', 'Arrived');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incidentid`,`patrolcarId`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incidentid`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incidentTypeId`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcarId`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`statusId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incidentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
