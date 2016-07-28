-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 25, 2016 at 12:19 PM
-- Server version: 5.6.28
-- PHP Version: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `automaintenance`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto`
--

CREATE TABLE `auto` (
  `id_auto` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `mileage` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auto`
--

INSERT INTO `auto` (`id_auto`, `name`, `make`, `model`, `year`, `mileage`) VALUES
(1, 'JimsCar', 'Honda', 'Civic', 2000, 146000),
(2, 'HyesooksCar', 'Toyota', 'Camry', 2001, 125000),
(3, 'JanesCar', 'Subaru', 'Outback', 2009, 76000),
(4, 'MomsCar', 'Subaru', 'Outback', 2016, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id_maintenance` int(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  `lastdate` date NOT NULL,
  `everymonths` int(11) NOT NULL,
  `lastmileage` int(11) NOT NULL,
  `everymiles` int(11) NOT NULL,
  `auto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id_maintenance`, `description`, `lastdate`, `everymonths`, `lastmileage`, `everymiles`, `auto`) VALUES
(1, 'Change Oil', '2016-05-15', 6, 145000, 6000, 1),
(2, 'Rotate Tires', '2016-06-01', 6, 143000, 5000, 1),
(3, 'Change wiper blades', '2013-07-05', 36, 115000, 10000, 2),
(4, 'Replace air filter', '2012-05-05', 100, 110000, 15000, 2),
(5, 'Change transmission fluid', '2013-07-08', 36, 50000, 30000, 3),
(6, 'Replace front brake pads', '2012-06-10', 36, 35000, 35000, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id_auto`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id_maintenance`),
  ADD KEY `IDX_auto` (`auto`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `id_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id_maintenance` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `FK_MAINTENANCE_AUTO` FOREIGN KEY (`auto`) REFERENCES `auto` (`id_auto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
