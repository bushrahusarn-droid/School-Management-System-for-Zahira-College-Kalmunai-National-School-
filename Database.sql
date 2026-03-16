-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2025 at 06:38 AM
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
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `alumni_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `graduation_year` year(4) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `current_job` varchar(100) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`alumni_id`, `first_name`, `last_name`, `dob`, `phone`, `gender`, `address`, `email`, `graduation_year`, `qualification`, `current_job`, `status`) VALUES
('A001', 'Muhamed', 'Zahir', '1987-10-10', '0778956443', 'Male', '333,Old Post office Road, Maruthamunai - 08', 'zahir@gmail.com', '2010', 'B.Ed', 'Teacher', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` varchar(20) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `title` varchar(150) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `total_copies` int(11) NOT NULL,
  `available_copies` int(11) NOT NULL,
  `issued_copies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `isbn`, `title`, `author`, `publisher`, `edition`, `category`, `subject`, `language`, `total_copies`, `available_copies`, `issued_copies`) VALUES
('B001', '978-00000000001', 'Java Programming', 'James Gosling', 'Oracle', '1st', 'Programming', 'Computer Science', 'English', 1, 9, 1),
('B002', '979-0000002', 'Python Programming', 'James Frankling', 'New Publisher', '2nd', 'Programming', 'Computer Science', 'Python', 15, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `issue_id` int(11) NOT NULL,
  `book_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `issue_date` date NOT NULL,
  `return_date` date NOT NULL,
  `status` enum('Issued','Returned') DEFAULT 'Issued'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_issues`
--

INSERT INTO `book_issues` (`issue_id`, `book_id`, `student_id`, `issue_date`, `return_date`, `status`) VALUES
(8, 'B001', 'ST001', '2025-01-10', '2025-01-21', 'Issued');

-- --------------------------------------------------------

--
-- Table structure for table `canteen_items`
--

CREATE TABLE `canteen_items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `available_status` enum('Available','Not Available') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `canteen_items`
--

INSERT INTO `canteen_items` (`item_id`, `item_name`, `category`, `price`, `quantity`, `available_status`) VALUES
(1, 'Chicken Sandwich', 'Snack', 200.00, 50, 'Available'),
(2, 'Fruit Juice', 'Drink', 100.00, 100, 'Available'),
(3, 'Chocolate Cake', 'Dessert', 150.00, 30, 'Not Available');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` varchar(20) NOT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  `grade_level` int(11) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `class_teacher_id` varchar(20) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `academic_year` varchar(9) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `grade_level`, `section`, `class_teacher_id`, `capacity`, `academic_year`, `status`) VALUES
('C001', 'Class6', 6, 'A', 'T001', 30, '2025-2026', 'Active'),
('C002', 'Class7', 7, 'B', 'T002', 32, '2025-2026', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` int(11) NOT NULL,
  `class_id` varchar(20) DEFAULT NULL,
  `subject_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_subjects`
--

INSERT INTO `class_subjects` (`id`, `class_id`, `subject_id`) VALUES
(1, 'C001', 'S001'),
(2, 'C001', 'S002'),
(3, 'C001', 'S003');

-- --------------------------------------------------------

--
-- Table structure for table `communications`
--

