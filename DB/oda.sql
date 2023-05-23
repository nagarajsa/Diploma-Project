-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2019 at 09:51 AM
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
(2, 'oda@email.oda', 'Full Day');

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
(1, 3, 4, '2016-04-08', '10:00:00', ''),
(2, 2, 2, '2016-04-27', '09:00:00', 'Blood pressure'),
(6, 3, 2, '2016-04-19', '17:00:00', 'Heart problem'),
(9, 3, 2, '2016-04-17', '11:00:00', ''),
(10, 2, 4, '2016-04-20', '16:00:00', 'Diabetes'),
(17, 2, 3, '2016-05-18', '11:30:00', ''),
(19, 2, 2, '2016-05-18', '12:00:00', ''),
(23, 6, 4, '2016-05-25', '12:00:00', ''),
(24, 6, 1, '2016-05-02', '15:30:00', 'BP High'),
(25, 6, 1, '2016-05-11', '11:30:00', ''),
(26, 6, 3, '2016-05-01', '10:00:00', ''),
(27, 6, 3, '2016-04-29', '12:00:00', ''),
(28, 2, 3, '2016-05-18', '10:00:00', ''),
(31, 15, 4, '2019-02-25', '12:00:00', 'Hungry'),
(32, 16, 4, '2019-02-26', '11:30:00', ''),
(33, 16, 1, '2019-02-27', '18:00:00', ''),
(34, 12, 1, '2019-03-21', '14:00:00', 'Shugar'),
(36, 18, 3, '2019-03-16', '11:30:00', ''),
(37, 18, 4, '2019-03-16', '12:30:00', ''),
(38, 21, 4, '2019-03-13', '09:30:00', ''),
(40, 2, 3, '2019-03-18', '10:30:00', ''),
(41, 12, 2, '2019-03-21', '15:00:00', ''),
(44, 22, 4, '2019-03-21', '11:30:00', ''),
(57, 30, 4, '2019-03-28', '12:30:00', ''),
(58, 30, 1, '2019-03-04', '13:30:00', ''),
(59, 12, 15, '2019-03-24', '11:30:00', ''),
(60, 12, 15, '2019-03-30', '10:30:00', '');

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
('ashaah59@uncc.edu', 1, '11:00:00', '18:00:00', 'Family Physician'),
('hthakkar@uncc.edu', 2, '10:00:00', '18:00:00', 'Family Physician'),
('jbond@uncc.edu', 3, '09:00:00', '12:00:00', 'Cancer Specialist'),
('ssetturu@uncc.edu', 4, '08:00:00', '16:00:00', 'Neuromuscular'),
('tstark@gmail.com', 15, '09:00:00', '17:00:00', 'Mind Specialist');

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
(1, 1, 3, 'Good'),
(6, 6, 3, 'Rude and strict'),
(9, 9, 4, 'Helpful'),
(10, 10, 2, 'Fine'),
(25, 2, 5, 'Thanks Man!'),
(26, 24, 4, 'Helped me'),
(27, 26, 4, 'thank you'),
(28, 34, 4, 'Thanks'),
(29, 44, 5, 'Thank You Mam'),
(30, 45, 5, 'Good Therapy'),
(31, 31, 4, 'nice'),
(33, 58, 5, 'besttttt');

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
('abc@uncc.edu', 'abc', 'patient'),
('as@sid.com', '123456', 'doctor'),
('ashaah59@uncc.edu', 'anal', 'doctor'),
('ashah59@uncc.edu', 'anal', 'patient'),
('assid@gmail.com', '123456789', 'patient'),
('chandruk@gmail.com', '123456', 'patient'),
('forza@as.edu', '123456', 'patient'),
('hthakkar@uncc.edu', 'hardik', 'doctor'),
('jbond@uncc.edu', 'james', 'doctor'),
('ksavakia@uncc.edu', 'khyati', 'patient'),
('oda@email.oda', 'oda7795', 'Administrator'),
('sid@as.co', '1234', 'doctor'),
('ssetturu@uncc.edu', 'sree', 'doctor'),
('test@uncc.edu', 'test', 'patient'),
('tshetty1@uncc.edu', 'triveni', 'patient'),
('tstark@gmail.com', 'tonystark', 'doctor'),
('uufjgfjgj@gmail.com', '123456', 'patient');

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
(1, 'ksavakia@uncc.edu', 'ashaah59@uncc.edu'),
(2, 'test@uncc.edu', 'jbond@uncc.edu'),
(3, 'tshetty1@uncc.edu', 'jbond@uncc.edu'),
(6, 'ashah59@uncc.edu', 'ashaah59@uncc.edu'),
(12, 'abc@uncc.edu', 'ashaah59@uncc.edu'),
(15, 'forza@as.edu', 'ssetturu@uncc.edu'),
(16, 'uufjgfjgj@gmail.com', 'ssetturu@uncc.edu'),
(18, 'as@Sid.com', 'jbond@uncc.edu'),
(21, 'sid@as.co', 'ssetturu@uncc.edu'),
(22, 'assid@gmail.com', 'ssetturu@uncc.edu'),
(30, 'chandruk@gmail.com', 'ashaah59@uncc.edu');

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
(2, 1, 250),
(6, 2, 250),
(7, 10, 330),
(8, 32, 500),
(9, 31, 1000),
(10, 23, 650),
(15, 6, 1000),
(16, 26, 500),
(17, 24, 500),
(18, 34, 500);

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
('abc@uncc.edu', 'abc', 'xyz', 'Female', '9990099900', '1990-05-16', '9501', 'Charlotte', 'NC', '28262', 'patient'),
('as@Sid.com', 'as', 'sid', 'Male', '8748099187', '1995-03-04', 'vidyagiri, 2nd main', 'ilkal', 'KR', '587125', 'doctor'),
('ashaah59@uncc.edu', 'Anal', 'Shah', 'Male', '1234567891', '1991-02-03', '9675 UT Drive', 'Charlotte', 'NC', '28262', 'doctor'),
('ashah59@uncc.edu', 'anall', 'shah', 'Male', '2144564564', '1990-05-16', '9501', 'Charlotte', 'NC', '28262', 'patient'),
('assid@gmail.com', 'as', 'sid', 'Male', '8748099187', '1995-03-04', 'ilkal', 'ilkal', 'KS', '587125', 'patient'),
('chandruk@gmail.com', 'chandru', 'k', 'Male', '9611766245', '2000-03-12', 'ilk', 'ikl', 'KR', '587125', 'patient'),
('forza@as.edu', 'Forza', 'as', 'Male', '8748099187', '1995-04-03', 'Ilkal', 'Ilkal', 'CA', '587125', 'patient'),
('hthakkar@uncc.edu', 'Hardil', 'Thakkar', 'Male', '1232345612', '1992-09-09', '1001 Ashford', 'Charlotte', 'NC', '28765', 'doctor'),
('jbond@uncc.edu', 'James', 'Bond', 'Male', '1234567654', '1898-07-02', 'Cali street', 'New York', 'New York', '23451', 'doctor'),
('ksavakia@uncc.edu', 'Khyati', 'Savakia', 'Female', '1234345678', '1991-03-04', '9548 UT Drive', 'Charlotte', 'NC', '29262', 'patient'),
('oda@email.oda', 'oda', 'doc', 'Male', '8748099789', '1995-05-05', 'wakanda', 'asguard', 'CT', '777777', 'Administrator'),
('sid@as.co', 'sid', 'as', 'Female', '8748099188', '1995-03-15', 'vidyagiri', 'ilkal', 'KR', '587125', 'doctor'),
('ssetturu@uncc.edu', 'Sreelakshmi', 'Setturu', 'Female', '1234345678', '1997-04-07', '9548 UT North', 'Charlotte', 'NC', '45678', 'doctor'),
('test@uncc.edu', 'Test', 'Test', 'Female', '2012345666', '1991-05-07', '3456 north drive', 'Charlotte', 'NC', '28262', 'patient'),
('tshetty1@uncc.edu', 'Triveni', 'Shetty', 'Female', '1234234234', '1993-05-06', '9678 Ut Drice', 'Charlotte', 'NC', '23145', 'patient'),
('tstark@gmail.com', 'Tony', 'Stark', 'Male', '8778877877', '1987-08-07', 'Stark Lab', 'MCU', 'NY', '877-877', 'doctor'),
('uufjgfjgj@gmail.com', 'gfgf', 'jkg', 'Male', '8754896875', '2019-02-04', 'jhuyg', 'nbi', 'CA', '52452', 'patient');

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
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `doctorreview`
--
ALTER TABLE `doctorreview`
  MODIFY `docreviewid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `paymentid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
