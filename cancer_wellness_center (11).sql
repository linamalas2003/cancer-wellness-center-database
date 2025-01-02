-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2025 at 10:03 PM
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
-- Database: `cancer_wellness_center`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_appointment` (IN `appointment_id` INT)   DELETE FROM appointment WHERE id = appointment_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_account_for_doctor` (IN `id` INT, IN `first_name` VARCHAR(20), IN `last_name` VARCHAR(20), IN `speciality` VARCHAR(50), IN `phone` INT, IN `email` VARCHAR(150), IN `city` VARCHAR(100), IN `street` VARCHAR(100), IN `section_id` INT)   INSERT INTO doctor(id,first_name,last_name,speciality,phone,email,city,street,section_id) VALUES(id,first_name,last_name,speciality,phone,email,city,street,section_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_account_for_staff` (IN `id` INT, IN `first_name` VARCHAR(20), IN `last_name` VARCHAR(20), IN `email` VARCHAR(150), IN `phone` INT, IN `city` VARCHAR(100), IN `street` VARCHAR(100), IN `occupation` VARCHAR(100), IN `section_id` INT)   INSERT INTO staff(id,first_name,last_name,email,phone,city,street,occupation,section_id) VALUES(id,first_name,last_name,email,phone,city,street,occupation,section_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_account_patient` (IN `id` INT, IN `first_name` VARCHAR(20), IN `last_name` VARCHAR(20), IN `birth_date` DATE, IN `phone` INT, IN `email` VARCHAR(150))   INSERT INTO patient(id,first_name,last_name,birth_date,phone,email) VALUES(id,first_name,last_name,birth_date,phone,email)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_billing_info` (IN `id` INT, IN `payment_type` VARCHAR(50), IN `date` DATE, IN `time` TIME, IN `total_price` DECIMAL)   INSERT INTO billing (id, payment_type, date, time, total_price)
VALUES(id, payment_type, date, time, total_price)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_medical_record` (IN `id` INT, IN `medical_condition` VARCHAR(100), IN `date_of_diagnosis` DATE, IN `date_of_treatment` DATE, IN `allergy` VARCHAR(255), IN `patient_id` INT)   INSERT INTO medical_history(id,medical_condition,date_of_diagnosis,date_of_treatment,allergy,patient_id)
VALUES
(id,medical_condition,date_of_diagnosis,date_of_treatment,allergy,patient_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_patient_medication` (IN `treatment_id` INT, IN `medicine_name` VARCHAR(255), IN `medicine_price` DECIMAL)   INSERT INTO treatment_medication(treatment_id,medicine_name,medicine_price)
 VALUES(treatment_id,medicine_name,medicine_price)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_patient_treatment` (IN `id` INT, IN `diagnosis` VARCHAR(255), IN `price` DECIMAL, IN `name` VARCHAR(100), IN `patient_id` INT)   INSERT INTO treatment(id,diagnosis,price,name,patient_id)
 VALUES(id,diagnosis,price,name,patient_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `doctor_info` (IN `id` INT)   SELECT * FROM doctor WHERE doctor.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `manage_doctor_salary` (IN `id` INT, IN `salary` INT)   UPDATE doctor set doctor.salary= salary WHERE doctor.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `manage_staff_salary` (IN `id` INT, IN `salary` DECIMAL)   UPDATE staff set staff.salary= salary WHERE staff.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `medical_record` (IN `id` INT)   Select* from medical_history where medical_history.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_info` (IN `id` INT)   SELECT * FROM patient WHERE patient.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SCHEDULE_appointment` (IN `id` INT, IN `date` DATE, IN `time` TIME, IN `doctor_id` INT, IN `staff_id` INT, IN `patient_id` INT)   INSERT INTO appointment(id,date,time,doctor_id,staff_id,patient_id)
VALUES(id,date,time,doctor_id,staff_id,patient_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_info` (IN `id` INT)   SELECT * FROM staff WHERE staff.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_billing_info` (IN `id` INT, IN `payment_type` VARCHAR(50), IN `date` DATE, IN `time` TIME, IN `total_price` DECIMAL)   UPDATE billing SET billing.payment_type=payment_type,billing.date=date,billing.time=time,billing.total_price=total_price WHERE billing.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_medical_record` (IN `id` INT, IN `medical_condition` VARCHAR(100), IN `date_of_diagnosis` DATE, IN `date_of_treatment` DATE, IN `allergy` VARCHAR(255), IN `patient_id` INT)   UPDATE medical_history SET medical_history.medical_condition=medical_condition,medical_history.date_of_diagnosis=date_of_diagnosis,medical_history.date_of_treatment=date_of_treatment,medical_history.allergy=allergy,medical_history.patient_id=patient_id WHERE medical_history.id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_patient_medication` (IN `treatment_id` INT, IN `medicine_name` VARCHAR(255), IN `medicine_price` DECIMAL)   UPDATE treatment_medication SET  treatment_medication.medicine_name=medicine_name, treatment_medication.medicine_price=medicine_price WHERE treatment_medication.treatment_id=treatment_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_patient_treatment` (IN `id` INT, IN `diagnosis` VARCHAR(255), IN `price` DECIMAL, IN `name` VARCHAR(100), IN `patient_id` INT)   UPDATE treatment SET treatment.diagnosis=diagnosis,treatment.price=price,treatment.name=name,treatment.patient_id=patient_id WHERE treatment.id=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `date`, `time`, `doctor_id`, `staff_id`, `patient_id`) VALUES
(1, '2018-06-15', '14:00:00', 2, 6, 1),
(2, '2019-03-10', '09:00:00', 7, 9, 2),
(3, '2020-01-05', '11:30:00', 3, 9, 3),
(4, '2017-11-20', '14:00:00', 3, 9, 4),
(5, '2022-02-18', '14:30:00', 8, 12, 5),
(6, '2022-01-15', '15:00:00', 8, 12, 6),
(7, '2021-06-01', '12:00:00', 1, 3, 7),
(8, '2019-03-11', '13:30:00', 2, 6, 8),
(9, '2020-08-10', '11:00:00', 4, 12, 9),
(10, '2022-02-10', '11:30:00', 5, 3, 1),
(11, '2021-05-03', '15:30:00', 7, 9, 2),
(12, '2023-03-12', '16:00:00', 7, 9, 3),
(13, '2023-06-05', '12:30:00', 5, 3, 4),
(14, '2021-02-15', '13:00:00', 4, 12, 5),
(15, '2022-04-08', '15:00:00', 1, 3, 6),
(16, '2021-09-21', '12:00:00', 1, 3, 7),
(17, '2022-01-01', '15:00:00', 8, 12, 8),
(18, '2022-03-11', '16:00:00', 4, 12, 9),
(19, '2019-03-08', '13:00:00', 2, 6, 10),
(20, '2021-07-14', '16:30:00', 6, 6, 11),
(21, '2021-12-21', '12:30:00', 6, 6, 12);

-- --------------------------------------------------------

--
-- Stand-in structure for view `appointment_report`
-- (See below for the actual view)
--
CREATE TABLE `appointment_report` (
`id` int(11)
,`date` date
,`time` time
,`doctor_id` int(11)
,`staff_id` int(11)
,`patient_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `total_price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`id`, `payment_type`, `date`, `time`, `total_price`) VALUES
(1, 'cash', '2018-06-15', '15:00:00', 5050),
(2, 'visa', '2019-03-10', '10:30:00', 6300),
(3, 'cash', '2020-01-05', '13:00:00', 8200),
(4, 'visa', '2017-11-20', '16:30:00', 10250),
(5, 'cash', '2022-02-18', '13:00:00', 4600),
(6, 'visa', '2022-01-15', '14:30:00', 6200),
(7, 'cash', '2021-06-01', '13:00:00', 5400),
(8, 'visa', '2019-03-11', '13:30:00', 7500),
(9, 'cash', '2020-08-10', '16:00:00', 5900),
(10, 'visa', '2022-02-10', '17:30:00', 550),
(11, 'cash', '2021-05-03', '15:00:00', 320),
(12, 'visa', '2023-03-12', '15:30:00', 1600),
(13, 'cash', '2023-06-05', '16:00:00', 400),
(14, 'visa', '2021-02-15', '16:30:00', 5400),
(15, 'cash', '2022-04-08', '17:00:00', 4400),
(16, 'visa', '2021-09-21', '17:30:00', 1000),
(17, 'cash', '2022-01-01', '18:00:00', 1600),
(18, 'visa', '2022-03-11', '18:30:00', 1150),
(19, 'cash', '2019-03-08', '14:00:00', 5000),
(20, 'cash', '2021-07-12', '17:00:00', 6000),
(21, 'visa', '2021-12-21', '14:00:00', 8000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `budget_report`
-- (See below for the actual view)
--
CREATE TABLE `budget_report` (
`name` varchar(100)
,`SUM(doctor.salary)` decimal(28,2)
,`SUM(staff.salary)` decimal(32,0)
,`total_salary` decimal(35,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `diagnostic_test_report`
-- (See below for the actual view)
--
CREATE TABLE `diagnostic_test_report` (
`diagnosis` varchar(300)
,`patient_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `speciality` varchar(255) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(150) NOT NULL,
  `street` varchar(200) NOT NULL,
  `salary` decimal(6,2) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `first_name`, `last_name`, `speciality`, `phone`, `email`, `city`, `street`, `salary`, `section_id`) VALUES
(1, 'Ali', 'Mohammad', 'Oncology', 793500123, 'ali.mohammad@gmail.com', 'Amman', 'zahran street', 4000.00, 1),
(2, 'Omar', 'Al-Husseini', 'Pathology', 783500124, 'omar.alhusseini@gmail.com', 'Amman', 'Rainbow Street', 4500.00, 2),
(3, 'sara', 'al-abadi', 'Diagnostic Imaging', 793500125, 'sara.alabadi@gmail.com', 'Irbid', 'Al-Jamea Street', 5000.00, 3),
(4, 'Noor', 'faris', 'Surgery', 783500127, 'noor.faris@gmail.com', 'jerash', 'Al-Tayyar Street', 5500.00, 4),
(5, 'Sami', 'Al-Haddad', 'Oncology', 793500112, 'sami.alhaddad@gmail.com', 'Amman', 'Gardens Street', 4000.00, 1),
(6, 'Yazzan', 'Qasim', 'Pathology', 783500114, 'yazan.qasim@gmail.com', 'Zarqa', 'Al-Mahatta Street', 4500.00, 2),
(7, 'Tariq', 'Shalabi', 'Diagnostic Imaging', 783500115, 'tariq.shalabi@gmail.com', 'Zarqa', 'Al-Salt Street', 5000.00, 3),
(8, 'Khalid', 'Al-Masri', 'Surgery', 783500127, 'noor.faris@gmail.com', 'Amman', 'Abdoun Circle', 5500.00, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `doctor_performance_statistics`
-- (See below for the actual view)
--
CREATE TABLE `doctor_performance_statistics` (
`id` int(11)
,`COUNT(patient.id)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `doctor_report`
-- (See below for the actual view)
--
CREATE TABLE `doctor_report` (
`id` int(11)
,`first_name` varchar(20)
,`last_name` varchar(20)
,`speciality` varchar(255)
,`phone` int(11)
,`email` varchar(100)
,`city` varchar(150)
,`street` varchar(200)
,`salary` decimal(6,2)
,`section_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL,
  `medical_condition` varchar(255) DEFAULT NULL,
  `date_of_diagnosis` date DEFAULT NULL,
  `date_of_treatment` date NOT NULL,
  `allergy` varchar(200) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`id`, `medical_condition`, `date_of_diagnosis`, `date_of_treatment`, `allergy`, `patient_id`) VALUES
(1, 'Breast cancer', '2018-06-15', '2018-07-01', 'latex', 1),
(2, 'Colon cancer', '2019-03-10', '2019-03-20', 'Penicillin', 2),
(3, 'Lung cancer', '2020-01-05', '2020-01-10', 'Latex', 3),
(4, 'Leukemia cancer', '2017-11-20', '2017-12-01', 'None', 4),
(5, 'Brain tumor', '2022-02-18', '2022-02-25', 'None', 5),
(6, 'Breast cancer', '2022-01-15', '2022-01-18', 'shellfish', 6),
(7, 'Breast cancer', '2021-06-01', '2021-06-06', 'pollen', 7),
(8, 'Colon cancer', '2019-03-11', '2019-03-15', 'Dust mites', 8),
(9, 'Breast cancer', '2020-08-10', '2018-08-05', 'None', 9),
(10, 'Diabetes mellitus type 2', '2022-02-10', '2022-02-20', 'None', 1),
(11, 'Hypretension', '2021-05-03', '2021-05-15', 'Penicillin', 2),
(12, 'Asthma', '2023-03-12', '2023-03-17', 'Latex', 3),
(13, 'Migraine', '2023-06-05', '2023-06-05', 'None', 4),
(14, 'Breast cancer', '2021-02-15', '2021-02-17', 'None', 5),
(15, 'Brain tumor', '2022-04-08', '2022-04-09', 'shellfish', 6),
(16, 'Type 2 Diabetes', '2021-09-21', '2021-09-22', 'pollen', 7),
(17, 'Asthma', '2022-01-01', '2022-01-03', 'Dust mites', 8),
(18, 'Migraine', '2022-03-11', '2022-03-13', 'None', 9),
(19, 'breast cancer', '2023-05-31', '2023-06-04', 'penicillin ', 7),
(20, 'breast cancer', '2023-06-07', '2023-06-15', 'penicillin', 8),
(21, 'Breast cancer', '2018-06-15', '2018-07-01', 'None', 1),
(22, 'Breast cancer', '2018-06-15', '2018-07-01', 'None', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `medical_history_report`
-- (See below for the actual view)
--
CREATE TABLE `medical_history_report` (
`id` int(11)
,`medical_condition` varchar(255)
,`date_of_diagnosis` date
,`date_of_treatment` date
,`allergy` varchar(200)
,`patient_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `num_of_patients`
-- (See below for the actual view)
--
CREATE TABLE `num_of_patients` (
`COUNT(id)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `first_name`, `last_name`, `birth_date`, `phone`, `email`) VALUES
(1, 'Mohammad', 'Al-Samadi', '1990-03-15', 777123456, 'mohammad.alsmadi@gmail.com'),
(2, 'Rawan', 'Hussein', '1985-07-22', 787123000, 'rawan.hussein@gmail.com'),
(3, 'Ameer', 'Suleiman', '1998-11-02', 797333456, 'ameer.suleiman@gmail.com'),
(4, 'salma', 'Ghaleb', '1976-04-08', 797667336, 'salma.ghaleb@gmail.com'),
(5, 'Mariam', 'hassan', '1989-09-23', 787129986, 'mariam.hassan@gmail.com'),
(6, 'Fadi', 'Abu Khader', '1995-01-10', 793423456, 'fadi.abukhader@gmail.com'),
(7, 'Ghadeer', 'Nasser', '1980-06-18', 777432356, 'ghadeer.nasser@gmail.com'),
(8, 'Hiba', 'Mahmoud', '1970-08-01', 777923456, 'hiba.mahmoud@gmail.com'),
(9, 'Mais', 'Khalil', '1978-02-15', 777189425, 'mais.khalil@gmail.com'),
(10, 'ghada', 'Ismail', '1999-03-09', 786555443, 'ghada.ismail@outlook.com'),
(11, 'ghassan', 'Al-masri', '2000-04-10', 786456443, 'ghassan.almasri@gmail.com'),
(12, 'sami', 'mohanad', '1969-09-22', 2147483647, 'sami.mohanad@gmail.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patient_billing_info`
-- (See below for the actual view)
--
CREATE TABLE `patient_billing_info` (
`treatment_id` int(11)
,`diagnosis` varchar(300)
,`price` decimal(10,0)
,`name` varchar(100)
,`patient_id` int(11)
,`billing_id` int(11)
,`payment_type` varchar(10)
,`date` date
,`time` time
,`total_price` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `patient_medical_history`
-- (See below for the actual view)
--
CREATE TABLE `patient_medical_history` (
`id` int(11)
,`medical_condition` varchar(255)
,`date_of_diagnosis` date
,`date_of_treatment` date
,`allergy` varchar(200)
,`patient_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `patient_report`
-- (See below for the actual view)
--
CREATE TABLE `patient_report` (
`id` int(11)
,`first_name` varchar(20)
,`last_name` varchar(20)
,`birth_date` date
,`phone` int(11)
,`email` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `phone`) VALUES
(1, 'Oncology', 65550123),
(2, 'Pathology', 65550124),
(3, 'Diagnostic Imaging', 65550125),
(4, 'Surgery', 65550126);

-- --------------------------------------------------------

--
-- Stand-in structure for view `section_performance_statistics`
-- (See below for the actual view)
--
CREATE TABLE `section_performance_statistics` (
`name` varchar(100)
,`COUNT(patient.id)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `city` varchar(150) NOT NULL,
  `street` varchar(200) NOT NULL,
  `occupation` varchar(20) NOT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `first_name`, `last_name`, `email`, `phone`, `city`, `street`, `occupation`, `salary`, `section_id`) VALUES
(1, 'Fatima', 'Abdallah', 'fatima.abdallah@outlook.com', 791234567, 'Amman', 'Gardens Street', 'Nurse', 800, 1),
(2, 'Abdallah', 'Al-Khatib', 'abdallah.alkhatib@gmail.com', 771234836, 'Zarqa', 'King Hussein Street', 'Nurse', 800, 1),
(3, 'Lana', 'Al-Jarrah', 'lana.aljarrah@gmail.com', 781234500, 'Amman', 'Queen Rania Street', 'receptionist', 700, 1),
(4, 'Yasmeen', 'Al-Zoubi', 'yasmeen.alzoubi@gmail.com', 791234580, 'Irbid', 'Al-Ahliyya Street', 'Nurse', 800, 2),
(5, 'Noura', 'Al-majali', 'noura.almajali@outlook.com', 771234598, 'Jerash', 'Al-Mustashfa Street', 'Nurse', 800, 2),
(6, 'Hana', 'hassan', 'hana.hassan@gmail.com', 791234554, 'Amman', 'Al-Madina Al-Munawarah Street', 'receptionist', 700, 2),
(7, 'Dana', 'Nasser', 'dana.nasser@outlook.com', 781234589, 'Jerash', 'Al-Shuhada Street', 'Nurse', 800, 3),
(8, 'Reem', 'Khoury', 'reem.khoury@outlook.com', 771234566, 'Zarqa', 'Al-Jundi Al-Majhool Street', 'Nurse', 800, 3),
(9, 'Rasha', 'Khreisat', 'rasha.khreisat@outlook.com', 781234534, 'Amman', 'Al-Malek Faisal Streett', 'receptionist', 700, 3),
(10, 'Ahmad', 'Mostafa', 'ahmad.mostafa@outlook.com', 792348844, 'Amman', 'Abdoun circle', 'Nurse', 800, 4),
(11, 'zeina', 'Al-aani', 'zeina.alaani@outlook.com', 78230044, 'Amman', 'fifth circle', 'Nurse', 800, 4),
(12, 'yazan', 'Akram', 'yazan.akram@outlook.com', 792347744, 'Amman', 'sixth circle', 'receptionist', 700, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `staff_performance_statistics`
-- (See below for the actual view)
--
CREATE TABLE `staff_performance_statistics` (
`id` int(11)
,`COUNT(patient.id)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `staff_report`
-- (See below for the actual view)
--
CREATE TABLE `staff_report` (
`id` int(11)
,`first_name` varchar(20)
,`last_name` varchar(20)
,`email` varchar(100)
,`phone` int(11)
,`city` varchar(150)
,`street` varchar(200)
,`occupation` varchar(20)
,`salary` decimal(10,0)
,`section_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `id` int(11) NOT NULL,
  `diagnosis` varchar(300) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`id`, `diagnosis`, `price`, `name`, `patient_id`) VALUES
(1, 'Breast cancer', 5000, 'Surgery', 1),
(2, 'Colon cancer', 6000, 'Surgery', 2),
(3, 'Lung cancer', 8000, 'Radiation therapy', 3),
(4, 'Leukemia cancer', 10000, 'Bone marrow transplant', 4),
(5, 'Brain tumor', 4000, 'Surgery', 5),
(6, 'Breast cancer', 5000, 'Surgery', 6),
(7, 'Breast cancer', 5000, 'Surgery', 7),
(8, 'Colon cancer', 6000, 'Surgery', 8),
(9, 'Breast cancer', 5000, 'Surgery', 9),
(10, 'Diabetes mellitus type 2', 500, 'Oral medication', 1),
(11, 'Hypertension', 300, 'Oral medication', 2),
(12, 'Asthma', 800, 'Inhaler', 3),
(13, 'Migraine', 200, 'Pain relief medication', 4),
(14, 'Breast cancer', 5000, 'Surgery', 5),
(15, 'Brain tumor', 4000, 'Surgery', 6),
(16, 'Type 2 Diabetes', 500, 'Oral medication', 7),
(17, 'Asthma', 800, 'Inhaler', 8),
(18, 'Migraine', 200, 'Pain relief medication', 9),
(19, 'Breast cancer', 5000, 'Pathology', 10),
(20, 'Colon cancer', 6000, 'Pathology', 11),
(21, 'Lung cancer', 8000, 'Pathology', 12),
(50, 'breast cancer', 1000, 'chemo', 9);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_billing`
--

CREATE TABLE `treatment_billing` (
  `treatment_id` int(11) DEFAULT NULL,
  `billing_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_billing`
--

INSERT INTO `treatment_billing` (`treatment_id`, `billing_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 1),
(11, 2),
(12, 3),
(13, 4),
(14, 5),
(15, 6),
(16, 7),
(17, 8),
(18, 9),
(19, 10),
(20, 11),
(21, 12);

-- --------------------------------------------------------

--
-- Stand-in structure for view `treatment_info`
-- (See below for the actual view)
--
CREATE TABLE `treatment_info` (
`id` int(11)
,`diagnosis` varchar(300)
,`price` decimal(10,0)
,`name` varchar(100)
,`patient_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_medication`
--

CREATE TABLE `treatment_medication` (
  `treatment_id` int(11) NOT NULL,
  `medicine_name` varchar(50) NOT NULL,
  `medicine_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_medication`
--

INSERT INTO `treatment_medication` (`treatment_id`, `medicine_name`, `medicine_price`) VALUES
(1, 'Anastrozole', 80),
(1, 'Tamoxifen', 50),
(2, 'Loperamide', 20),
(2, 'Ondansetron', 70),
(3, 'Carboplatin', 400),
(3, 'Cisplatin', 300),
(4, 'Cyclophosphamide', 250),
(4, 'Methotrexate', 200),
(5, 'BrainShield', 497),
(5, 'BrainShield', 800),
(5, 'Crizotinib', 600),
(5, 'Temozolomide', 1000),
(6, 'Lapatinib', 800),
(6, 'Trastuzumab', 1200),
(7, 'Fulvestrant', 500),
(7, 'Palbociclib', 1000),
(8, 'Bevacizumab', 1500),
(8, 'Irinotecan', 400),
(9, 'Docetaxel', 350),
(9, 'Pertuzumab', 900),
(19, 'no medicine', 0),
(20, 'no medicine', 0),
(21, 'no medicine', 0);

-- --------------------------------------------------------

--
-- Structure for view `appointment_report`
--
DROP TABLE IF EXISTS `appointment_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `appointment_report`  AS SELECT `appointment`.`id` AS `id`, `appointment`.`date` AS `date`, `appointment`.`time` AS `time`, `appointment`.`doctor_id` AS `doctor_id`, `appointment`.`staff_id` AS `staff_id`, `appointment`.`patient_id` AS `patient_id` FROM `appointment` ;

-- --------------------------------------------------------

--
-- Structure for view `budget_report`
--
DROP TABLE IF EXISTS `budget_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `budget_report`  AS SELECT `section`.`name` AS `name`, sum(`doctor`.`salary`) AS `SUM(doctor.salary)`, sum(`staff`.`salary`) AS `SUM(staff.salary)`, sum(`doctor`.`salary`) + sum(`staff`.`salary`) AS `total_salary` FROM ((`section` join `staff`) join `doctor` on(`section`.`id` = `staff`.`section_id` and `section`.`id` = `doctor`.`id`)) GROUP BY `section`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `diagnostic_test_report`
--
DROP TABLE IF EXISTS `diagnostic_test_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `diagnostic_test_report`  AS SELECT `treatment`.`diagnosis` AS `diagnosis`, `treatment`.`patient_id` AS `patient_id` FROM `treatment` ;

-- --------------------------------------------------------

--
-- Structure for view `doctor_performance_statistics`
--
DROP TABLE IF EXISTS `doctor_performance_statistics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doctor_performance_statistics`  AS SELECT `doctor`.`id` AS `id`, count(`patient`.`id`) AS `COUNT(patient.id)` FROM ((`doctor` join `appointment`) join `patient` on(`doctor`.`id` = `appointment`.`doctor_id` and `patient`.`id` = `appointment`.`patient_id`)) GROUP BY `doctor`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `doctor_report`
--
DROP TABLE IF EXISTS `doctor_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doctor_report`  AS SELECT `doctor`.`id` AS `id`, `doctor`.`first_name` AS `first_name`, `doctor`.`last_name` AS `last_name`, `doctor`.`speciality` AS `speciality`, `doctor`.`phone` AS `phone`, `doctor`.`email` AS `email`, `doctor`.`city` AS `city`, `doctor`.`street` AS `street`, `doctor`.`salary` AS `salary`, `doctor`.`section_id` AS `section_id` FROM `doctor` ;

-- --------------------------------------------------------

--
-- Structure for view `medical_history_report`
--
DROP TABLE IF EXISTS `medical_history_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medical_history_report`  AS SELECT `medical_history`.`id` AS `id`, `medical_history`.`medical_condition` AS `medical_condition`, `medical_history`.`date_of_diagnosis` AS `date_of_diagnosis`, `medical_history`.`date_of_treatment` AS `date_of_treatment`, `medical_history`.`allergy` AS `allergy`, `medical_history`.`patient_id` AS `patient_id` FROM `medical_history` ;

-- --------------------------------------------------------

--
-- Structure for view `num_of_patients`
--
DROP TABLE IF EXISTS `num_of_patients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `num_of_patients`  AS SELECT count(`patient`.`id`) AS `COUNT(id)` FROM `patient` ;

-- --------------------------------------------------------

--
-- Structure for view `patient_billing_info`
--
DROP TABLE IF EXISTS `patient_billing_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient_billing_info`  AS SELECT `treatment`.`id` AS `treatment_id`, `treatment`.`diagnosis` AS `diagnosis`, `treatment`.`price` AS `price`, `treatment`.`name` AS `name`, `treatment`.`patient_id` AS `patient_id`, `billing`.`id` AS `billing_id`, `billing`.`payment_type` AS `payment_type`, `billing`.`date` AS `date`, `billing`.`time` AS `time`, `billing`.`total_price` AS `total_price` FROM ((`treatment` join `treatment_billing` on(`treatment`.`id` = `treatment_billing`.`treatment_id`)) join `billing` on(`billing`.`id` = `treatment_billing`.`billing_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `patient_medical_history`
--
DROP TABLE IF EXISTS `patient_medical_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient_medical_history`  AS SELECT `medical_history`.`id` AS `id`, `medical_history`.`medical_condition` AS `medical_condition`, `medical_history`.`date_of_diagnosis` AS `date_of_diagnosis`, `medical_history`.`date_of_treatment` AS `date_of_treatment`, `medical_history`.`allergy` AS `allergy`, `medical_history`.`patient_id` AS `patient_id` FROM `medical_history` ;

-- --------------------------------------------------------

--
-- Structure for view `patient_report`
--
DROP TABLE IF EXISTS `patient_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient_report`  AS SELECT `patient`.`id` AS `id`, `patient`.`first_name` AS `first_name`, `patient`.`last_name` AS `last_name`, `patient`.`birth_date` AS `birth_date`, `patient`.`phone` AS `phone`, `patient`.`email` AS `email` FROM `patient` ;

-- --------------------------------------------------------

--
-- Structure for view `section_performance_statistics`
--
DROP TABLE IF EXISTS `section_performance_statistics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `section_performance_statistics`  AS SELECT `section`.`name` AS `name`, count(`patient`.`id`) AS `COUNT(patient.id)` FROM (((`section` join `appointment`) join `doctor`) join `patient` on(`section`.`id` = `doctor`.`section_id` and `doctor`.`id` = `appointment`.`doctor_id` and `patient`.`id` = `appointment`.`patient_id`)) GROUP BY `section`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `staff_performance_statistics`
--
DROP TABLE IF EXISTS `staff_performance_statistics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff_performance_statistics`  AS SELECT `staff`.`id` AS `id`, count(`patient`.`id`) AS `COUNT(patient.id)` FROM ((`staff` join `appointment`) join `patient` on(`staff`.`id` = `appointment`.`staff_id` and `patient`.`id` = `appointment`.`patient_id`)) GROUP BY `staff`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `staff_report`
--
DROP TABLE IF EXISTS `staff_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff_report`  AS SELECT `staff`.`id` AS `id`, `staff`.`first_name` AS `first_name`, `staff`.`last_name` AS `last_name`, `staff`.`email` AS `email`, `staff`.`phone` AS `phone`, `staff`.`city` AS `city`, `staff`.`street` AS `street`, `staff`.`occupation` AS `occupation`, `staff`.`salary` AS `salary`, `staff`.`section_id` AS `section_id` FROM `staff` ;

-- --------------------------------------------------------

--
-- Structure for view `treatment_info`
--
DROP TABLE IF EXISTS `treatment_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `treatment_info`  AS SELECT `treatment`.`id` AS `id`, `treatment`.`diagnosis` AS `diagnosis`, `treatment`.`price` AS `price`, `treatment`.`name` AS `name`, `treatment`.`patient_id` AS `patient_id` FROM `treatment` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_3` (`doctor_id`),
  ADD KEY `FK_4` (`staff_id`),
  ADD KEY `FK_5` (`patient_id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1` (`section_id`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_6` (`patient_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_2` (`section_id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7` (`patient_id`);

--
-- Indexes for table `treatment_billing`
--
ALTER TABLE `treatment_billing`
  ADD KEY `FK_10` (`treatment_id`),
  ADD KEY `FK_11` (`billing_id`);

--
-- Indexes for table `treatment_medication`
--
ALTER TABLE `treatment_medication`
  ADD PRIMARY KEY (`treatment_id`,`medicine_name`,`medicine_price`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_5` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `FK_6` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `FK_7` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `treatment_billing`
--
ALTER TABLE `treatment_billing`
  ADD CONSTRAINT `FK_10` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_11` FOREIGN KEY (`billing_id`) REFERENCES `billing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `treatment_medication`
--
ALTER TABLE `treatment_medication`
  ADD CONSTRAINT `FK_9` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