CREATE TABLE `communications` (
  `message_id` varchar(50) NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `sender_role` varchar(50) NOT NULL,
  `recipient_id` varchar(50) NOT NULL,
  `recipient_role` varchar(50) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message_type` varchar(50) DEFAULT NULL,
  `priority_level` varchar(50) DEFAULT NULL,
  `delivery_mode` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `communications`
--

INSERT INTO `communications` (`message_id`, `sender_id`, `sender_role`, `recipient_id`, `recipient_role`, `subject`, `message_type`, `priority_level`, `delivery_mode`, `status`, `created_by`, `created_on`) VALUES
('M001', 'S001', 'Admin', 'R001', 'Student', 'Attendance', 'Alert', 'Medium', 'SMS', 'Sent', 'Admin', '2025-12-28 20:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fee_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `class_grade` varchar(20) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `fee_type` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  `payment_date` date DEFAULT NULL,
  `collected_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fee_id`, `student_id`, `class_grade`, `academic_year`, `fee_type`, `amount`, `payment_status`, `payment_date`, `collected_by`) VALUES
('F001', 'ST001', '09A', '2025', 'SDC', 1200.00, 'Paid', '2025-03-01', 'Class Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `health_records`
--

CREATE TABLE `health_records` (
  `health_record_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `checkup_date` date NOT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `bmi` decimal(5,2) DEFAULT NULL,
  `vision_test` varchar(255) DEFAULT NULL,
  `dental_check` varchar(255) DEFAULT NULL,
  `hearing_status` varchar(255) DEFAULT NULL,
  `vaccination_status` varchar(255) DEFAULT NULL,
  `chronic_illness_allergies` varchar(255) DEFAULT NULL,
  `doctor_remarks` varchar(255) DEFAULT NULL,
  `recorded_by` varchar(50) DEFAULT NULL,
  `recorded_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `health_records`
--

INSERT INTO `health_records` (`health_record_id`, `student_id`, `checkup_date`, `height`, `weight`, `bmi`, `vision_test`, `dental_check`, `hearing_status`, `vaccination_status`, `chronic_illness_allergies`, `doctor_remarks`, `recorded_by`, `recorded_on`, `updated_by`, `updated_on`) VALUES
('HR001', 'ST001', '2025-10-01', 150.00, 50.00, 22.20, 'Right Eye', 'present', 'good', 'done', 'no', 'good', 'Admin', '2025-12-28 12:32:09', 'Admin', '2025-12-28 12:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_assets`
--

CREATE TABLE `inventory_assets` (
  `asset_id` varchar(50) NOT NULL,
  `asset_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(10,2) DEFAULT NULL,
  `vendor_name` varchar(100) DEFAULT NULL,
  `vendor_contact` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `available_quantity` int(11) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `condition_status` varchar(50) DEFAULT NULL,
  `warranty_expiry` date DEFAULT NULL,
  `assigned_to_dept` varchar(50) DEFAULT NULL,
  `assigned_to_staff_id` varchar(50) DEFAULT NULL,
  `asset_tag` varchar(50) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_assets`
--

INSERT INTO `inventory_assets` (`asset_id`, `asset_name`, `category`, `description`, `purchase_date`, `purchase_cost`, `vendor_name`, `vendor_contact`, `quantity`, `available_quantity`, `location`, `condition_status`, `warranty_expiry`, `assigned_to_dept`, `assigned_to_staff_id`, `asset_tag`, `created_on`, `updated_on`) VALUES
('ASS001', 'Desktop Computer', 'IT Equipment', 'Windows 10, Intel Core i5, Dell', '2025-09-09', 100000.00, 'ABC Technologies(pvt)', '0768955432', 20, 12, '1,New Avenue,Colombo - 07', 'Active', '2030-09-09', 'Computer Dept', 'T002', 'IT-DC-002', '2025-12-28 12:23:51', '2025-12-28 12:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` varchar(50) NOT NULL,
  `admission_no` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(20) DEFAULT NULL,
  `class_section` varchar(50) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `admission_no`, `first_name`, `last_name`, `dob`, `gender`, `address`, `phone`, `email`, `guardian_name`, `guardian_phone`, `class_section`, `enrollment_date`, `status`) VALUES
('ST001', '12345', 'Ahamed', 'Hisham', '2002-09-08', 'Male', '222.Main Road,Kalmunai -01', '0768899213', 'hisam@gmail.com', 'Muhamed Natheer', '0772134567', '08A', '2024-01-01', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `student_welfare`
--

CREATE TABLE `student_welfare` (
  `welfare_id` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `welfare_type` varchar(100) DEFAULT NULL,
  `welfare_date` date DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_welfare`
--

INSERT INTO `student_welfare` (`welfare_id`, `student_id`, `student_name`, `dob`, `phone`, `address`, `email`, `welfare_type`, `welfare_date`, `status`) VALUES
('W001', 'S001', 'Aliya Rahman', '2010-05-12', '0712345678', 'No 12, Colombo', 'aliya@email.com', 'Financial Aid', '2025-12-01', 'Active'),
('W002', 'S002', 'Mohamed Sami', '2009-08-20', '0723456789', 'No 45, Galle', 'sami@email.com', 'Medical Support', '2025-12-05', 'Active'),
('W003', 'S003', 'Fathima Husarn', '2011-01-15', '0771234567', 'No 78, Kandy', 'fathima@email.com', 'Counselling', '2025-12-10', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` varchar(20) NOT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  `subject_code` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `credit_hours` int(11) DEFAULT NULL,
  `grade_level` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `subject_code`, `description`, `credit_hours`, `grade_level`, `status`) VALUES
('S001', 'Mathematics', 'MATH101', 'Basic Mathematics', 5, 6, 'Active'),
('S002', 'Science', 'SCI101', 'Basic Science', 4, 6, 'Active'),
('S003', 'English', 'ENG101', 'English Language', 3, 6, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` varchar(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `subject_specialization` varchar(100) DEFAULT NULL,
  `class_assigned` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `first_name`, `last_name`, `dob`, `phone`, `gender`, `address`, `email`, `hire_date`, `qualification`, `subject_specialization`, `class_assigned`, `status`) VALUES
('AB111', 'Abdul', 'Nazeer', '1890-09-08', '0768975639', 'Male', '444C,Main Street,Kalmunai-12', 'nazeer@gmail.com', '2013-09-09', 'Bachelor of ICT', 'ICT', '10A', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `timetable_id` varchar(20) NOT NULL,
  `class_grade` varchar(20) NOT NULL,
  `section` varchar(10) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `term` varchar(10) NOT NULL,
  `day_of_week` varchar(15) NOT NULL,
  `teacher_id` varchar(20) NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `period_no` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `classroom_no` varchar(10) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`timetable_id`, `class_grade`, `section`, `academic_year`, `term`, `day_of_week`, `teacher_id`, `subject_id`, `subject_name`, `teacher_name`, `period_no`, `start_time`, `end_time`, `classroom_no`, `remarks`, `created_by`, `created_on`) VALUES
('T001', '08A', '08', '2025', '1st', 'None', 'T001', 'S001', 'Tamil', 'Muhamed Zahir', 3, '00:00:08', '00:00:10', '2', 'None', 'admin', '2025-12-28 15:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `transport_id` varchar(20) NOT NULL,
  `vehicle_id` varchar(20) NOT NULL,
  `vehicle_number` varchar(20) NOT NULL,
  `driver_id` varchar(20) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `driver_phone` varchar(20) DEFAULT NULL,
  `route_id` varchar(20) DEFAULT NULL,
  `route_name` varchar(100) DEFAULT NULL,
  `pickup_points` text DEFAULT NULL,
  `drop_points` text DEFAULT NULL,
  `schedule_time` time DEFAULT NULL,
  `student_list` text DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `fuel_type` varchar(50) DEFAULT NULL,
  `insurance_expiry` date DEFAULT NULL,
  `permit_expiry` date DEFAULT NULL,
  `maintenance_status` varchar(50) DEFAULT NULL,
  `emergency_contact` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `recorded_by` varchar(50) DEFAULT NULL,
  `service_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`alumni_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `fk_books` (`book_id`);

--
-- Indexes for table `canteen_items`
--
ALTER TABLE `canteen_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `communications`
--
ALTER TABLE `communications`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fee_id`);

--
-- Indexes for table `health_records`
--
ALTER TABLE `health_records`
  ADD PRIMARY KEY (`health_record_id`);

--
-- Indexes for table `inventory_assets`
--
ALTER TABLE `inventory_assets`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_welfare`
--
ALTER TABLE `student_welfare`
  ADD PRIMARY KEY (`welfare_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`timetable_id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `canteen_items`
--
ALTER TABLE `canteen_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD CONSTRAINT `fk_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD CONSTRAINT `class_subjects_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `class_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
