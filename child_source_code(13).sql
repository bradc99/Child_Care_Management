-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2022 at 07:07 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `child_source_code`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `attendance_status` varchar(20) NOT NULL DEFAULT 'Absent',
  `attendance_date` date NOT NULL,
  `babysitter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `child_id`, `attendance_status`, `attendance_date`, `babysitter_id`) VALUES
(41, 19, 'Present', '2222-04-21', 9),
(42, 25, 'Present', '2222-04-21', 9),
(43, 23, 'Present', '2222-04-21', 9),
(44, 24, 'Present', '2222-04-21', 10),
(135, 24, 'Present', '2222-04-22', 9),
(136, 23, 'Present', '2222-04-22', 9),
(137, 25, 'Present', '2222-04-22', 9),
(138, 1, 'Present', '2222-04-22', 9),
(139, 4, 'Present', '2222-04-22', 9),
(140, 24, 'Absent', '2222-04-28', 10),
(141, 23, 'Present', '2222-04-28', 9),
(142, 25, 'Present', '2222-04-28', 10),
(143, 42, 'Absent', '2222-04-28', 10),
(144, 4, 'Present', '2222-04-28', 9),
(145, 22, 'Present', '2222-05-04', 12);

-- --------------------------------------------------------

--
-- Table structure for table `babysitter_details`
--

CREATE TABLE `babysitter_details` (
  `babysitter_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `babysitter_details`
--

