-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 29, 2019 at 07:22 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tax`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$8TfRpAvWOLyqrBxUpFYzQOzdGbs0LPGS.bgpXHTOL59zo1JiPm5ni');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company_id` varchar(150) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `company_size` varchar(30) DEFAULT NULL,
  `company_pin` varchar(4) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_id`, `company_name`, `company_size`, `company_pin`, `location`) VALUES
(2, 'company-5cecdd6f82752', 'XAOMI', '1000-100000', '2343', 'CHINA'),
(3, 'company-5cecdf0c87993', 'TELSA', '1000-100000', '5623', 'USA'),
(4, 'company-5cece35ba1c88', 'LUCKY PEN', '50-1000', '2342', 'NIGERIA');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `other_name` varchar(30) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `company` varchar(300) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `salary` bigint(11) NOT NULL,
  `tax` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `username`, `password`, `first_name`, `last_name`, `other_name`, `sex`, `status`, `address`, `occupation`, `company`, `email`, `salary`, `tax`) VALUES
(1, 'ceo', 'ADMIN', 'Elon ', 'Musk', 'Prick', 'male', 'married', 'TEXAS, USA', 'Opportunist', 'TELSA', '', 23000000, 5),
(2, 'grethi', 'bridge', 'Mark ', 'Bridge', 'Grethi', 'male', 'divorced', 'Illionios, USA', 'IT ', 'TELSA', '', 500000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `reference` varchar(300) DEFAULT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `tax` bigint(11) DEFAULT NULL,
  `amount` varchar(11) DEFAULT NULL,
  `date_payed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(30) NOT NULL DEFAULT 'completed'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `username`, `reference`, `company_name`, `tax`, `amount`, `date_payed`, `status`) VALUES
(2, ' Emma', '27194788', 'LUCKY PEN', 5, '20,000', '2019-05-28 17:31:57', 'completed'),
(3, ' Peter', '18764957', 'XAOMI', 10, '350000', '2019-05-28 18:03:00', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `company_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `company_name`) VALUES
(7, 'Elon', 'master', 'TELSA'),
(8, 'Emma', 'praise', 'LUCKY PEN'),
(9, 'Peter', 'master', 'XAOMI'),
(10, 'Joseph', '123456', 'XAOMI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`),
  ADD UNIQUE KEY `company_name` (`company_name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
