-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2022 at 01:51 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(250) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_courses`
--

INSERT INTO `tbl_courses` (`id`, `course_name`, `status`, `created_at`) VALUES
(1, 'MAT 101', '1', '2022-02-03 17:40:24'),
(2, 'BIO 120', '1', '2022-02-03 17:40:24'),
(3, 'CHEM 100', '0', '2022-02-03 17:40:24'),
(4, 'PHY 103', '1', '2022-02-03 17:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_exam_requests`
--

CREATE TABLE `tbl_exam_requests` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_date` datetime NOT NULL,
  `student_comment` text NOT NULL,
  `request_time` datetime NOT NULL DEFAULT current_timestamp(),
  `approval_status` int(11) NOT NULL,
  `approved_time` datetime DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_professors`
--

CREATE TABLE `tbl_professors` (
  `id` int(11) NOT NULL,
  `professor_name` varchar(250) NOT NULL,
  `professor_email` text NOT NULL,
  `professor_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_professors`
--

INSERT INTO `tbl_professors` (`id`, `professor_name`, `professor_email`, `professor_password`) VALUES
(1, 'PROF A', 'a.professor@concordia.ab.ca', '$2y$10$fZ0fhFb2vWZFfOKkGmyOKu/q6T.6uJbV/hznLtXPqLkep9uRpKQG2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `id` int(11) NOT NULL,
  `student_name` varchar(120) DEFAULT NULL,
  `student_email` varchar(120) DEFAULT NULL,
  `student_password` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`id`, `student_name`, `student_email`, `student_password`, `created_at`) VALUES
(1, 'STUD A', 'a.student@concordia.ab.ca', '$2y$10$6jS4Ms4Md36Et20R45dlt.tdG3kgSZOIpmI64rfT5jCniXkCibZra', '2022-02-04 00:42:54'),
(2, 'STUD B', 'b.student@concordia.ab.ca', '$2y$10$78vshe9J9TAyMPICiiiuD.XWmNCqwqT5npNl3j3vlVh0kaFkl/iMi', '2022-02-04 00:42:54'),
(3, 'STUD C', 'c.student@concordia.ab.ca', '$2y$10$Y8QOVcWCIrUVFxwrkUG5Xe6UyNGkpSUc/78uisPSd2lzqsWVzuQYa', '2022-02-04 00:42:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_exam_requests`
--
ALTER TABLE `tbl_exam_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tbl_professors`
--
ALTER TABLE `tbl_professors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_exam_requests`
--
ALTER TABLE `tbl_exam_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_professors`
--
ALTER TABLE `tbl_professors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_students`
--
ALTER TABLE `tbl_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
