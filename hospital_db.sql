-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2026 at 09:59 PM
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
-- Database: `hospital_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `patient_phone` varchar(15) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `time_slot` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `problem_description` text DEFAULT NULL,
  `status` enum('Pending','Confirmed','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_name`, `patient_phone`, `doctor_id`, `appointment_date`, `time_slot`, `phone`, `appointment_time`, `problem_description`, `status`, `created_at`) VALUES
(1, 'Fahad Montaser', NULL, 7, '2026-01-21', '09:00 AM', '01775622858', NULL, NULL, '', '2026-01-24 20:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `available_days` varchar(50) DEFAULT NULL,
  `time_slot` varchar(50) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `doctor_name`, `specialization`, `phone`, `available_days`, `time_slot`, `rating`, `created_at`) VALUES
(1, 'Dr. A Rahman', 'Child Specialist', '01711234567', 'Sun,Tue,Thu', '4PM-7PM', 4.8, '2026-01-24 17:06:08'),
(2, 'Dr. B Akter', 'Skin Specialist', '01722345678', 'Mon,Wed', '5PM-8PM', 5.0, '2026-01-24 17:06:08'),
(3, 'Dr. K Hasan', 'Cardiologist', '01733456789', 'Sat,Tue', '3PM-6PM', 4.7, '2026-01-24 17:06:08'),
(4, 'Dr. F Islam', 'General Physician', '01744567890', 'Mon,Fri', '2PM-5PM', 4.6, '2026-01-24 17:06:08'),
(5, 'Dr. S Begum', 'Gynecologist', '01755678901', 'Tue,Thu', '10AM-1PM', 4.9, '2026-01-24 17:06:08'),
(6, 'Dr. M Hossain', 'Orthopedic', '01766789012', 'Wed,Sat', '4PM-7PM', 4.5, '2026-01-24 17:06:08'),
(7, 'Dr. N Sultana', 'Dentist', '01777890123', 'Mon,Wed,Fri', '11AM-2PM', 4.8, '2026-01-24 17:06:08'),
(8, 'Dr. R Khan', 'Neurologist', '01788901234', 'Tue,Thu', '3PM-6PM', 4.7, '2026-01-24 17:06:08'),
(9, 'Dr. T Ahmed', 'ENT Specialist', '01799012345', 'Sat,Mon', '5PM-8PM', 4.6, '2026-01-24 17:06:08'),
(10, 'Dr. S Chowdhury', 'Diabetologist', '01800123456', 'Wed,Fri', '2PM-5PM', 4.9, '2026-01-24 17:06:08'),
(11, 'Dr. M Ali', 'Gastroenterologist', '01811234567', 'Thu,Sat', '10AM-1PM', 4.5, '2026-01-24 17:06:08'),
(12, 'Dr. R Parvin', 'Eye Specialist', '01822345678', 'Mon,Tue', '4PM-7PM', 4.8, '2026-01-24 17:06:08'),
(13, 'Dr. A Siddiqui', 'Pulmonologist', '01833456789', 'Wed,Fri', '3PM-6PM', 4.7, '2026-01-24 17:06:08'),
(14, 'Dr. F Yeasmin', 'Rheumatologist', '01844567890', 'Sat,Sun', '11AM-2PM', 4.6, '2026-01-24 17:06:08'),
(15, 'Dr. S Kabir', 'Urologist', '01855678901', 'Mon,Thu', '5PM-8PM', 4.9, '2026-01-24 17:06:08'),
(16, 'Dr. N Haque', 'Psychiatrist', '01866789012', 'Tue,Fri', '2PM-5PM', 4.8, '2026-01-24 17:06:08'),
(17, 'Dr. K Rahman', 'Nephrologist', '01877890123', 'Wed,Sat', '10AM-1PM', 4.7, '2026-01-24 17:06:08'),
(18, 'Dr. M Begum', 'Endocrinologist', '01888901234', 'Thu,Sun', '4PM-7PM', 4.6, '2026-01-24 17:06:08'),
(19, 'Dr. R Hossain', 'Oncologist', '01899012345', 'Mon,Wed', '3PM-6PM', 4.9, '2026-01-24 17:06:08'),
(20, 'Dr. T Sultana', 'Pathologist', '01900123456', 'Fri,Sat', '11AM-2PM', 4.8, '2026-01-24 17:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
