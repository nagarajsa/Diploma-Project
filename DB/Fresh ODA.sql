-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2019 at 12:28 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oda`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `shift` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `email`, `shift`) VALUES
(1, 'oda@email.oda', 'Full Day');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `prescription` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `email` varchar(50) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `specialist` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctorreview`
--

CREATE TABLE `doctorreview` (
  `docreviewid` int(10) NOT NULL,
  `appid` int(11) NOT NULL,
  `rating` int(5) NOT NULL,
  `review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `role`) VALUES
('oda@email.oda', 'odaoda', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `predoctor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymenthistory`
--

CREATE TABLE `paymenthistory` (
  `paymentid` int(50) NOT NULL,
  `appid` int(50) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `streetaddress` varchar(200) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`email`, `fname`, `lname`, `gender`, `phonenumber`, `dob`, `streetaddress`, `city`, `state`, `pincode`, `role`) VALUES
('oda@email.oda', 'Admin', 'AS', 'Male', '8748099187', '1995-04-03', 'vidyagiri', 'ilkal', 'karnataka', '587125', 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `doctorid` (`doctorid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `doctorreview`
--
ALTER TABLE `doctorreview`
  ADD PRIMARY KEY (`docreviewid`),
  ADD UNIQUE KEY `appid` (`appid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `email_2` (`email`),
  ADD KEY `predoctor` (`predoctor`);

--
-- Indexes for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  ADD PRIMARY KEY (`paymentid`),
  ADD UNIQUE KEY `appid_2` (`appid`),
  ADD KEY `appid` (`appid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctorreview`
--
ALTER TABLE `doctorreview`
  MODIFY `docreviewid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `paymentid` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`);

--
-- Constraints for table `doctorreview`
--
ALTER TABLE `doctorreview`
  ADD CONSTRAINT `doctorreview_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `appointment` (`appid`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`predoctor`) REFERENCES `doctor` (`email`);

--
-- Constraints for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  ADD CONSTRAINT `paymenthistory_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `appointment` (`appid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
