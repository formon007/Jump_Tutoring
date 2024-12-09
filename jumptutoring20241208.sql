-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 07:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jumptutoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(3) NOT NULL,
  `adminname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `adminname`, `password`) VALUES
(99, 'admin', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(20) NOT NULL,
  `userid` int(3) NOT NULL,
  `username` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `subjects` varchar(20) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `userid`, `username`, `time`, `subjects`, `date`) VALUES
(65, 1, 'tom', '4pm', 'Chemistry Level 2', '2024-11-08'),
(66, 2, 'ben', '5pm', 'Chemistry Level 3', '2024-10-30'),
(67, 2, 'ben', '5pm', 'Chemistry Level 3', '2024-10-31'),
(71, 1, 'tom', '5pm', 'Chemistry Level 3', '2024-11-22'),
(75, 5, 'lulu', '3pm', 'Science Level 1', '2024-11-07'),
(77, 1, 'tom', '3pm', 'Science Level 1', '2024-11-05'),
(78, 1, 'tom', '4pm', 'Chemistry Level 2', '2024-11-05'),
(79, 1, 'tom', '5pm', 'Chemistry Level 3', '2024-11-07'),
(80, 1, 'tom', '3pm', 'Science Level 1', '2024-11-04'),
(82, 1, 'tom', '4pm', 'Chemistry Level 2', '2024-11-27'),
(83, 1, 'tom', '3pm', 'Science Level 1', '2024-11-27'),
(89, 1, 'tom', '5pm', 'Chemistry Level 3', '2024-11-29'),
(90, 1, 'tom', '4pm', 'Chemistry Level 2', '2024-11-21'),
(91, 99, 'admin', '3pm', 'Science Level 1', '2024-11-07'),
(92, 99, 'admin', '4pm', 'Chemistry Level 2', '2024-11-06'),
(106, 1, 'tom', '3pm', 'Science Level 1', '2024-11-12'),
(107, 1, 'tom', '5pm', 'Chemistry Level 3', '2024-11-20'),
(115, 99, 'admin', '3pm', 'Science Level 1', '2024-11-28'),
(116, 99, 'admin', '3pm', 'Science Level 1', '2024-11-14'),
(120, 112, 'TheChosenOne', '4pm', 'Chemistry Level 2', '2024-11-25'),
(121, 112, 'TheChosenOne', '3pm', 'Science Level 1', '2024-11-25'),
(122, 112, 'TheChosenOne', '3pm', 'Science Level 1', '2024-11-25'),
(123, 112, 'TheChosenOne', '3pm', 'Science Level 1', '2024-11-25'),
(124, 112, 'TheChosenOne', '4pm', 'Chemistry Level 2', '2024-11-25'),
(125, 112, 'TheChosenOne', '4pm', 'Chemistry Level 2', '2024-11-25'),
(126, 1, 'tom', '3pm', 'Science Level 1', '2024-11-28'),
(127, 1, 'tom', '5pm', 'Chemistry Level 3', '2024-11-28'),
(128, 5, 'lulu', '4pm', 'Chemistry Level 2', '2024-11-28'),
(129, 5, 'lulu', '5pm', 'Chemistry Level 3', '2024-11-29'),
(130, 99, 'admin', '4pm', 'Chemistry Level 2', '2024-11-28'),
(131, 99, 'admin', '5pm', 'Chemistry Level 3', '2024-12-26'),
(132, 99, 'admin', '4pm', 'Chemistry Level 2', '2024-12-26'),
(133, 1, 'tom', '4pm', 'Chemistry Level 2', '2024-12-18'),
(134, 1, 'tom', '4pm', 'Chemistry Level 2', '2024-12-19');

-- --------------------------------------------------------

--
-- Table structure for table `enquire`
--

CREATE TABLE `enquire` (
  `id` int(3) NOT NULL,
  `sfirstname` varchar(20) NOT NULL,
  `slastname` varchar(20) NOT NULL,
  `schoolyear` varchar(20) NOT NULL,
  `parentname` varchar(20) NOT NULL,
  `phonenumber` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `typeoftutoring` varchar(20) NOT NULL,
  `subjects` varchar(100) NOT NULL,
  `availability` varchar(100) NOT NULL,
  `prefertime` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `admincomment` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquire`
--

