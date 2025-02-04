-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2025 at 03:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videogameparlour`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `SessionNumber` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `IsMember` char(1) DEFAULT NULL,
  `Fee` decimal(10,2) DEFAULT NULL,
  `IsPrepaid` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `SessionNumber`, `CustomerID`, `BookingDate`, `IsMember`, `Fee`, `IsPrepaid`) VALUES
(1, 1, 1, '2024-07-22', 'Y', NULL, NULL),
(2, 1, 2, '2024-07-22', 'N', 1500.00, 'N'),
(3, 1, 3, '2024-07-22', 'Y', NULL, 'Y'),
(4, 1, 4, '2024-08-25', 'N', 1500.00, 'N'),
(5, 2, 2, '2024-07-22', 'N', 1000.00, 'N'),
(6, 4, 2, '2024-07-05', 'N', 1000.00, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MemberType` varchar(20) DEFAULT NULL,
  `MembershipFee` decimal(10,2) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `Surname`, `Address`, `MemberType`, `MembershipFee`, `JoinDate`, `DateOfBirth`) VALUES
(1, 'Saanvi', 'Bhatta', 'Baneshwor, Kathmandu', 'Standard', 1500.00, '2024-01-01', '2015-03-01'),
(2, 'Bill', 'Gates', 'Maitidevi, Kathmandu', 'Premium', 2000.00, '2024-06-07', '2001-12-10'),
(3, 'Elon', 'Musk', 'Putalisadak, Kathmandu', 'Premium', 2000.00, '2024-03-28', '2003-07-20'),
(4, 'Kamala', 'Harris', 'Kapan, Kathmandu', 'Standard', 1500.00, '2024-01-05', '1973-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `GameID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `PEGI` int(11) DEFAULT NULL,
  `Console` varchar(50) DEFAULT NULL,
  `ConsoleQty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`GameID`, `Name`, `Year`, `PEGI`, `Console`, `ConsoleQty`) VALUES
(1, 'COC', '2010', NULL, NULL, NULL),
(2, 'GTA', '2013', NULL, NULL, NULL),
(3, 'Spiderman', '2016', NULL, NULL, NULL),
(4, 'PUBG', '2004', NULL, NULL, NULL),
(5, 'Elden Ring: Shadow of the Erdtree', '2022', 0, 'XBOX 360', 3),
(6, 'Final Fantasy VII Rebirth', '2023', 0, 'PS3', 2),
(7, 'Tekken 8', '2023', 0, 'PS3', 2),
(8, 'Cavern of Dreams', '2022', 15, 'Nintendo Switch', 4);

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `MachineNumber` int(11) NOT NULL,
  `GameID` int(11) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`MachineNumber`, `GameID`, `Floor`) VALUES
(1, 1, 1),
(3, 3, 2),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `SessionNumber` int(11) NOT NULL,
  `SessionDay` varchar(20) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `SessionType` varchar(20) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`SessionNumber`, `SessionDay`, `StartTime`, `EndTime`, `SessionType`, `Floor`, `Price`) VALUES
(1, 'Sunday', '09:00:00', '21:00:00', 'Free', 1, 1500.00),
(2, 'Sunday', '09:00:00', '21:00:00', 'Free', 2, 1500.00),
(3, 'Saturday', '09:00:00', '21:00:00', 'Free', 1, 1500.00),
(4, 'Friday', '18:00:00', '22:00:00', 'Special', 2, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `sessionconsole`
--

CREATE TABLE `sessionconsole` (
  `SessionConsoleID` int(11) NOT NULL,
  `SessionNumber` int(11) DEFAULT NULL,
  `Console` varchar(50) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessionconsole`
--

INSERT INTO `sessionconsole` (`SessionConsoleID`, `SessionNumber`, `Console`, `Qty`) VALUES
(1, 1, 'PS2', 2),
(2, 2, 'PS3', 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `StaffName` varchar(50) DEFAULT NULL,
  `SessionNumber` int(11) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `StaffName`, `SessionNumber`, `Role`) VALUES
(1, 'Sagar Aryal', 1, 'Cafe'),
(2, 'Bikesh Khagdi', 1, 'Maintenance'),
(3, 'Saroj Sapkota', 1, 'Counter'),
(4, 'Jonathan Shrestha', 2, 'Counter'),
(5, 'Rohan Chaudhary', 2, 'Maintenance'),
(6, 'Rajeev Karmacharya', 2, 'Cafe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `SessionNumber` (`SessionNumber`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`GameID`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`MachineNumber`),
  ADD KEY `GameID` (`GameID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`SessionNumber`);

--
-- Indexes for table `sessionconsole`
--
ALTER TABLE `sessionconsole`
  ADD PRIMARY KEY (`SessionConsoleID`),
  ADD KEY `SessionNumber` (`SessionNumber`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `SessionNumber` (`SessionNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `GameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `MachineNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `SessionNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sessionconsole`
--
ALTER TABLE `sessionconsole`
  MODIFY `SessionConsoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`SessionNumber`) REFERENCES `session` (`SessionNumber`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`);

--
-- Constraints for table `sessionconsole`
--
ALTER TABLE `sessionconsole`
  ADD CONSTRAINT `sessionconsole_ibfk_1` FOREIGN KEY (`SessionNumber`) REFERENCES `session` (`SessionNumber`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`SessionNumber`) REFERENCES `session` (`SessionNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