INSERT INTO `babysitter_details` (`babysitter_id`, `meta_field`, `meta_value`) VALUES
(1, 'firstname', 'Claire'),
(1, 'middlename', 'C'),
(1, 'lastname', 'Blake'),
(1, 'gender', 'Female'),
(1, 'email', 'cblake@sample.com'),
(1, 'contact', '09123456789'),
(1, 'address', 'Here Street, There City, Anywhere, 1014'),
(1, 'skills', 'Achievement 101, Achievement 102, Achievement 103, Achievement 104, and Achievement 105'),
(1, 'years_experience', '5'),
(1, 'other', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id augue est. Praesent eu augue efficitur, sodales lacus eget, sagittis est. Praesent ultricies eleifend facilisis. Praesent maximus justo tellus, in pharetra nulla mollis ut. Interdum et malesuada fames ac ante ipsum primis in faucibus.'),
(1, 'firstname', 'Claire'),
(1, 'middlename', 'C'),
(1, 'lastname', 'Blake'),
(1, 'gender', 'Female'),
(1, 'email', 'cblake@sample.com'),
(1, 'contact', '09123456789'),
(1, 'address', 'Here Street, There City, Anywhere, 1014'),
(1, 'skills', 'Skill 101, Skill 102, Skill 103, Skill 104, and Skill 105'),
(1, 'years_experience', '5'),
(1, 'achievement', 'Achievement 101, Achievement 102, Achievement 103, Achievement 104, and Achievement 105'),
(1, 'other', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id augue est. Praesent eu augue efficitur, sodales lacus eget, sagittis est. Praesent ultricies eleifend facilisis. Praesent maximus justo tellus, in pharetra nulla mollis ut. Interdum et malesuada fames ac ante ipsum primis in faucibus.'),
(1, 'firstname', 'Claire'),
(1, 'middlename', 'C'),
(1, 'lastname', 'Blake'),
(1, 'gender', 'Female'),
(1, 'email', 'cblake@sample.com'),
(1, 'contact', '09123456789'),
(1, 'address', 'Here Street, There City, Anywhere, 1014'),
(1, 'skills', 'Skill 101, Skill 102, Skill 103, Skill 104, and Skill 105'),
(1, 'years_experience', '5'),
(1, 'achievement', 'Achievement 101, Achievement 102, Achievement 103, Achievement 104, and Achievement 105'),
(1, 'other', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id augue est. Praesent eu augue efficitur, sodales lacus eget, sagittis est. Praesent ultricies eleifend facilisis. Praesent maximus justo tellus, in pharetra nulla mollis ut. Interdum et malesuada fames ac ante ipsum primis in faucibus.'),
(2, 'firstname', 'Mark'),
(2, 'middlename', 'D'),
(2, 'lastname', 'Cooper'),
(2, 'gender', 'Male'),
(2, 'email', 'mcooper@sample.com'),
(2, 'contact', '09123456789'),
(2, 'address', 'Sample Address'),
(2, 'skills', 'Sample Skills'),
(2, 'years_experience', '2'),
(2, 'achievement', 'Sample Achievements'),
(2, 'other', 'Sample Other'),
(3, 'firstname', 'Samantha'),
(3, 'middlename', ''),
(3, 'lastname', 'Lou'),
(3, 'gender', 'Female'),
(3, 'email', 'slou@sample.com'),
(3, 'contact', '09786654499'),
(3, 'address', 'Sample Address 101'),
(3, 'skills', 'Sample Skills 101'),
(3, 'years_experience', '1'),
(3, 'achievement', 'Sample Achievements 101'),
(3, 'other', 'N/A'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(1, 'firstname', 'Claire'),
(1, 'middlename', 'C'),
(1, 'lastname', 'Blake'),
(1, 'gender', 'Female'),
(1, 'email', 'cblake@sample.com'),
(1, 'contact', '09123456789'),
(1, 'address', 'Here Street, There City, Anywhere, 1014'),
(1, 'skills', 'Skill 101, Skill 102, Skill 103, Skill 104, and Skill 105'),
(1, 'years_experience', '5'),
(1, 'achievement', 'Achievement 101, Achievement 102, Achievement 103, Achievement 104, and Achievement 105'),
(1, 'other', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id augue est. Praesent eu augue efficitur, sodales lacus eget, sagittis est. Praesent ultricies eleifend facilisis. Praesent maximus justo tellus, in pharetra nulla mollis ut. Interdum et malesuada fames ac ante ipsum primis in faucibus.'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'occupied_status', 'occupied'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'occupied_status', 'occupied'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'occupied_status', 'occupied'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'occupied_status', 'not_occupied'),
(4, 'firstname', 'Cynthia'),
(4, 'middlename', 'C'),
(4, 'lastname', 'Anthony'),
(4, 'gender', 'Female'),
(4, 'email', 'canthony@sample.com'),
(4, 'contact', '09875469999'),
(4, 'address', 'Sample Address 102'),
(4, 'skills', 'Sample Skill 102'),
(4, 'years_experience', '2'),
(4, 'achievement', 'Sample Achievements 102'),
(4, 'other', 'N/A'),
(4, 'occupied_status', 'occupied'),
(5, 'firstname', 'Claudia'),
(5, 'middlename', 'Ori Torres'),
(5, 'lastname', 'Mccray'),
(5, 'gender', 'Male'),
(5, 'email', 'cacej@mailinator.com'),
(5, 'contact', 'Sed quis reprehender'),
(5, 'address', 'Aliqua Tempora illo'),
(5, 'skills', 'Fuga Pariatur Debi'),
(5, 'years_experience', '1998'),
(5, 'achievement', 'Id a cupidatat et vi'),
(5, 'other', 'Est optio non exerc'),
(5, 'occupied_status', 'not_occupied'),
(5, 'firstname', 'Claudia'),
(5, 'middlename', 'Ori Torres'),
(5, 'lastname', 'Mccray'),
(5, 'gender', 'Male'),
(5, 'email', 'cacej@mailinator.com'),
(5, 'contact', 'Sed quis reprehender'),
(5, 'address', 'Aliqua Tempora illo'),
(5, 'skills', 'Fuga Pariatur Debi'),
(5, 'years_experience', '1998'),
(5, 'achievement', 'Id a cupidatat et vi'),
(5, 'other', 'Est optio non exerc'),
(5, 'occupied_status', 'not_occupied'),
(6, 'firstname', 'Kirk'),
(6, 'middlename', 'Keaton Mosley'),
(6, 'lastname', 'Lamb'),
(6, 'gender', 'Female'),
(6, 'email', 'zozugi@mailinator.com'),
(6, 'contact', 'Tempore qui perfere'),
(6, 'address', 'Dolore ipsum eum si'),
(6, 'skills', 'Quo sit amet iste d'),
(6, 'years_experience', '2016'),
(6, 'achievement', 'Ad aut sit repellend'),
(6, 'other', 'Qui fugiat repudian'),
(6, 'occupied_status', 'occupied'),
(7, 'firstname', 'Harding'),
(7, 'middlename', 'Baxter Alvarado'),
(7, 'lastname', 'Finley'),
(7, 'gender', 'Male'),
(7, 'email', 'gelef@mailinator.com'),
(7, 'contact', '54543453234'),
(7, 'address', 'Impedit pariatur V'),
(7, 'skills', 'Incidunt nostrum et'),
(7, 'years_experience', '-2'),
(7, 'achievement', 'Dolorem incididunt m'),
(7, 'other', 'Ea qui consequat Ir'),
(7, 'occupied_status', 'occupied'),
(7, 'firstname', 'Harding'),
(7, 'middlename', 'Baxter Alvarado'),
(7, 'lastname', 'Finley'),
(7, 'gender', 'Male'),
(7, 'email', 'gelef@mailinator.com'),
(7, 'contact', '54543453234'),
(7, 'address', 'Impedit pariatur V'),
(7, 'skills', 'Incidunt nostrum et'),
(7, 'years_experience', '-2'),
(7, 'achievement', 'Dolorem incididunt m'),
(7, 'other', 'Ea qui consequat Ir'),
(7, 'occupied_status', 'occupied'),
(7, 'firstname', 'Harding'),
(7, 'middlename', 'Baxter Alvarado'),
(7, 'lastname', 'Finley'),
(7, 'gender', 'Male'),
(7, 'email', 'gelef@mailinator.com'),
(7, 'contact', '54543453234'),
(7, 'address', 'Impedit pariatur V'),
(7, 'skills', 'Incidunt nostrum et'),
(7, 'years_experience', '-2'),
(7, 'achievement', 'Dolorem incididunt m'),
(7, 'other', 'Ea qui consequat Ir'),
(7, 'occupied_status', 'occupied'),
(7, 'firstname', 'Harding'),
(7, 'middlename', 'Baxter Alvarado'),
(7, 'lastname', 'Finley'),
(7, 'gender', 'Male'),
(7, 'email', 'gelef@mailinator.com'),
(7, 'contact', '54543453234'),
(7, 'address', 'Impedit pariatur V'),
(7, 'skills', 'Incidunt nostrum et'),
(7, 'years_experience', '-2'),
(7, 'achievement', 'Dolorem incididunt m'),
(7, 'other', 'Ea qui consequat Ir'),
(7, 'occupied_status', 'not_occupied'),
(7, 'firstname', 'Harding'),
(7, 'middlename', 'Baxter Alvarado'),
(7, 'lastname', 'Finley'),
(7, 'gender', 'Male'),
(7, 'email', 'gelef@mailinator.com'),
(7, 'contact', '54543453234'),
(7, 'address', 'Impedit pariatur V'),
(7, 'skills', 'Incidunt nostrum et'),
(7, 'years_experience', '-2'),
(7, 'achievement', 'Dolorem incididunt m'),
(7, 'other', 'Ea qui consequat Ir'),
(7, 'occupied_status', 'not_occupied'),
(8, 'firstname', 'Hope'),
(8, 'middlename', 'Garth Rush'),
(8, 'lastname', 'Fry'),
(8, 'gender', 'Male'),
(8, 'email', 'sepy@mailinator.com'),
(8, 'contact', 'Eos laboris autem v'),
(8, 'address', 'Deleniti quae debiti'),
(8, 'skills', 'Aut sint ea labore i'),
(8, 'years_experience', '1996'),
(8, 'achievement', 'Unde hic quae odio o'),
(8, 'other', 'Ex assumenda corpori'),
(8, 'occupied_status', 'occupied');

-- --------------------------------------------------------

--
-- Table structure for table `babysitter_enrollment`
--

CREATE TABLE `babysitter_enrollment` (
  `id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `babysitter_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateTime` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `babysitter_enrollment`
--

INSERT INTO `babysitter_enrollment` (`id`, `child_id`, `babysitter_id`, `date`, `time`, `entry_date`, `dateTime`) VALUES
(49, 9, 10, '2022-04-16', '16:00:00', '2022-04-18 04:06:44', '2022-04-15 16:00:00'),
(50, 20, 10, '2022-04-15', '16:00:00', '2022-04-18 04:06:48', '2022-04-15 16:00:00'),
(51, 24, 9, '2022-04-16', '10:00:00', '2022-04-18 04:06:50', '2022-04-15 16:00:00'),
(52, 22, 10, '2022-04-22', '13:00:00', '2022-04-22 15:46:58', NULL),
(53, 25, 10, '2022-04-17', '14:00:00', '2022-04-18 04:07:46', NULL),
(54, 27, 10, '2022-04-17', '16:00:00', '2022-04-18 04:07:02', '2022-04-17 16:00:00'),
(55, 23, 9, '2022-04-18', '15:00:00', '2022-04-18 04:07:05', '2022-04-18 15:00:00'),
(56, 7, 10, '2022-04-18', '15:00:00', '2022-04-18 04:07:09', '2022-04-18 15:00:00'),
(57, 25, 9, '2022-04-19', '14:00:00', '2022-04-18 04:07:14', '2022-04-19 14:00:00'),
(58, 5, 10, '2022-04-20', '16:00:00', '2022-04-18 04:07:19', '2022-04-20 16:00:00'),
(59, 1, 9, '2022-04-18', '10:00:00', '2022-04-18 04:00:59', '2022-04-18 10:00:00'),
(60, 4, 9, '2022-04-21', '10:00:00', '2022-04-21 04:44:06', '2022-04-21 10:00:00'),
(62, 27, 11, '2022-04-22', '10:00:00', '2022-04-22 14:46:51', '2022-04-22 10:00:00'),
(63, 42, 9, '2022-04-25', '10:00:00', '2022-04-24 06:45:07', '2022-04-24 10:00:00'),
(64, 4, 9, '2022-04-25', '10:00:00', '2022-04-25 14:13:30', '2022-04-25 10:00:00'),
(65, 4, 10, '2022-04-25', '15:00:00', '2022-04-25 15:20:09', '2022-04-25 15:00:00'),
(66, 4, 9, '2022-04-25', '11:00:00', '2022-04-25 16:01:51', '2022-04-25 11:00:00'),
(67, 22, 12, '2022-05-04', '12:00:00', '2022-05-04 14:52:34', '2022-05-04 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `babysitter_list`
--

CREATE TABLE `babysitter_list` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '50',
  `fullname` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `occupied_status` varchar(20) NOT NULL DEFAULT 'not_occupied',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `babysitter_list`
--

INSERT INTO `babysitter_list` (`id`, `code`, `fullname`, `status`, `occupied_status`, `date_created`, `date_updated`) VALUES
(1, 'BS-2021120001', 'Blake, Claire C', 1, 'occupied', '2021-12-14 11:45:43', '2022-04-08 19:28:06'),
(2, 'BS-2021120002', 'Cooper, Mark D', 1, 'occupied', '2021-12-14 13:14:42', '2022-04-08 19:28:06'),
(3, 'BS-2021120003', 'Lou, Samantha ', 1, 'not_occupied', '2021-12-14 13:16:46', '2022-03-19 21:39:13'),
(4, 'BS-2021120004', 'Anthony, Cynthia C', 1, 'occupied', '2021-12-14 13:18:13', '2022-04-08 19:28:06'),
(5, 'BS-2022030001', 'Mccray, Claudia Ori Torres', 1, 'not_occupied', '2022-03-19 21:14:41', '2022-03-19 21:14:41'),
(6, 'BS-2022030002', 'Lamb, Kirk Keaton Mosley', 1, 'not_occupied', '2022-03-19 22:03:05', '2022-04-15 16:52:49'),
(7, 'BS-2022040001', 'Finley, Harding Baxter Alvarado', 1, 'not_occupied', '2022-04-01 15:22:41', '2022-04-08 19:27:49'),
(8, 'BS-2022040002', 'Fry, Hope Garth Rush', 1, 'occupied', '2022-04-06 22:08:40', '2022-04-08 19:28:06');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(1, 9, 1, 4),
(3, 9, 4, 6),
(4, 9, 12, 2),
(9, 19, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'A Teether (with More!)', 'laptops'),
(2, 'A High-Contrast Toy', 'desktop-pc'),
(3, 'An Open-Ended Toy', 'tablets'),
(4, 'A Developmental Play Gym', ''),
(5, 'Shape Sorter with a Twist', '');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 11, 1, 2),
(22, 12, 14, 1),
(23, 13, 4, 1),
(24, 13, 17, 1),
(25, 14, 4, 1),
(26, 15, 1, 1),
(27, 15, 10, 1),
(28, 16, 13, 1),
(29, 17, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ecom_users`
--

CREATE TABLE `ecom_users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '0',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecom_users`
--

INSERT INTO `ecom_users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`, `updated_on`) VALUES
(1, 'admin@admin.com', '$2y$10$.X40iWquWIFi/05PCBzO9OixvIQpOPYN8UVleVsUwfglPdkkwXa3G', 1, 'Neovic', 'Devierte', '', '', 'facebook-profile-image.jpeg', 1, '', '', '2018-05-01', NULL),
(9, 'ndevierte@gmail.com', '$2y$10$V9QYhuCerNIIprq7WTPkqOTOid83VghciRlCHT.rBxbUHJGtmfHjC', 0, 'Neovic', 'Devierte', 'Silay City, Negros Occidental', '09092735719', 'facebook-profile-image.jpeg', 1, 'k8FBpynQfqsv', 'wzPGkX5IODlTYHg', '2018-05-09', NULL),
(11, 'test@gmail.com', '$2y$10$dvV7onY2bPSb9GBENwR57OixbBy3veerLtRt/FqnpoeyzV1h8x48K', 0, 'test1', 'test', 'test', 'test', '', 1, '', '', '2018-05-11', NULL),
(14, 'fyqehu@mailinator.com', '$2y$10$zW8CLjHMEWjLIG3T2vZM1eFe96SzIKOzUqYuAwEKiz8ubVRFApOX.', 0, 'Maggie', 'Dyer', '', '', '', 1, 'culTjovPGZkD', '', '2022-04-14', NULL),
(15, 'qinige@mailinator.com', '$2y$10$hRGy4bdH.O1412zONoMx6.enkRI.srwTPHRZEYjTvIBvzavs7oHkC', 0, 'Faith', 'Mcclure', '', '', '', 1, 'CQyBklWgPfFG', '', '2022-04-14', NULL),
(19, 'pasedodofa@mailinator.com', '$2y$10$HB21frvi9AVkz8XiahUneeARVuxA8/1CkYUQmYG0ivIngqXU1F6jq', 0, 'Minerva', 'Kline', '', '', '', 1, '', '', '2022-04-14', NULL),
(22, 'rylabe@mailinator.com', '$2y$10$275TkVfw/nFiop7LBzhXyucCR/OkrwNthxP8R3Omnn38acAQ1EOmu', 0, 'Scarlet', 'Bauer', '', '', '', 1, '', '', '2022-04-15', NULL),
(23, 'rymaxepe@mailinator.com', '$2y$10$Z2TxFjTFJAoHpN0YuslNIulAtL/UZnzryu199WDvmh.mZXn7Y4kjm', 0, 'Karina', 'Wyatt', '', '', '', 1, '', '', '2022-04-15', NULL),
(24, 'mamshad93@gmail.com', '$2y$10$BcGerIzAZMG2VPNzwpjbr.kyhOH93HHd0Q8cROYM11/M3EW93rF1i', 0, 'Bruce', 'Dillon', '', '', '', 1, '', 'gcdzSlTL1CfoMVr', '2022-04-15', NULL),
(25, 'dironah@mailinator.com', '$2y$10$JU.Xt/mAVSVQaTmQfebz3u5SK1kIuZBlEg8waFi8Ds0FUqWsUnOdC', 1, 'Delilah', 'Gross', '', '', '', 1, '', '', '2022-04-16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_details`
--

CREATE TABLE `enrollment_details` (
  `enrollment_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollment_details`
--

INSERT INTO `enrollment_details` (`enrollment_id`, `meta_field`, `meta_value`) VALUES
(4, 'child_firstname', 'Jhonny'),
(4, 'child_middlename', 'B'),
(4, 'child_lastname', 'Smith'),
(4, 'gender', 'Male'),
(4, 'child_dob', '2020-06-14'),
(4, 'parent_firstname', 'John'),
(4, 'parent_middlename', 'D'),
(4, 'parent_lastname', 'Smith'),
(4, 'parent_contact', '09123456789'),
(4, 'parent_email', 'jsmith@sample.com'),
(4, 'address', 'Sample Address Only'),
(4, 'child_fullname', 'Smith, Jhonny B'),
(4, 'parent_fullname', 'Smith, John D'),
(5, 'child_firstname', 'Zena'),
(5, 'child_middlename', 'Mary Mathews'),
(5, 'child_lastname', 'Calhoun'),
(5, 'gender', 'Female'),
(5, 'child_dob', '2002-04-01'),
(5, 'parent_firstname', 'Lani'),
(5, 'parent_middlename', 'Rahim Perez'),
(5, 'parent_lastname', 'Mccullough'),
(5, 'parent_contact', '433434'),
(5, 'parent_email', 'syta@mailinator.com'),
(5, 'address', 'Consequatur deleniti'),
(5, 'child_fullname', 'Calhoun, Zena Mary Mathews'),
(5, 'parent_fullname', 'Mccullough, Lani Rahim Perez'),
(6, 'child_firstname', 'Zena'),
(6, 'child_middlename', 'Mary Mathews'),
(6, 'child_lastname', 'Calhoun'),
(6, 'gender', 'Female'),
(6, 'child_dob', '2002-04-01'),
(6, 'parent_firstname', 'Lani'),
(6, 'parent_middlename', 'Rahim Perez'),
(6, 'parent_lastname', 'Mccullough'),
(6, 'parent_contact', '433434'),
(6, 'parent_email', 'syta@mailinator.com'),
(6, 'address', 'Consequatur deleniti'),
(6, 'child_fullname', 'Calhoun, Zena Mary Mathews'),
(6, 'parent_fullname', 'Mccullough, Lani Rahim Perez'),
(7, 'child_firstname', 'Leo'),
(7, 'child_middlename', 'Daquan Norton'),
(7, 'child_lastname', 'Baird'),
(7, 'gender', 'Female'),
(7, 'child_dob', '2018-05-12'),
(7, 'parent_firstname', 'Keegan'),
(7, 'parent_middlename', 'Allegra Gonzales'),
(7, 'parent_lastname', 'Ferrell'),
(7, 'parent_contact', 'Minim error corrupti'),
(7, 'parent_email', 'zecinytef@mailinator.com'),
(7, 'address', 'Omnis ad accusamus e'),
(7, 'child_fullname', 'Baird, Leo Daquan Norton'),
(7, 'parent_fullname', 'Ferrell, Keegan Allegra Gonzales'),
(9, 'child_firstname', 'Prescott'),
(9, 'child_middlename', 'Sage Banks'),
(9, 'child_lastname', 'Mcguire'),
(9, 'gender', 'Female'),
(9, 'child_dob', '2015-10-20'),
(9, 'parent_firstname', 'Jolie'),
(9, 'parent_middlename', 'Jade Logan'),
(9, 'parent_lastname', 'Terry'),
(9, 'parent_contact', 'Quis odio itaque qui'),
(9, 'parent_email', 'cubufop@mailinator.com'),
(9, 'car_models', '1'),
(9, 'address', 'Qui sit non maiores'),
(9, 'child_fullname', 'Mcguire, Prescott Sage Banks'),
(9, 'parent_fullname', 'Terry, Jolie Jade Logan'),
(17, 'child_firstname', 'Hunter'),
(17, 'child_middlename', 'Lillith Owens'),
(17, 'child_lastname', 'Gallagher'),
(17, 'gender', 'Male'),
(17, 'child_dob', '2009-09-07'),
(17, 'parent_firstname', 'Kareem'),
(17, 'parent_middlename', 'Eugenia Christian'),
(17, 'parent_lastname', 'Jenkins'),
(17, 'parent_contact', 'Earum sed perferendi'),
(17, 'parent_email', 'nane@mailinator.com'),
(17, 'babysitter_id', '4'),
(17, 'address', 'Est qui laborum Ut '),
(17, 'child_fullname', 'Gallagher, Hunter Lillith Owens'),
(17, 'parent_fullname', 'Jenkins, Kareem Eugenia Christian'),
(18, 'child_firstname', 'Sebastian'),
(18, 'child_middlename', 'Sara Guzman'),
(18, 'child_lastname', 'Hobbs'),
(18, 'gender', 'Male'),
(18, 'child_dob', '1993-08-14'),
(18, 'parent_firstname', 'Shannon'),
(18, 'parent_middlename', 'Daphne Pace'),
(18, 'parent_lastname', 'Browning'),
(18, 'parent_contact', 'Qui omnis fugiat rep'),
(18, 'parent_email', 'jicezuqo@mailinator.com'),
(18, 'babysitter_id', '3'),
(18, 'address', 'Rerum qui et illum '),
(18, 'child_fullname', 'Hobbs, Sebastian Sara Guzman'),
(18, 'parent_fullname', 'Browning, Shannon Daphne Pace'),
(19, 'child_firstname', 'Chanda'),
(19, 'child_middlename', 'Kim Fisher'),
(19, 'child_lastname', 'Burns'),
(19, 'gender', 'Female'),
(19, 'child_dob', '2006-06-25'),
(19, 'parent_firstname', 'Wallace'),
(19, 'parent_middlename', 'Baker Floyd'),
(19, 'parent_lastname', 'Drake'),
(19, 'parent_contact', 'Odit ipsa doloremqu'),
(19, 'parent_email', 'nymijo@mailinator.com'),
(19, 'babysitter_id', '5'),
(19, 'address', 'Incididunt reprehend'),
(19, 'child_fullname', 'Burns, Chanda Kim Fisher'),
(19, 'parent_fullname', 'Drake, Wallace Baker Floyd'),
(20, 'child_firstname', 'Iliana'),
(20, 'child_middlename', 'Wade Wagner'),
(20, 'child_lastname', 'Simmons'),
(20, 'gender', 'Male'),
(20, 'child_dob', '1971-08-22'),
(20, 'parent_firstname', 'Plato'),
(20, 'parent_middlename', 'Rebecca Green'),
(20, 'parent_lastname', 'Hopper'),
(20, 'parent_contact', 'Delectus enim sed c'),
(20, 'parent_email', 'dudozubab@mailinator.com'),
(20, 'babysitter_id', '5'),
(20, 'address', 'Esse ut deserunt et'),
(20, 'child_fullname', 'Simmons, Iliana Wade Wagner'),
(20, 'parent_fullname', 'Hopper, Plato Rebecca Green'),
(21, 'child_firstname', 'Shelley'),
(21, 'child_middlename', 'Igor Kinney'),
(21, 'child_lastname', 'Ellison'),
(21, 'gender', 'Female'),
(21, 'child_dob', '1976-12-15'),
(21, 'parent_firstname', 'Lana'),
(21, 'parent_middlename', 'Julian Kennedy'),
(21, 'parent_lastname', 'Nash'),
(21, 'parent_contact', 'Rerum dolorum illo n'),
(21, 'parent_email', 'buko@mailinator.com'),
(21, 'babysitter_id', '5'),
(21, 'address', 'Maiores quae delectu'),
(21, 'child_fullname', 'Ellison, Shelley Igor Kinney'),
(21, 'parent_fullname', 'Nash, Lana Julian Kennedy'),
(22, 'child_firstname', 'Ulla'),
(22, 'child_middlename', 'Griffin Frazier'),
(22, 'child_lastname', 'Sutton'),
(22, 'gender', 'Female'),
(22, 'child_dob', '2017-03-25'),
(22, 'parent_firstname', 'Bruno'),
(22, 'parent_middlename', 'Amal Schmidt'),
(22, 'parent_lastname', 'Fitzpatrick'),
(22, 'parent_contact', 'Lorem laboris ipsa '),
(22, 'parent_email', 'viwe@mailinator.com'),
(22, 'babysitter_id', '4'),
(22, 'address', 'Assumenda temporibus'),
(22, 'child_fullname', 'Sutton, Ulla Griffin Frazier'),
(22, 'parent_fullname', 'Fitzpatrick, Bruno Amal Schmidt'),
(23, 'child_firstname', 'Selma'),
(23, 'child_middlename', 'Tatum Vasquez'),
(23, 'child_lastname', 'Anderson'),
(23, 'gender', 'Female'),
(23, 'child_dob', '1987-11-17'),
(23, 'parent_firstname', 'Eleanor'),
(23, 'parent_middlename', 'Gemma Dawson'),
(23, 'parent_lastname', 'Cross'),
(23, 'parent_contact', 'Et ut minima atque a'),
(23, 'parent_email', 'lesiva@mailinator.com'),
(23, 'babysitter_id', '3'),
(23, 'address', 'Esse repudiandae vel'),
(23, 'child_fullname', 'Anderson, Selma Tatum Vasquez'),
(23, 'parent_fullname', 'Cross, Eleanor Gemma Dawson'),
(24, 'child_firstname', 'Raya'),
(24, 'child_middlename', 'Tallulah Burgess'),
(24, 'child_lastname', 'Beasley'),
(24, 'gender', 'Female'),
(24, 'child_dob', '1976-05-10'),
(24, 'parent_firstname', 'Emmanuel'),
(24, 'parent_middlename', 'Yuli Cline'),
(24, 'parent_lastname', 'Hensley'),
(24, 'parent_contact', 'Exercitationem reici'),
(24, 'parent_email', 'vofexukala@mailinator.com'),
(24, 'babysitter_id', '5'),
(24, 'address', 'Inventore excepteur '),
(24, 'child_fullname', 'Beasley, Raya Tallulah Burgess'),
(24, 'parent_fullname', 'Hensley, Emmanuel Yuli Cline'),
(25, 'child_firstname', 'Benjamin'),
(25, 'child_middlename', 'Castor Gardner'),
(25, 'child_lastname', 'Davis'),
(25, 'gender', 'Female'),
(25, 'child_dob', '1987-07-04'),
(25, 'parent_firstname', 'Baker'),
(25, 'parent_middlename', 'Amos Hill'),
(25, 'parent_lastname', 'Richard'),
(25, 'parent_contact', 'In laboriosam totam'),
(25, 'parent_email', 'hytopykyqa@mailinator.com'),
(25, 'babysitter_id', '5'),
(25, 'address', 'Autem reprehenderit'),
(25, 'child_fullname', 'Davis, Benjamin Castor Gardner'),
(25, 'parent_fullname', 'Richard, Baker Amos Hill'),
(27, 'child_firstname', 'Alisa'),
(27, 'child_middlename', 'Xavier Allison'),
(27, 'child_lastname', 'Cooley'),
(27, 'gender', 'Male'),
(27, 'child_dob', '1997-10-03'),
(27, 'parent_firstname', 'Sydnee'),
(27, 'parent_middlename', 'Forrest Franco'),
(27, 'parent_lastname', 'Dotson'),
(27, 'parent_contact', 'Corporis voluptas qu'),
(27, 'parent_email', 'bepelyne@mailinator.com'),
(27, 'address', 'Laudantium exercita'),
(27, 'child_fullname', 'Cooley, Alisa Xavier Allison'),
(27, 'parent_fullname', 'Dotson, Sydnee Forrest Franco'),
(28, 'child_firstname', 'Blythe'),
(28, 'child_middlename', 'Clarke Chase'),
(28, 'child_lastname', 'Gardner'),
(28, 'gender', 'Male'),
(28, 'child_dob', '1988-10-12'),
(28, 'parent_firstname', 'Fitzgerald'),
(28, 'parent_middlename', 'Kirk Hurley'),
(28, 'parent_lastname', 'Donovan'),
(28, 'parent_contact', 'Optio consequat No'),
(28, 'parent_email', 'nefiju@mailinator.com'),
(28, 'address', 'Eveniet voluptates '),
(28, 'child_fullname', 'Gardner, Blythe Clarke Chase'),
(28, 'parent_fullname', 'Donovan, Fitzgerald Kirk Hurley'),
(29, 'child_firstname', 'Sheila'),
(29, 'child_middlename', 'Rhoda Ochoa'),
(29, 'child_lastname', 'Carver'),
(29, 'gender', 'Male'),
(29, 'child_dob', '2006-09-17'),
(29, 'parent_firstname', 'Lacy'),
(29, 'parent_middlename', 'Catherine Figueroa'),
(29, 'parent_lastname', 'Horn'),
(29, 'parent_contact', 'Molestiae voluptatem'),
(29, 'parent_email', 'cicefeky@mailinator.com'),
(29, 'address', 'Proident sequi labo'),
(29, 'child_fullname', 'Carver, Sheila Rhoda Ochoa'),
(29, 'parent_fullname', 'Horn, Lacy Catherine Figueroa'),
(30, 'child_firstname', 'Thaddeus'),
(30, 'child_middlename', 'Rama Jenkins'),
(30, 'child_lastname', 'Rodgers'),
(30, 'gender', 'Male'),
(30, 'child_dob', '2003-05-07'),
(30, 'parent_firstname', 'Wayne'),
(30, 'parent_middlename', 'Lane Dale'),
(30, 'parent_lastname', 'Potts'),
(30, 'parent_contact', 'Sit ullam et sunt r'),
(30, 'parent_email', 'dyhetowu@mailinator.com'),
(30, 'address', 'Aut unde et dolores '),
(30, 'child_fullname', 'Rodgers, Thaddeus Rama Jenkins'),
(30, 'parent_fullname', 'Potts, Wayne Lane Dale'),
(31, 'child_firstname', 'Alden'),
(31, 'child_middlename', 'Idona Salinas'),
(31, 'child_lastname', 'Campos'),
(31, 'gender', 'Female'),
(31, 'child_dob', '1995-05-01'),
(31, 'parent_firstname', 'Wyoming'),
(31, 'parent_middlename', 'Teagan Franklin'),
(31, 'parent_lastname', 'Saunders'),
(31, 'parent_contact', 'Aut quam placeat re'),
(31, 'parent_email', 'qykipepoti@mailinator.com'),
(31, 'address', 'Rerum proident in i'),
(31, 'child_fullname', 'Campos, Alden Idona Salinas'),
(31, 'parent_fullname', 'Saunders, Wyoming Teagan Franklin'),
(33, 'child_firstname', 'Garth'),
(33, 'child_middlename', 'Macaulay Roth'),
(33, 'child_lastname', 'Lynch'),
(33, 'gender', 'Female'),
(33, 'child_dob', '1994-03-14'),
(33, 'parent_firstname', 'Zeph'),
(33, 'parent_middlename', 'Daphne Daniel'),
(33, 'parent_lastname', 'Spencer'),
(33, 'parent_contact', 'Modi ut dolores et a'),
(33, 'parent_email', 'marexituci@mailinator.com'),
(33, 'address', 'Earum incididunt nem'),
(33, 'child_fullname', 'Lynch, Garth Macaulay Roth'),
(33, 'parent_fullname', 'Spencer, Zeph Daphne Daniel'),
(34, 'child_firstname', 'James'),
(34, 'child_middlename', 'Keefe Berger'),
(34, 'child_lastname', 'Compton'),
(34, 'gender', 'Female'),
(34, 'child_dob', '1978-12-02'),
(34, 'parent_firstname', 'Jada'),
(34, 'parent_middlename', 'Oscar Gordon'),
(34, 'parent_lastname', 'Schwartz'),
(34, 'parent_contact', 'Amet quae iure cons'),
(34, 'parent_email', 'lihy@mailinator.com'),
(34, 'address', 'Hic sint temporibus '),
(34, 'child_fullname', 'Compton, James Keefe Berger'),
(34, 'parent_fullname', 'Schwartz, Jada Oscar Gordon'),
(35, 'child_firstname', 'Melyssa'),
(35, 'child_middlename', 'Cailin Raymond'),
(35, 'child_lastname', 'Henderson'),
(35, 'gender', 'Male'),
(35, 'child_dob', '1980-11-08'),
(35, 'parent_firstname', 'Herrod'),
(35, 'parent_middlename', 'Yasir Zimmerman'),
(35, 'parent_lastname', 'Cooke'),
(35, 'parent_contact', 'Repellendus Adipisi'),
(35, 'parent_email', 'caxony@mailinator.com'),
(35, 'address', 'Libero est accusamus'),
(35, 'child_fullname', 'Henderson, Melyssa Cailin Raymond'),
(35, 'parent_fullname', 'Cooke, Herrod Yasir Zimmerman'),
(38, 'child_firstname', 'Hakeem'),
(38, 'child_middlename', 'Kellie Navarro'),
(38, 'child_lastname', 'Beasley'),
(38, 'gender', 'Female'),
(38, 'child_dob', '2000-01-26'),
(38, 'parent_firstname', 'Sybil'),
(38, 'parent_middlename', 'Jack Head'),
(38, 'parent_lastname', 'Carson'),
(38, 'parent_contact', 'Dolor dolor mollit l'),
(38, 'parent_email', 'fulilucox@mailinator.com'),
(38, 'address', 'Porro fugiat unde c'),
(38, 'child_fullname', 'Beasley, Hakeem Kellie Navarro'),
(38, 'parent_fullname', 'Carson, Sybil Jack Head'),
(39, 'child_firstname', 'Ivan'),
(39, 'child_middlename', 'Janna Riddle'),
(39, 'child_lastname', 'Bolton'),
(39, 'gender', 'Female'),
(39, 'child_dob', '2008-07-04'),
(39, 'parent_firstname', 'Gay'),
(39, 'parent_middlename', 'Quintessa Flowers'),
(39, 'parent_lastname', 'Gross'),
(39, 'parent_contact', 'In consequatur vel '),
(39, 'parent_email', 'jyfu@mailinator.com'),
(39, 'address', 'Perspiciatis duis c'),
(39, 'child_fullname', 'Bolton, Ivan Janna Riddle'),
(39, 'parent_fullname', 'Gross, Gay Quintessa Flowers'),
(41, 'child_firstname', 'Hayes'),
(41, 'child_middlename', 'Xenos Sparks'),
(41, 'child_lastname', 'Logan'),
(41, 'gender', 'Female'),
(41, 'child_dob', '1997-01-27'),
(41, 'parent_firstname', 'Janna'),
(41, 'parent_middlename', 'Rhoda Mcgowan'),
(41, 'parent_lastname', 'Mcknight'),
(41, 'parent_contact', 'Laboris eiusmod comm'),
(41, 'parent_email', 'vupef@mailinator.com'),
(41, 'address', 'Et tempore officiis'),
(41, 'child_fullname', 'Logan, Hayes Xenos Sparks'),
(41, 'parent_fullname', 'Mcknight, Janna Rhoda Mcgowan'),
(42, 'child_firstname', 'Connor'),
(42, 'child_middlename', 'Wing Mullins'),
(42, 'child_lastname', 'Clay'),
(42, 'gender', 'Female'),
(42, 'child_dob', '1986-06-06'),
(42, 'parent_firstname', 'Quin'),
(42, 'parent_middlename', 'Mara Espinoza'),
(42, 'parent_lastname', 'Robbins'),
(42, 'parent_contact', 'Alias aut aliquam om'),
(42, 'parent_email', 'hececanu@mailinator.com'),
(42, 'address', 'Eveniet sed ratione'),
(42, 'child_fullname', 'Clay, Connor Wing Mullins'),
(42, 'parent_fullname', 'Robbins, Quin Mara Espinoza'),
(125, 'child_firstname', 'Hyacinth'),
(125, 'child_middlename', 'Benedict Knapp'),
(125, 'child_lastname', 'Donaldson'),
(125, 'gender', 'Male'),
(125, 'child_dob', '1997-03-22'),
(125, 'parent_firstname', 'Lana'),
(125, 'parent_middlename', 'Cruz Moran'),
(125, 'parent_lastname', 'Mcclure'),
(125, 'parent_contact', 'Dolor dolor nostrum '),
(125, 'parent_email', 'tenowyka@mailinator.com'),
(125, 'address', 'Eligendi aspernatur '),
(125, 'child_fullname', 'Donaldson, Hyacinth Benedict Knapp'),
(125, 'parent_fullname', 'Mcclure, Lana Cruz Moran'),
(141, 'child_firstname', 'Julie'),
(141, 'child_middlename', 'Jordan Green'),
(141, 'child_lastname', 'Jennings'),
(141, 'gender', 'Male'),
(141, 'child_dob', '2000-09-27'),
(141, 'parent_firstname', 'Christen'),
(141, 'parent_middlename', 'Geraldine Conway'),
(141, 'parent_lastname', 'Chan'),
(141, 'parent_contact', 'Voluptatem impedit '),
(141, 'parent_email', 'vubykyqy@mailinator.com'),
(141, 'address', 'Dolorum quas numquam'),
(141, 'child_fullname', 'Jennings, Julie Jordan Green'),
(141, 'parent_fullname', 'Chan, Christen Geraldine Conway'),
(155, 'child_firstname', 'Miriam'),
(155, 'child_middlename', 'Mercedes Wood'),
(155, 'child_lastname', 'Glass'),
(155, 'gender', 'Male'),
(155, 'child_dob', '1975-03-23'),
(155, 'parent_firstname', 'Judith'),
(155, 'parent_middlename', 'Benjamin Cantrell'),
(155, 'parent_lastname', 'Mcfarland'),
(155, 'parent_contact', 'Officiis consectetur'),
(155, 'parent_email', 'larizubox@mailinator.com'),
(155, 'address', 'Sit quam sit ea et '),
(155, 'child_fullname', 'Glass, Miriam Mercedes Wood'),
(155, 'parent_fullname', 'Mcfarland, Judith Benjamin Cantrell'),
(156, 'child_firstname', 'Claudia'),
(156, 'child_middlename', 'Yuri Singleton'),
(156, 'child_lastname', 'Alvarado'),
(156, 'gender', 'Female'),
(156, 'child_dob', '1972-08-12'),
(156, 'parent_firstname', 'Walker'),
(156, 'parent_middlename', 'Yardley Vasquez'),
(156, 'parent_lastname', 'Page'),
(156, 'parent_contact', 'Animi nemo nihil fa'),
(156, 'parent_email', 'badexiraja@mailinator.com'),
(156, 'address', 'Labore et laboriosam'),
(156, 'child_fullname', 'Alvarado, Claudia Yuri Singleton'),
(156, 'parent_fullname', 'Page, Walker Yardley Vasquez'),
(167, 'child_firstname', 'Orson'),
(167, 'child_middlename', 'Kirk Delacruz'),
(167, 'child_lastname', 'Odom'),
(167, 'gender', 'Male'),
(167, 'child_dob', '1980-03-24'),
(167, 'parent_firstname', 'Yardley'),
(167, 'parent_middlename', 'Valentine Delgado'),
(167, 'parent_lastname', 'Lara'),
(167, 'parent_contact', 'Cupiditate eius quae'),
(167, 'parent_email', 'fonyhanal@mailinator.com'),
(167, 'address', ''),
(167, 'child_fullname', 'Odom, Orson Kirk Delacruz'),
(167, 'parent_fullname', 'Lara, Yardley Valentine Delgado'),
(168, 'child_firstname', 'Cara'),
(168, 'child_middlename', 'Trevor Chandler'),
(168, 'child_lastname', 'Day'),
(168, 'gender', 'Female'),
(168, 'child_dob', '1992-05-28'),
(168, 'parent_firstname', 'Katell'),
(168, 'parent_middlename', ''),
(168, 'parent_lastname', 'Brock'),
(168, 'parent_contact', 'Eaque do sed aliquam'),
(168, 'parent_email', 'qolobopoqo@mailinator.com'),
(168, 'address', 'Dolor rerum et exped'),
(168, 'child_fullname', 'Day, Cara Trevor Chandler'),
(168, 'parent_fullname', 'Brock, Katell '),
(169, 'child_firstname', 'Galvin'),
(169, 'child_middlename', 'Lana Townsend'),
(169, 'child_lastname', 'Rollins'),
(169, 'gender', 'Female'),
(169, 'child_dob', '1986-09-08'),
(169, 'parent_firstname', 'Keith'),
(169, 'parent_middlename', 'Buffy Murray'),
(169, 'parent_lastname', 'Wilkerson'),
(169, 'parent_contact', 'Eiusmod est laudanti'),
(169, 'parent_email', 'dano@mailinator.com'),
(169, 'address', 'In aliquam eum quae '),
(169, 'child_fullname', 'Rollins, Galvin Lana Townsend'),
(169, 'parent_fullname', 'Wilkerson, Keith Buffy Murray'),
(170, 'child_firstname', 'Brooke'),
(170, 'child_middlename', 'Zachery Wynn'),
(170, 'child_lastname', 'Peterson'),
(170, 'gender', 'Male'),
(170, 'child_dob', '1996-01-20'),
(170, 'parent_firstname', 'Ahmed'),
(170, 'parent_middlename', 'Stewart Humphrey'),
(170, 'parent_lastname', 'Boyer'),
(170, 'parent_contact', 'Repellendus Et earu'),
(170, 'parent_email', 'sawuhini@mailinator.com'),
(170, 'address', 'Minus velit eligend'),
(170, 'child_fullname', 'Peterson, Brooke Zachery Wynn'),
(170, 'parent_fullname', 'Boyer, Ahmed Stewart Humphrey'),
(171, 'child_firstname', 'Benjamin'),
(171, 'child_middlename', 'Alexandra Garner'),
(171, 'child_lastname', 'Gould'),
(171, 'gender', 'Female'),
(171, 'child_dob', '2022-06-04'),
(171, 'parent_firstname', 'Vivian'),
(171, 'parent_middlename', 'Bert Sampson'),
(171, 'parent_lastname', 'Wise'),
(171, 'parent_contact', 'Rem obcaecati optio'),
(171, 'parent_email', 'fota@mailinator.com'),
(171, 'address', 'Possimus nostrud li'),
(171, 'child_fullname', 'Gould, Benjamin Alexandra Garner'),
(171, 'parent_fullname', 'Wise, Vivian Bert Sampson'),
(172, 'child_firstname', 'Sybill'),
(172, 'child_middlename', 'Amethyst Blackburn'),
(172, 'child_lastname', 'Silva'),
(172, 'gender', 'Male'),
(172, 'child_dob', '1996-03-09'),
(172, 'parent_firstname', 'Macaulay'),
(172, 'parent_middlename', 'Alvin Rivas'),
(172, 'parent_lastname', 'Bullock'),
(172, 'parent_contact', 'Doloremque ad ut est'),
(172, 'parent_email', 'cerupacex@mailinator.com'),
(172, 'address', 'Qui est ratione qui'),
(172, 'child_fullname', 'Silva, Sybill Amethyst Blackburn'),
(172, 'parent_fullname', 'Bullock, Macaulay Alvin Rivas'),
(173, 'child_firstname', 'Garrison'),
(173, 'child_middlename', 'Hyacinth Mcpherson'),
(173, 'child_lastname', 'Tucker'),
(173, 'gender', 'Female'),
(173, 'child_dob', '2020-08-19'),
(173, 'parent_firstname', 'Louis'),
(173, 'parent_middlename', 'Victoria Becker'),
(173, 'parent_lastname', 'Merritt'),
(173, 'parent_contact', 'Ut suscipit dolor pr'),
(173, 'parent_email', 'xycolad@mailinator.com'),
(173, 'address', 'Doloribus deleniti a'),
(173, 'child_fullname', 'Tucker, Garrison Hyacinth Mcpherson'),
(173, 'parent_fullname', 'Merritt, Louis Victoria Becker'),
(174, 'child_firstname', 'Ciaran'),
(174, 'child_middlename', 'Ariel Juarez'),
(174, 'child_lastname', 'Russo'),
(174, 'gender', 'Female'),
(174, 'child_dob', '1988-02-09'),
(174, 'parent_firstname', 'Darafffff'),
(174, 'parent_middlename', 'Orson Velez'),
(174, 'parent_lastname', 'Mckee'),
(174, 'parent_contact', 'Qui odit dolorum sit'),
(174, 'parent_email', 'cepolec@mailinator.com'),
(174, 'address', 'Ex et animi rerum s'),
(174, 'child_fullname', 'Russo, Ciaran Ariel Juarez'),
(174, 'parent_fullname', 'Mckee, Darafffff Orson Velez'),
(175, 'child_firstname', 'Geraldine'),
(175, 'child_middlename', 'Leslie Chandler'),
(175, 'child_lastname', 'Strickland'),
(175, 'gender', 'Female'),
(175, 'child_dob', '2000-07-08'),
(175, 'parent_firstname', 'Shoshana'),
(175, 'parent_middlename', 'Alma Terry'),
(175, 'parent_lastname', 'Salinas'),
(175, 'parent_contact', 'Sed ullam non anim a'),
(175, 'parent_email', 'vopanywelu@mailinator.com'),
(175, 'address', 'Ut officia quo elige'),
(175, 'child_fullname', 'Strickland, Geraldine Leslie Chandler'),
(175, 'parent_fullname', 'Salinas, Shoshana Alma Terry');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_list`
--

CREATE TABLE `enrollment_list` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `child_fullname` text NOT NULL,
  `parent_fullname` text NOT NULL,
  `babysitter_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollment_list`
--

INSERT INTO `enrollment_list` (`id`, `code`, `child_fullname`, `parent_fullname`, `babysitter_id`, `status`, `date_created`, `date_updated`) VALUES
(4, 'KNE-2021120001', 'Smith, Jhonny B', 'Smith, John D', 2, 1, '2021-12-14 15:58:57', '2022-03-19 14:13:59'),
(5, 'TAM-2022030001', 'Calhoun, Zena Mary Mathews', 'Mccullough, Lani Rahim Perez', 4, 1, '2022-03-19 10:55:22', '2022-03-19 14:14:04'),
(6, 'XTV-2022030001', 'Calhoun, Zena Mary Mathews', 'Mccullough, Lani Rahim Perez', 2, 1, '2022-03-19 10:55:30', '2022-03-19 14:14:09'),
(7, 'HRW-2022030001', 'Baird, Leo Daquan Norton', 'Ferrell, Keegan Allegra Gonzales', 1, 1, '2022-03-19 10:57:44', '2022-03-19 14:14:13'),
(9, 'ALY-2022030001', 'Mcguire, Prescott Sage Banks', 'Terry, Jolie Jade Logan', 1, 1, '2022-03-19 15:45:44', '2022-03-19 20:41:40'),
(17, 'XBV-2022030002', 'Gallagher, Hunter Lillith Owens', 'Jenkins, Kareem Eugenia Christian', 4, 1, '2022-03-19 16:25:23', '2022-04-01 15:30:52'),
(18, 'RBH-2022030001', 'Hobbs, Sebastian Sara Guzman', 'Browning, Shannon Daphne Pace', 3, 1, '2022-03-19 16:30:58', '2022-04-01 15:30:57'),
(19, 'HXE-2022030001', 'Burns, Chanda Kim Fisher', 'Drake, Wallace Baker Floyd', 5, 1, '2022-03-19 21:15:26', '2022-04-01 15:31:05'),
(20, 'BAP-2022030001', 'Simmons, Iliana Wade Wagner', 'Hopper, Plato Rebecca Green', 5, 1, '2022-03-19 21:16:34', '2022-04-01 15:31:11'),
(21, 'QFC-2022030001', 'Ellison, Shelley Igor Kinney', 'Nash, Lana Julian Kennedy', 5, 1, '2022-03-19 21:17:15', '2022-04-01 15:31:16'),
(22, 'IPZ-2022030001', 'Sutton, Ulla Griffin Frazier', 'Fitzpatrick, Bruno Amal Schmidt', 4, 1, '2022-03-19 21:18:50', '2022-04-01 15:31:24'),
(23, 'PDU-2022030001', 'Anderson, Selma Tatum Vasquez', 'Cross, Eleanor Gemma Dawson', 3, 1, '2022-03-25 16:51:15', '2022-04-01 15:31:31'),
(24, 'BJR-2022040001', 'Beasley, Raya Tallulah Burgess', 'Hensley, Emmanuel Yuli Cline', 5, 1, '2022-04-03 12:10:49', '2022-04-15 17:21:22'),
(25, 'PIB-2022040001', 'Davis, Benjamin Castor Gardner', 'Richard, Baker Amos Hill', 5, 1, '2022-04-03 12:54:41', '2022-04-18 11:47:24'),
(27, 'DNA-2022040001', 'Cooley, Alisa Xavier Allison', 'Dotson, Sydnee Forrest Franco', NULL, 1, '2022-04-09 11:21:23', '2022-04-18 11:47:30'),
(28, 'JZA-2022040001', 'Gardner, Blythe Clarke Chase', 'Donovan, Fitzgerald Kirk Hurley', NULL, 1, '2022-04-09 11:21:41', '2022-04-15 17:21:14'),
(29, 'MTE-2022040001', 'Carver, Sheila Rhoda Ochoa', 'Horn, Lacy Catherine Figueroa', NULL, 1, '2022-04-20 21:33:05', '2022-04-21 10:45:48'),
(30, 'OFL-2022040001', 'Rodgers, Thaddeus Rama Jenkins', 'Potts, Wayne Lane Dale', NULL, 1, '2022-04-21 20:01:49', '2022-04-24 12:14:24'),
(31, 'QRO-2022040001', 'Campos, Alden Idona Salinas', 'Saunders, Wyoming Teagan Franklin', NULL, 0, '2022-04-23 15:35:50', '2022-04-23 15:35:50'),
(33, 'DKU-2022040001', 'Lynch, Garth Macaulay Roth', 'Spencer, Zeph Daphne Daniel', NULL, 1, '2022-04-23 16:15:45', '2022-04-23 16:15:45'),
(34, 'JWI-2022040001', 'Compton, James Keefe Berger', 'Schwartz, Jada Oscar Gordon', NULL, 1, '2022-04-24 10:40:33', '2022-04-24 10:40:33'),
(35, 'VWG-2022040001', 'Henderson, Melyssa Cailin Raymond', 'Cooke, Herrod Yasir Zimmerman', NULL, 1, '2022-04-24 11:43:45', '2022-04-24 11:43:45'),
(38, 'LGN-2022040001', 'Beasley, Hakeem Kellie Navarro', 'Carson, Sybil Jack Head', NULL, 1, '2022-04-24 11:45:57', '2022-04-24 11:45:57'),
(39, 'RDQ-2022040001', 'Bolton, Ivan Janna Riddle', 'Gross, Gay Quintessa Flowers', NULL, 1, '2022-04-24 11:48:40', '2022-04-24 11:48:40'),
(41, 'BFK-2022040001', 'Logan, Hayes Xenos Sparks', 'Mcknight, Janna Rhoda Mcgowan', NULL, 1, '2022-04-24 12:40:51', '2022-04-24 12:40:51'),
(42, 'LBF-2022040001', 'Clay, Connor Wing Mullins', 'Robbins, Quin Mara Espinoza', NULL, 1, '2022-04-24 12:42:05', '2022-04-24 12:42:05'),
(125, 'KUZ-2022040001', 'Donaldson, Hyacinth Benedict Knapp', 'Mcclure, Lana Cruz Moran', NULL, 1, '2022-04-24 13:20:02', '2022-04-24 13:20:02'),
(141, 'BIG-2022040001', 'Jennings, Julie Jordan Green', 'Chan, Christen Geraldine Conway', NULL, 1, '2022-04-24 13:57:31', '2022-04-24 13:57:31'),
(155, 'DIM-2022040001', 'Glass, Miriam Mercedes Wood', 'Mcfarland, Judith Benjamin Cantrell', NULL, 1, '2022-04-24 14:33:49', '2022-04-24 14:33:49'),
(156, 'MTL-2022040001', 'Alvarado, Claudia Yuri Singleton', 'Page, Walker Yardley Vasquez', NULL, 1, '2022-04-24 15:38:32', '2022-04-24 15:38:32'),
(167, 'VOA-2022040001', 'Odom, Orson Kirk Delacruz', 'Lara, Yardley Valentine Delgado', NULL, 1, '2022-04-24 16:26:57', '2022-04-24 16:26:57'),
(168, 'GSB-2022040001', 'Day, Cara Trevor Chandler', 'Brock, Katell ', NULL, 1, '2022-04-24 16:37:26', '2022-04-24 16:37:26'),
(169, 'WBZ-2022040001', 'Rollins, Galvin Lana Townsend', 'Wilkerson, Keith Buffy Murray', NULL, 1, '2022-04-24 16:54:58', '2022-04-24 16:54:58'),
(170, 'BOC-2022040001', 'Peterson, Brooke Zachery Wynn', 'Boyer, Ahmed Stewart Humphrey', NULL, 1, '2022-04-24 16:55:13', '2022-04-24 16:55:13'),
(171, 'FYS-2022040001', 'Gould, Benjamin Alexandra Garner', 'Wise, Vivian Bert Sampson', NULL, 1, '2022-04-24 16:55:31', '2022-04-24 16:55:31'),
(172, 'OHG-2022040001', 'Silva, Sybill Amethyst Blackburn', 'Bullock, Macaulay Alvin Rivas', NULL, 1, '2022-04-25 15:21:18', '2022-04-25 15:21:18'),
(173, 'BHZ-2022040001', 'Tucker, Garrison Hyacinth Mcpherson', 'Merritt, Louis Victoria Becker', NULL, 1, '2022-04-25 17:02:44', '2022-04-25 17:02:44'),
(174, 'MLR-2022040001', 'Russo, Ciaran Ariel Juarez', 'Mckee, Darafffff Orson Velez', NULL, 1, '2022-04-25 17:53:38', '2022-04-25 17:53:38'),
(175, 'NDW-2022040001', 'Strickland, Geraldine Leslie Chandler', 'Salinas, Shoshana Alma Terry', NULL, 1, '2022-04-25 18:39:49', '2022-04-25 18:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(1, 1, 'Fisher-Price-Rock-a-Stack', '<ul>\r\n	<li>The stacking toy is a great way to introduce your baby to the concept of colors and basic numbers.</li>\r\n	<li>Teach your baby to hold the rings, identify colors and put them back in the pole. This helps develop their motor as well as sensory skills.</li>\r\n	<li>The toy is non-toxic and does not have any sharp edges.</li>\r\n	<li>This is suitable for babies aged six months and above.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'fisher-price-rock-stack', 899, 'dell-inspiron-15-7000-15-6_1651593896.jpg', '2022-05-03', 1),
(2, 1, 'Skip-Hop-Bandana-Buddies-Baby-Activity-and-Teething-Toy', '<ul>\r\n	<li>The mat is huge and allows the baby to lie down comfortably. The vivid colors keep the baby entertained.</li>\r\n	<li>There are more than ten toys and activities across the baby gym.</li>\r\n	<li>An audio module plays nature sounds and music with up to 20 minutes of playback.</li>\r\n	<li>Several toys including dangling toys, soft toys, rattling toys with teether, and a mirror are attached to the bar of the gym to stimulate the infant&rsquo;s visual perception skills.</li>\r\n	<li>Some of the toys are removable and can be used separately.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'skip-hop-bandana-buddies-baby-activity-and-teething-toy', 799, 'skip-hop-bandana-buddies-baby-activity-and-teething-toy_1651599162.jpg', '2018-05-10', 3),
(3, 1, 'Fisher-Price-Rattle-N-Rock-Maracas', '<ul>\r\n	<li>The stacking toy is a great way to introduce your baby to the concept of colors and basic numbers.</li>\r\n	<li>Teach your baby to hold the rings, identify colors and put them back in the pole. This helps develop their motor as well as sensory skills.</li>\r\n	<li>The toy is non-toxic and does not have any sharp edges.</li>\r\n	<li>This is suitable for babies aged six months and above.</li>\r\n</ul>\r\n', 'fisher-price-rattle-n-rock-maracas', 599, 'dell-inspiron-15-5000-15-6_1651593871.jpg', '2018-05-12', 1),
(4, 1, 'Baby-Einstein-Take-Along-Tunes-Musical-Toy', '<ul>\r\n	<li>The Fab N Funky Press and Spin Toy Teddy is a wonderful toy that will teach your baby all about the relation between cause and effect.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has a host of different characters who are all very vibrant. The toys are shaped as animals and you can use it to teach your baby about the same.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can also use the toy to teach your baby about colors and shapes.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Once your baby presses the bar at the top, the toy will begin to spin.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can use it from the time your newborn is three months old.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'baby-einstein-take-along-tunes-musical-toy', 399, 'lenovo-ideapad-320s-14ikb-14-laptop-grey_1651594840.jpg', '2022-04-15', 2),
(5, 3, 'Chicco-Bubble-Island-Bath-Toy', '<ul>\r\n	<li>The Fab N Funky Press and Spin Toy Teddy is a wonderful toy that will teach your baby all about the relation between cause and effect.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has a host of different characters who are all very vibrant. The toys are shaped as animals and you can use it to teach your baby about the same.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can also use the toy to teach your baby about colors and shapes.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Once your baby presses the bar at the top, the toy will begin to spin.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can use it from the time your newborn is three months old.</li>\r\n</ul>\r\n', 'chicco-bubble-island-bath-toy', 339, 'apple-9-7-ipad-32-gb-gold_1651593828.jpg', '2018-05-10', 3),
(6, 1, 'Fisher-Price-Rainforest-Music-Lights-Deluxe-Gym', '<ul>\r\n	<li>The mat is huge and allows the baby to lie down comfortably. The vivid colors keep the baby entertained.</li>\r\n	<li>There are more than ten toys and activities across the baby gym.</li>\r\n	<li>An audio module plays nature sounds and music with up to 20 minutes of playback.</li>\r\n	<li>Several toys including dangling toys, soft toys, rattling toys with teether, and a mirror are attached to the bar of the gym to stimulate the infant&rsquo;s visual perception skills.</li>\r\n	<li>Some of the toys are removable and can be used separately.</li>\r\n</ul>\r\n', 'fisher-price-rainforest-music-lights-deluxe-gym', 449.99, 'dell-inspiron-15-5000-15_1651593861.jpg', '0000-00-00', 0),
(7, 3, 'Tiny-Love-Tiny-Smarts-Jittering-Giraffe-Attachable-Soft-Toy', '<ul>\r\n	<li>The Tiny Smarts Jittering Giraffe Attachable Soft Toy from the brand Tiny Love can be used from the time your newborn is zero months old.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>During the initial stages as a newborn, you can attach the toy to your newborn&rsquo;s activity gym or even to a cot mobile. It will encourage your newborn to reach out and try and touch it.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>As your newborn grows older and reaches the baby phase, you can attach it to your baby&rsquo;s stroller and let your baby play with it on the go.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The toy is suitable to be used from 0 to 12 months of age.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Once your baby tugs at the giraffe, it will make a jittery movement and will make a type of sound that will interest your baby.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It is a soft toy that your baby will be able to grasp easily.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has various textures that will help to improve your baby&rsquo;s sensory development.</li>\r\n</ul>\r\n', 'tiny-love-tiny-smarts-jittering-giraffe-attachable-soft-toy', 619, 'apple-10-5-ipad-pro-64-gb-space-grey-2017_1651593820.jpg', '0000-00-00', 0),
(8, 1, 'Fab-N-Funky-Press-And-Spin-Toy-Teddy', '<ul>\r\n	<li>The Fab N Funky Press and Spin Toy Teddy is a wonderful toy that will teach your baby all about the relation between cause and effect.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has a host of different characters who are all very vibrant. The toys are shaped as animals and you can use it to teach your baby about the same.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can also use the toy to teach your baby about colors and shapes.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Once your baby presses the bar at the top, the toy will begin to spin.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can use it from the time your newborn is three months old.</li>\r\n</ul>\r\n', 'fab-n-funky-press-and-spin-toy-teddy', 549.99, 'asus-transformer-mini-t102ha-10-1-2-1-silver_1651593853.jpg', '0000-00-00', 0),
(9, 2, 'ToBeReadyForLife-Cloth-Book-Baby-Gift', '<ul>\r\n	<li>The mat is huge and allows the baby to lie down comfortably. The vivid colors keep the baby entertained.</li>\r\n	<li>There are more than ten toys and activities across the baby gym.</li>\r\n	<li>An audio module plays nature sounds and music with up to 20 minutes of playback.</li>\r\n	<li>Several toys including dangling toys, soft toys, rattling toys with teether, and a mirror are attached to the bar of the gym to stimulate the infant&rsquo;s visual perception skills.</li>\r\n	<li>Some of the toys are removable and can be used separately.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'tobereadyforlife-cloth-book-baby-gift', 599.99, 'tobereadyforlife-cloth-book-baby-gift_1651599052.jpg', '0000-00-00', 0),
(10, 2, 'Lamaze-Octotunes-Musical-Toy', '<ul>\r\n	<li>A brightly-colored stuffed toy, which is shaped like an octopus, complete with eight fluffy arms.</li>\r\n	<li>Each arm of the octopus makes a different sound when squeezed.</li>\r\n	<li>The large head of the octopus is soft and adorable. A handle on top of the head makes it easy for the baby to grab the toy.</li>\r\n	<li>The arms are sturdy and can withstand the rough handling and pulling.</li>\r\n</ul>\r\n', 'lamaze-octotunes-musical-toy', 599.99, 'dell-inspiron-5675-gaming-pc-recon-blue_1651593915.jpg', '2022-04-16', 1),
(11, 2, 'MeeMee-Battery-Operated-3-In-1-Fun-Activity-Gym', '<ul>\r\n	<li>The Fab N Funky Press and Spin Toy Teddy is a wonderful toy that will teach your baby all about the relation between cause and effect.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has a host of different characters who are all very vibrant. The toys are shaped as animals and you can use it to teach your baby about the same.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can also use the toy to teach your baby about colors and shapes.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Once your baby presses the bar at the top, the toy will begin to spin.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can use it from the time your newborn is three months old.</li>\r\n</ul>\r\n', 'meemee-battery-operated-3-1-fun-activity-gym', 489.98, 'hp-barebones-omen-x-900-099nn-gaming-pc_1651593942.jpg', '2022-05-03', 1),
(12, 2, 'Babyhug-Twist-N-Fold-Move-N-Play-Activity-Gym', '<ul>\r\n	<li>The <a href=\"https://www.momjunction.com/articles/best-baby-rattles_00619976/\">circular rattle</a> is specially designed to be held by little hands.</li>\r\n	<li>A soft cushioned fabric covers the central rattle ring. It is helpful in cases where the infants drop the rattle on themselves.</li>\r\n	<li>There are several teething surfaces on the toy for the baby to gnaw.</li>\r\n	<li>High contrast colors and pattern draw the baby&rsquo;s attention and also help in object tracking.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'babyhug-twist-n-fold-move-n-play-activity-gym', 749.99, 'acer-aspire-gx-781-gaming-pc_1651593784.jpg', '2018-05-12', 3),
(13, 2, 'Sassy-Grasp-and-Spin-Rattle', '<ul>\r\n	<li>The Battery Operated 3 In 1 Fun Activity Gym from the brand MeeMeewill help your newborn get down on the floor and try to kick and crawl.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The activity gym has a lot of colorful cartoon characters that will provide a lot of visual stimulation to your newborn.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can also place it over your newborn&rsquo;s crib so that your little one can easily play with the same before reaching the crawling stage.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The activity gym also has a lot of different sounds and musical notes from various musical instruments that will help your infant identify different sounds.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Some of the musical instruments that are featured in the toy include an accordion, a harp, a xylophone and maracas.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>As your newborn grows to the baby phase, they will also love to sing and clap along.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The activity gym can be used from the time your newborn is about three months old.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'sassy-grasp-and-spin-rattle', 799.99, 'hp-pavilion-power-580-015na-gaming-pc_1651593967.png', '2022-05-03', 2),
(14, 2, 'Chicco-Bubble-Island-Bath-Toy', '<ul>\r\n	<li>The 3 Little Pigs <a href=\"https://www.momjunction.com/articles/best-baby-musical-toys_00512053/\">Musical Cot Toy</a> from the brand Chicco is the perfect and&nbsp;best toys for infants.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has a ring attached to the bottom of the toy that you have to pull to start the musical melodies that will help your newborn fall off to sleep with sweet lullabies.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>As the music begins, the heart present inside the toy will start rotating.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The toy is made of good quality and durable plastic and is very colorful.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It will encourage your newborn&rsquo;s visual stimulation as well as interest your baby into music.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'chicco-bubble-island-bath-toy', 899.99, 'chicco-bubble-island-bath-toy_1651599011.jpg', '2022-04-15', 4),
(15, 2, 'The Fab N Funky Press and Spin Toy', '<ul>\r\n	<li>The Fab N Funky Press and Spin Toy Teddy is a wonderful toy that will teach your baby all about the relation between cause and effect.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has a host of different characters who are all very vibrant. The toys are shaped as animals and you can use it to teach your baby about the same.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can also use the toy to teach your baby about colors and shapes.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Once your baby presses the bar at the top, the toy will begin to spin.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can use it from the time your newborn is three months old.</li>\r\n</ul>\r\n', 'fab-n-funky-press-and-spin-toy', 999.99, 'pc-specialist-vortex-minerva-xt-r-gaming-pc_1651594656.jpg', '2018-05-10', 1),
(16, 2, 'The-First-Years-My-First-Rattle', '<ul>\r\n	<li>The Tiny Smarts Jittering Giraffe Attachable Soft Toy from the brand Tiny Love can be used from the time your newborn is zero months old.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>During the initial stages as a newborn, you can attach the toy to your newborn&rsquo;s activity gym or even to a cot mobile. It will encourage your newborn to reach out and try and touch it.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>As your newborn grows older and reaches the baby phase, you can attach it to your baby&rsquo;s stroller and let your baby play with it on the go.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The toy is suitable to be used from 0 to 12 months of age.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Once your baby tugs at the giraffe, it will make a jittery movement and will make a type of sound that will interest your baby.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It is a soft toy that your baby will be able to grasp easily.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It has various textures that will help to improve your baby&rsquo;s sensory development.</li>\r\n</ul>\r\n', 'first-years-my-first-rattle', 649.99, 'first-years-my-first-rattle_1651599025.jpg', '2018-05-10', 2),
(17, 3, 'Babyhug-Twist-N-Fold-Move-N-Play-Activity-Gym-Lion', '<ul>\r\n	<li>The Chicco Bubble Island <a href=\"https://www.momjunction.com/articles/bath-toys-for-toddlers_00121943/\">Bath Toy is a fun toy</a> that your baby can use in the bath, either in a bath tub or in a bucket.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It comes with a lot of manual activities that will keep your baby entertained and will help your baby develop various motor skills.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The bath toy has a little chute through which the two little fish can slide down. It also has a water mill that helps to create various effects in the water.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Your baby will get the chance to press the octopus that is a part of the bath toy and start the magic soap bubbles that will come out of a volcano.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The bath toy is made in bright and vibrant colors that will also enhance your baby&rsquo;s visual stimulation.</li>\r\n	<li>The toy is perfect from the age of six months and above.</li>\r\n</ul>\r\n', 'babyhug-twist-n-fold-move-n-play-activity-gym-lion', 49.99, 'amazon-fire-7-tablet-alexa-2017-8-gb-black_1651594949.jpg', '2022-04-14', 1),
(18, 3, 'Baby-Einstein-Take-Along-Tunes-Musical-Toy', '<p>The MeeMee bath toy set comes with a collection of animal toys such as ducks, fish, tortoise, penguin and more.</p>\r\n\r\n<p>The various toys in the set are of different colors and shapes and sizes.</p>\r\n\r\n<p>The colorful toys will encourage your newborn baby&rsquo;s visual stimulation as well as interest your baby to grasp them, helping in motor as well as sensory stimulation.</p>\r\n\r\n<p>The products are made using non-toxic material and will be most useful from age six months onwards.</p>\r\n', 'baby-einstein-take-along-tunes-musical-toy', 79.99, 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black_1651593800.png', '2018-05-12', 2),
(19, 3, 'Baby-Einstein-Take-Along-Tunes-Musical-Toy', '<ul>\r\n	<li>The Twist and fold Move and <a href=\"https://www.momjunction.com/articles/best-baby-play-mats_00469980/\">Play activity gym</a> can be used from the time your newborn is three months old.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It is a combination of a mat that will let your newborn relax and will grow in activities as your newborn grows up, turning into a play area.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The mat is very soft and comfortable and will keep your baby protected.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>It is easy to maintain and you can clean it by wiping it with a cloth.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can use the activity gym till the time your baby learns to crawl, as then your baby will move out of the gym.</li>\r\n	<li>It comes with three soft toys that are attached to it and also includes a rattle and one apple shaped teether.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'baby-einstein-take-along-tunes-musical-toy', 99.99, 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black_1651593811.jpg', '2018-05-10', 1),
(20, 3, 'Chicco-Soft-Ball-Toy', '<ul>\r\n	<li>The Soft Ball Toy from the brand Chicco is made with very soft materials that make it a perfect play companion for your little one.</li>\r\n	<li>It is very light weight and will be easy for your newborn and baby to grasp.</li>\r\n	<li>As your baby shakes the ball, it will make different rattle sounds that will also keep your baby entertained.</li>\r\n	<li>It will improve your baby&rsquo;s grasping skills and will also enhance various motor skills, in addition to improving your baby&rsquo;s sensory skills as well.</li>\r\n	<li>The soft ball toy can be used once your newborn is three months old.</li>\r\n</ul>\r\n', 'chicco-soft-ball-toy', 339, 'apple-9-7-ipad-32-gb-space-grey_1651593842.jpg', '2018-05-12', 1),
(21, 5, 'MeeMee-Bath-Toys-Set-Of-10-Toys', '<ul>\r\n	<li>The Battery Operated 3 In 1 Fun Activity Gym from the brand MeeMeewill help your newborn get down on the floor and try to kick and crawl.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The activity gym has a lot of colorful cartoon characters that will provide a lot of visual stimulation to your newborn.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You can also place it over your newborn&rsquo;s crib so that your little one can easily play with the same before reaching the crawling stage.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The activity gym also has a lot of different sounds and musical notes from various musical instruments that will help your infant identify different sounds.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Some of the musical instruments that are featured in the toy include an accordion, a harp, a xylophone and maracas.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>As your newborn grows to the baby phase, they will also love to sing and clap along.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>The activity gym can be used from the time your newborn is about three months old.</li>\r\n</ul>\r\n', 'meemee-bath-toys-set-of-10-toys', 4545, 'fasfdsa_1651593930.jpeg', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10'),
(11, 19, 'PAYID-MJL6GYI2X3776724V823315C', '2022-04-14'),
(12, 19, 'PAYID-MJL6ICA78C62475DW011191D', '2022-04-14'),
(13, 19, 'PAYID-MJL6L6I2CL0569730941402L', '2022-04-14'),
(14, 24, 'PAYID-MJMSNLI67H40600GH220483P', '2022-04-15'),
(15, 25, 'PAYID-MJNIWUQ8XE26468L76126109', '2022-04-16'),
(16, 24, 'PAYID-MJXX4CA6EC49703E23512254', '2022-05-02'),
(17, 24, 'PAYID-MJYXG3I7PF87682GL2351908', '2022-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `name`, `description`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Program 101', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id augue est. Praesent eu augue efficitur, sodales lacus eget, sagittis est. Praesent ultricies eleifend facilisis. Praesent maximus justo tellus, in pharetra nulla mollis ut. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras fringilla est mi, eget hendrerit lacus vehicula id. Nam nisi magna, venenatis sit amet placerat non, porttitor eu ante. Phasellus sagittis aliquam turpis et malesuada. Quisque sollicitudin sit amet mi non suscipit. Integer turpis magna, tempor nec orci vel, aliquet ultricies dolor. Nulla venenatis maximus gravida. Aenean scelerisque ornare nunc, sed tempor tortor blandit et.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-12-14 10:02:00', NULL),
(2, 'Program 102', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Nulla tincidunt felis felis, vel tempus ligula pulvinar id. Aenean sagittis, augue nec tempus mattis, purus ex tempus lorem, porta iaculis sem arcu ac ligula. Integer orci nisi, maximus at urna sit amet, dapibus imperdiet eros. In sit amet vulputate elit, non porttitor augue. Nunc sollicitudin scelerisque justo, ut semper neque laoreet a. Maecenas dictum venenatis viverra. Sed sit amet venenatis dui. Etiam ullamcorper viverra odio, quis pretium metus commodo eu. Quisque aliquam rutrum tellus id hendrerit. Etiam quis sem molestie, molestie magna eget, vestibulum urna. Phasellus vitae tristique nibh, id rhoncus justo.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-12-14 10:02:23', NULL),
(3, 'Program 103', '&lt;p&gt;&lt;i&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Maecenas elit massa, maximus molestie laoreet sit amet, dapibus eu leo. Curabitur vitae elit lacus. Aenean placerat, metus consectetur imperdiet interdum, metus eros interdum orci, sed eleifend purus orci in nibh. Nulla id urna ex. Nulla dolor sem, bibendum id tellus a, euismod consequat ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam facilisis sagittis ex, ut imperdiet tellus feugiat in. Morbi non commodo lacus. Donec varius sem et lectus tristique tincidunt. In volutpat id justo dictum pharetra. Sed ac scelerisque ipsum. Sed cursus elementum odio, eget gravida odio semper fringilla. Praesent lorem turpis, ultrices vitae porta eget, posuere in massa.&lt;/span&gt;&lt;br&gt;&lt;/i&gt;&lt;/p&gt;', 1, '2021-12-14 10:02:33', '2022-04-05 16:19:53'),
(4, 'Program 104', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Suspendisse suscipit luctus vulputate. Praesent ac mi vel tortor tincidunt ornare. Curabitur id arcu purus. Sed suscipit in purus in ultricies. Sed interdum vel odio a pellentesque. Nulla eget accumsan ipsum. Proin sapien magna, pretium eu lectus et, lacinia blandit mi. Sed cursus varius orci a laoreet. Ut vehicula fringilla placerat. Donec euismod tincidunt est sit amet mollis. Quisque pulvinar consequat mollis. Sed eget aliquam arcu. Morbi fermentum vel odio vitae tincidunt. Etiam congue imperdiet feugiat. In commodo placerat tellus.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-12-14 10:02:52', '2021-12-14 10:03:04'),
(5, 'Program 105', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam sollicitudin, elit pellentesque mattis interdum, augue orci blandit ex, ut viverra orci lorem at tellus. Morbi a rhoncus purus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc et diam non urna porta tempus nec id enim. Suspendisse vestibulum ante eu maximus molestie.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-12-14 10:05:32', NULL),
(6, 'Adara Joyce', '', 0, '2022-04-15 17:47:09', NULL),
(7, 'Aspen Grimes', '', 1, '2022-04-15 17:47:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `slide_title` varchar(255) NOT NULL,
  `slide_id` int(11) NOT NULL,
  `slide_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`slide_title`, `slide_id`, `slide_image`) VALUES
('CMS', 10, 'image_687.jpg'),
('Javascript', 11, 'image_687.jpg'),
('Bootstrap', 12, 'image_687.jpg'),
('Edwin Diaz', 13, 'image_687.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Child City Management System'),
(6, 'short_name', 'CDCMS - PHP'),
(11, 'logo', 'uploads/logo-1639445951.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1651671455.png'),
(15, 'content', 'Array'),
(16, 'email', 'info@babycareXYZ.com'),
(17, 'contact', '09854698789 / 78945632'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'ABC Street, There City, Here, 2306');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(255) DEFAULT NULL,
  `code` mediumint(50) DEFAULT NULL,
  `occupied_status` varchar(20) DEFAULT 'not_occupied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`, `email`, `code`, `occupied_status`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-1.png?v=1647576841', NULL, 1, 1, '2021-01-20 14:02:37', '2022-04-18 17:58:22', NULL, NULL, NULL),
(3, 'Claire', NULL, 'Blake', 'cblake', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-3.png?v=1639467985', NULL, 2, 1, '2021-12-14 15:46:25', '2022-04-18 11:36:41', NULL, NULL, NULL),
(4, 'brad', NULL, 'cabret', 'brad', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-4.png?v=1647705879', NULL, 1, 1, '2022-03-19 22:04:39', '2022-04-18 11:36:44', NULL, NULL, NULL),
(5, 'Demetriusssssssss', NULL, 'Burrisssssss', 'Demetrius', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-5.png?v=1648819352', NULL, 1, 1, '2022-04-01 19:22:32', '2022-04-18 11:36:47', NULL, NULL, NULL),
(6, 'Adam', NULL, 'Ghilchrist', 'rico', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 2, 1, '2022-04-09 12:13:35', '2022-04-18 11:36:50', 'edwin@edwindiaz.com', NULL, NULL),
(7, 'Stewart', NULL, 'Murphy', 'kynazofam', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 2, 1, '2022-04-15 18:00:17', '2022-04-18 11:36:53', NULL, NULL, NULL),
(8, 'Imelda', NULL, 'Delaney', 'gapihemoc', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 2, 1, '2022-04-15 18:04:07', '2022-04-18 11:36:56', NULL, NULL, NULL),
(9, 'Olympia', NULL, 'Holder', 'tubana', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-9.png?v=1650255718', NULL, 3, 1, '2022-04-18 09:26:20', '2022-04-18 12:14:38', NULL, NULL, 'occupied'),
(10, 'Joan', NULL, 'Knight', 'vityqitas', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-10.png?v=1650255674', NULL, 3, 1, '2022-04-18 09:27:45', '2022-04-18 12:14:50', NULL, NULL, 'not_occupied'),
(11, 'Elvis', NULL, 'Spears', 'fihyxaba', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-11.png?v=1650321508', NULL, 3, 1, '2022-04-19 04:38:27', '2022-04-19 04:38:46', NULL, NULL, 'not_occupied'),
(12, 'Roth', NULL, 'Hubbard', 'xokiq', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-12.png?v=1651675929', NULL, 3, 1, '2022-05-04 20:52:09', '2022-05-04 20:52:53', NULL, NULL, 'not_occupied');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `babysitter_details`
--
ALTER TABLE `babysitter_details`
  ADD KEY `babysitter_id` (`babysitter_id`);

--
-- Indexes for table `babysitter_enrollment`
--
ALTER TABLE `babysitter_enrollment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `babysitter_list`
--
ALTER TABLE `babysitter_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecom_users`
--
ALTER TABLE `ecom_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollment_details`
--
ALTER TABLE `enrollment_details`
  ADD KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `enrollment_list`
--
ALTER TABLE `enrollment_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `babysitter_id` (`babysitter_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `babysitter_enrollment`
--
ALTER TABLE `babysitter_enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `babysitter_list`
--
ALTER TABLE `babysitter_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `ecom_users`
--
ALTER TABLE `ecom_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `enrollment_list`
--
ALTER TABLE `enrollment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `babysitter_details`
--
ALTER TABLE `babysitter_details`
  ADD CONSTRAINT `babysitter_details_ibfk_1` FOREIGN KEY (`babysitter_id`) REFERENCES `babysitter_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollment_details`
--
ALTER TABLE `enrollment_details`
  ADD CONSTRAINT `enrollment_details_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollment_list`
--
ALTER TABLE `enrollment_list`
  ADD CONSTRAINT `enrollment_list_ibfk_1` FOREIGN KEY (`babysitter_id`) REFERENCES `babysitter_list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