INSERT INTO `enquire` (`id`, `sfirstname`, `slastname`, `schoolyear`, `parentname`, `phonenumber`, `email`, `address`, `typeoftutoring`, `subjects`, `availability`, `prefertime`, `message`, `admincomment`) VALUES
(1, 'Lucy', 'Lu', '1', '', 0, '', '', '', '', '', '', '', 'No contact number'),
(2, 'Lucy', 'Lu', '1', 'Alice', 4645165, '', '', '', '', '', '', '', 'contact number invalid'),
(3, 'Lucy', 'Lu', '1', 'Alice', 4645165, 'lucylu90801@gmail.com', '1/31 Inkerman Street', '', '', '', '', '', 'I need more infomationI need more infomationI need more infomationI need more infomationI need more infomationI need more infomationI need more infomationI need more infomation'),
(4, 'Lucy', 'Lu', '1', 'Alice', 4645165, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'maths', 'monday', '', '', 'no message left'),
(5, 'Lucy', 'Lu', '1', 'Alice', 4645165, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'maths', 'monday', '4.00pm', 'complete form', 'comment goees'),
(6, 'Lucy', 'Lu', '1', 'Alice', 4645165, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'maths', 'monday', '4.00pm', 'does it work', 'over ride this'),
(7, 'Lucy', 'Lu', '1', 'Alice', 4645165, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'maths', 'monday', '4.00pm', 'does it work', 'again and again'),
(8, 'Lucy', 'Lu', '6', 'Alice', 4645165, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'science', 'monday', '4.00pmfdg', 'adsfadfadsf', 'comment'),
(9, 'Lucy', 'Lu', '12', 'Alice', 11111, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'maths', 'monday', '4.00pm', 'new enquiry', 'let\'s go again'),
(10, 'Reza', 'Siar', '6', 'Alice', 232323, 'pmwe@teer.com', 'Epsom', 'In Person Only', 'SQL', '5pm', '7pm', 'Am slow and retarded', 'adding comment'),
(11, 'sada', 'sadasd', 'e', 'Alice', 251, '12@113', '1212', 'In Person Only', 'dsad', 'sdsad', 'asdas', '', 'override'),
(12, 'Lucy', 'Lu', '6', 'Alice', 23234, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', '324', 'monday', 'asdas', 'rts', 'why some works and some don\'t'),
(13, 'Lucy', 'Lu', '6', 'Alice', 23234, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', '324', 'monday', 'asdas', 'rts', 'why some works'),
(14, 'Lucy', 'Lu', '6', 'Alice', 23234, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', '324', 'monday', 'asdas', 'rts', 'adding adding adding'),
(15, 'Lucy', 'Lu', '6', 'Alice', 23234, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', '324', 'monday', 'asdas', 'rts', 'testing to see if the box is cleared'),
(16, 'Lucy', 'Lu', '6', 'Alice', 23234, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', '324', 'monday', 'asdas', 'rts', 'adding comment'),
(17, 'Lucy', 'Lu', '6', 'Alice', 211750722, 'lucylu90801@gmail.com', '62 Willoughby Ave', 'Please Select', 'aaaa', '5pm', '7pm', 'aaaaaaaaaaaaaa', 'clear the box'),
(18, 'Lucy', 'Lu', '1', 'Alice', 211750722, 'lucylu90801@gmail.com', '62 Willoughby Ave', 'Please Select', 'SQL', 'monday', '4.00pmfdg', 'sssssssssssssssss', 'what about this one'),
(19, 'Lucy', 'Lu', '1', 'Alice', 23134, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'SQL', '5pm', '4.00pmfdg', 'xxxxxxxxxxxx', 'adding a comment'),
(20, 'Lucy', 'Lu', '1', 'Alice', 23134, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'Please Select', 'SQL', '5pm', '4.00pmfdg', 'xxxxxxxxxxxx', 'trying again'),
(21, 'Lucy', 'Lu', '11', 'Alice', 211750722, 'lucylu90801@gmail.com', '62 Willoughby Ave', 'Please Select', 'SQL', '5pm', '7pm', '66666666666', 'value removed'),
(22, 'dfg', 'asdg', 'Year 1', 'sdg', 24524, 'artae@gmail.com', 'wertwet', 'In Person Only', 'Please Select', 'on,on', 'on,on', '', ''),
(23, 'hstyt', 'sfgsgfd', 'Year 13/NCEA Level 3', 'sfh', 42452, 'adfad@gmail.com', '42453', 'In Person Only', 'Science', 'on,on', 'morning,afternoon_1', 'sssssss', ''),
(24, '34', 'afd', 'Please Select', 'ad', 2452435, 'adsfa@gmail.com', 'aadf', 'Please Select', 'Please Select', 'monday', 'morning', 'no comment', 'omg it worked'),
(25, 'WENDY', 'WANG', 'Year 12/NCEA Level 2', 'WAN', 211537595, 'NEWLESSON@GMAIL.COM', 'HOWICK', 'In Person Only', 'Chemistry', 'sunday', 'morning', '', 'again and '),
(26, 'dagfadfasdgasdga', 'adsfadfadfadsfasd', 'Year 10', 'adadgadsfsadfs', 2147483647, '54645634@aaa.com', 'Ellerslie', 'Only Online', 'Chemistry', 'undefined', 'undefined', '', ''),
(27, 'gaadfasd', 'adfadaga', 'Year 3', 'fafgadfs', 546245234, 'fgadfadsfa@aaa.com', 'sfdgs', 'In Person Only', 'Science', 'tuesday', 'afternoon_3,evening', '', 'dkajg;ajdkhahfsdkf;sja'),
(28, 'adsjl', 'alsdj', 'Year 3', 'asdjfa', 45245, 'asldfjaj@aa.com', 'ffasd', 'Only Online', 'Maths', 'monday', 'morning', 'this is a very long comment and I want to see if it fits in the column this is a very long comment and I want to see if it fits in the column this is a very long comment and I want to see if it fits in the column this is a very long comment and I want to see if it fits in the column ', ''),
(29, 'Jon', 'Doe', 'Year 2', 'Jane', 455454, 'jonjones@gmail.com', 'Onehunga', 'Only Online', 'Maths', 'monday', 'morning', 'What app do you use for online tutoring?', ''),
(30, 'ertwre', 'fdgad', 'Year 2', 'afga', 3413, 'afdad@aa.com', 'aerar', 'In Person Only', 'Maths', 'tuesday', 'afternoon_12', 'adfasd', ''),
(31, 'Lucy', 'Lu', 'Please Select', 'sfh', 211750722, 'lucylu90801@gmail.com', '1/31 Inkerman Street', 'In Person Only', 'Science', 'tuesday', 'afternoon_12', '', ''),
(32, 'Lucy', 'Lu', 'Year 1', 'Alice', 211750722, 'lucylu90801@gmail.com', '62 Willoughby Ave', 'In Person Only', 'Maths', 'tuesday', 'afternoon_12', '', ''),
(33, 'Lucy', 'Lu', 'Year 3', 'Alice', 211750722, 'lucylu90801@gmail.com', '62 Willoughby Ave', 'In Person Only', 'Maths', 'monday', 'morning', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(3) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject`, `price`) VALUES
(1, 'Science NCEA Level 1', 10),
(2, 'Chemistry NCEA Level 2', 20),
(3, 'Chemistry NCEA Level 3', 30);

-- --------------------------------------------------------

--
-- Table structure for table `times`
--

CREATE TABLE `times` (
  `time_id` int(3) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `class_time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `times`
--

INSERT INTO `times` (`time_id`, `subject_id`, `class_time`) VALUES
(1, 1, 'Monday 3pm'),
(2, 1, 'Tuesday 3pm'),
(3, 1, 'Wednesday 3pm'),
(4, 1, 'Thursday 3pm'),
(5, 1, 'Friday 3pm'),
(6, 2, 'Monday 4pm'),
(7, 2, 'Tuesday 4pm'),
(8, 2, 'Wednesday 4pm'),
(9, 2, 'Thursday 4pm'),
(10, 2, 'Friday 4pm'),
(11, 3, 'Monday 5pm'),
(12, 3, 'Tuesday 5pm'),
(13, 3, 'Wednesday 5pm'),
(14, 3, 'Thursday 5pm'),
(15, 3, 'Friday 5pm');

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `id` int(3) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`id`, `firstname`, `lastname`, `username`, `password`, `email`, `avatar_url`) VALUES
(1, 'Tom', 'T', 'tom', '1234', '', NULL),
(2, 'Ben', 'B', 'ben', '1234', '', NULL),
(5, 'Lucy', 'Lu', 'lulu', '1234', '', NULL),
(99, '', '', 'admin', '1111', '', NULL),
(101, 'joe', 'joe', 'joe', '1234', 'jojo@gmail.com', NULL),
(102, 'Bill', 'English', 'Bill', '123', 'bill.english@e22.com', NULL),
(103, 'Lucy', 'Lu', 'Camilla', '1234', 'lucylu90801@gmail.com', NULL),
(104, 'Lucy', 'Lu', 'Camilla', '1234', 'lucylu90801@gmail.com', NULL),
(105, 'Lucy', 'Lu', 'xxxx', '1234', 'lucylu90801@gmail.com', NULL),
(106, 'Lucy', 'Lu', 'aaaa', '1234', 'lucylu90801@gmail.com', NULL),
(107, 'Lucy', 'Lu', '6666', '1234', 'lucylu90801@gmail.com', NULL),
(108, 'Lucy', 'Lu', '333', '1234', 'lucylu90801@gmail.com', NULL),
(109, 'Lucy', 'Lu', '333', '1234', 'lucylu90801@gmail.com', NULL),
(110, 'wendy', 'wang', 'wendy', '0530', 'wlh0530@gmail.com', NULL),
(111, 'Lucy', 'Lu', 'aaaa', '1111', 'dydyd@nz.com', NULL),
(112, 'Reza', 'Siar', 'TheChosenOne', 'TheChosenOne', 'pmjoe34@gmail.com', NULL),
(113, 'Alice', 'Mason', 'alice', '1234', 'alice@aa.com', NULL),
(114, 'May', 'Mayday', 'mayday', '1234', 'mayday@aa.com', NULL),
(115, 'Alice', 'Mason', 'aa11', '1234', 'aa11@nz.com', NULL),
(116, 'Alice', 'Mason', 'aa11', '1234', 'aa11@nz.com', NULL),
(117, 'May', 'Smith', 'mays', '1234', 'mays@nz.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `enquire`
--
ALTER TABLE `enquire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
  ADD PRIMARY KEY (`time_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `enquire`
--
ALTER TABLE `enquire`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `time_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `usertable` (`id`);

--
-- Constraints for table `times`
--
ALTER TABLE `times`
  ADD CONSTRAINT `times_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
