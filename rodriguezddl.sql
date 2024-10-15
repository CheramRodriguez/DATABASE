-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 04:41 PM
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
-- Database: `rodriguezddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` int(11) DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderID`, `ProductID`, `Quantity`, `UnitPrice`, `Discount`, `StatusID`) VALUES
(1, 1, 2, 10, 0, 1),
(1, 2, 3, 20, 0, 1),
(2, 3, 4, 30, 0, 1),
(2, 4, 5, 40, 0, 1),
(3, 5, 6, 50, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `EmployeeID`, `CustomerID`, `OrderDate`, `ShippedDate`, `ShipperID`) VALUES
(1, 1, 1, '2023-01-01', '2023-01-10', 1),
(2, 2, 2, '2023-02-01', '2023-02-10', 2),
(3, 3, 3, '2023-03-01', '2023-03-10', 3),
(4, 4, 4, '2023-04-01', '2023-04-10', 4),
(5, 5, 5, '2023-05-01', '2023-05-10', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductCode` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `StandardCost` int(11) DEFAULT NULL,
  `ListPrice` int(11) DEFAULT NULL,
  `ReorderLevel` int(11) DEFAULT NULL,
  `TargetLevel` int(11) DEFAULT NULL,
  `QuantityPerUnit` int(11) DEFAULT NULL,
  `Discontinued` tinyint(1) DEFAULT NULL,
  `MinimumReorderQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductCode`, `ProductName`, `Description`, `StandardCost`, `ListPrice`, `ReorderLevel`, `TargetLevel`, `QuantityPerUnit`, `Discontinued`, `MinimumReorderQuantity`) VALUES
(1, 'P1', 'shampoo', 'A shampoo is a hair care product, typically in the form of a viscous liquid, that is used for cleaning hair', 10, 20, 10, 20, 1, 0, 5),
(2, 'P2', 'ballpen', 'A ballpen, also known as a ballpoint pen, is a writing instrument that uses a small metal ball to dispense ink onto a surface, typically paper', 20, 30, 20, 30, 2, 0, 10),
(3, 'P3', 'notebook', 'A notebook is a concise and captivating summary that highlights its unique features, purpose, and benefits', 30, 40, 30, 40, 3, 0, 15),
(4, 'P4', 'make up', 'Makeup products are cosmetic items used to enhance or alter one\'s appearance', 40, 50, 40, 50, 4, 0, 20),
(5, 'P5', 'Toilet paper', 'Toilet paper, also known as toilet tissue, is an essential household item used for personal hygiene after using the toilet', 50, 60, 50, 60, 5, 0, 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
