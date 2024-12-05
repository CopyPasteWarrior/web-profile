-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2024 at 02:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `age` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT '/esp/img/pfp.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `fname`, `mname`, `lname`, `gender`, `age`, `email`, `password`, `profile_picture`, `created_at`, `updated_at`) VALUES
(5130012, 'Xavier Ace Clark', 'Salazar', 'Azcona', 'Male', 23, 'xavaieraceclark.azcona@nmsc.edu.ph', '$2y$10$FQHs5/ZJEJFVZGypMo.38u6ZldXFHn7SC2jGaHE7BC5imb8Nb6SGm', '674dc0804f05d_Screenshot 2024-11-16 113922.png', '2024-11-21 06:00:14', '2024-12-02 14:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `first_quarter` tinyint(4) DEFAULT NULL CHECK (`first_quarter` between 85 and 100),
  `second_quarter` tinyint(4) DEFAULT NULL CHECK (`second_quarter` between 85 and 100),
  `third_quarter` tinyint(4) DEFAULT NULL CHECK (`third_quarter` between 85 and 100),
  `fourth_quarter` tinyint(4) DEFAULT NULL CHECK (`fourth_quarter` between 85 and 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `subject`, `first_quarter`, `second_quarter`, `third_quarter`, `fourth_quarter`) VALUES
(19, 11203, 'Mathematics', 85, 85, 85, 85),
(20, 789, 'Mathematics', 85, 85, 85, 85);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `teacher_advisory` varchar(255) NOT NULL,
  `grade_level` varchar(50) NOT NULL,
  `subjects_taken` text NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT '/esp/img/pfp.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `teacher_advisory`, `grade_level`, `subjects_taken`, `age`, `email`, `password`, `profile_picture`, `created_at`, `updated_at`) VALUES
(789, 'lo', 'pol', 'loop', '', '5130012', 'Grade 4', 'Math,Science,English,History,Art,Music', 9, 'lo.loop@bfa.edu.ph', '123', '/esp/img/pfp.png', '2024-11-27 14:40:46', '2024-11-27 14:41:26'),
(11203, 'Ace', 'Raza', 'Cona', 'Male', '5130012', 'Grade 1', 'Math,Science,English,History,Art,Music,PE', 8, 'ace.cona@bfa.edu.ph', '$2y$10$j2dOc/KZBUbmbvkqV.UPHe8E218nR5BI0S/npDTTPj8icgcE92NVi', '/esp/img/pfp.png', '2024-11-26 14:11:03', '2024-11-28 07:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `age` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `subject_taught` varchar(50) NOT NULL,
  `grade_advisory` varchar(50) NOT NULL,
  `profile_picture` varchar(255) DEFAULT '/esp/img/pfp.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `fname`, `mname`, `lname`, `gender`, `age`, `email`, `password`, `subject_taught`, `grade_advisory`, `profile_picture`, `created_at`, `updated_at`) VALUES
(5130012, 'Xavier Ace Clark', 'Salazar', 'Azcona', 'Male', 23, 'xavieraceclark.azcona@nmsc.edu.ph', '$2y$10$jDG9g2LqLT9rr9q.wKcr4.nDrf7GePWBRUU9LzFSivQU7qxPSbBeW', 'English', 'Grade 3', '/esp/img/pfp.png', '2024-11-21 06:54:20', '2024-11-21 16:11:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=784561224;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5130021;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
