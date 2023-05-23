-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2019 at 05:23 PM
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

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appid`, `patientid`, `doctorid`, `date`, `time`, `prescription`) VALUES
(3, 1, 5, '2019-03-24', '11:00:00', 'Headache'),
(4, 1, 3, '2019-03-27', '10:00:00', ''),
(5, 1, 1, '2019-03-24', '11:30:00', 'Headache'),
(6, 1, 2, '2019-03-24', '10:30:00', 'Headache'),
(7, 1, 3, '2019-03-24', '11:00:00', 'Headache'),
(8, 1, 4, '2019-03-24', '12:00:00', 'Headache');

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

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`email`, `doctorid`, `starttime`, `endtime`, `specialist`) VALUES
('mghiremath@gmail.com', 1, '09:30:00', '14:30:00', 'Allergist'),
('rajendradugani@gmail.com', 2, '09:00:00', '14:00:00', 'Neurologist'),
('shivanikonnur@gmail.com', 3, '10:00:00', '15:00:00', 'Surgeon'),
('mohanshendre@gmail.com', 4, '10:30:00', '14:30:00', 'Skin Expert'),
('anitaakki@gmail.com', 5, '08:00:00', '17:00:00', 'Family Physician');

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

--
-- Dumping data for table `doctorreview`
--

INSERT INTO `doctorreview` (`docreviewid`, `appid`, `rating`, `review`) VALUES
(1, 3, 5, 'Good'),
(2, 6, 5, 'Good'),
(3, 8, 5, 'Good'),
(4, 5, 5, 'Good'),
(5, 7, 5, 'Good');

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
('anitaakki@gmail.com', 'anitaakki', 'doctor'),
('AS@gmail.com', 'as7795', 'patient'),
('mghiremath@gmail.com', 'mghiremath', 'doctor'),
('mohanshendre@gmail.com', 'mohan', 'doctor'),
('oda@email.oda', 'odaoda', 'Administrator'),
('rajendradugani@gmail.com', 'rajendra', 'doctor'),
('shivanikonnur@gmail.com', 'shivani', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `predoctor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `email`, `predoctor`) VALUES
(1, 'AS@gmail.com', 'anitaakki@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `paymenthistory`
--

CREATE TABLE `paymenthistory` (
  `paymentid` int(50) NOT NULL,
  `appid` int(50) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenthistory`
--

INSERT INTO `paymenthistory` (`paymentid`, `appid`, `amount`) VALUES
(1, 5, 500),
(2, 6, 500),
(3, 7, 500),
(4, 8, 500),
(5, 3, 500);

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
('anitaakki@gmail.com', 'Anita', 'M.Akki', 'Female', '8748099187', '1990-04-03', 'Kims Hospital', 'Hubli', 'KR', '580020', 'doctor'),
('AS@gmail.com', 'Abbu', 'AS', 'Male', '8748099187', '1995-04-03', 'vidyagiri', 'ilkal', 'KR', '587125', 'patient'),
('mghiremath@gmail.com', 'Hiremath', 'M.G', 'Male', '8754653285', '1988-08-08', 'Kims Hospital', 'Hubli', 'KR', '580020', 'doctor'),
('mohanshendre@gmail.com', 'Mohan', 'Shendre', 'Male', '9988758654', '1985-06-25', 'Kims Hospital', 'Hubli', 'KR', '580020', 'doctor'),
('oda@email.oda', 'Admin', 'AS', 'Male', '8748099187', '1995-04-03', 'vidyagiri', 'ilkal', 'karnataka', '587125', 'Administrator'),
('rajendradugani@gmail.com', 'Rajendra', 'Dugani', 'Male', '9887546585', '1989-05-25', 'Kims Hospital', 'Hubli', 'KR', '580020', 'doctor'),
('shivanikonnur@gmail.com', 'Shivani', 'Konnur', 'Female', '8748099187', '1990-04-03', 'Kims Hospital', 'Hubli', 'KR', '580020', 'doctor');

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
  MODIFY `appid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctorreview`
--
ALTER TABLE `doctorreview`
  MODIFY `docreviewid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `paymentid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
