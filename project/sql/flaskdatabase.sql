-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2021 at 01:58 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `page_access`
--

CREATE TABLE `page_access` (
  `Id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `architect` tinyint(1) DEFAULT 0,
  `operations` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_access`
--

INSERT INTO `page_access` (`Id`, `uid`, `admin`, `architect`, `operations`) VALUES
(1, 7, 1, 1, 0),
(3, 8, 1, 1, 1),
(5, 10, 0, 1, 0),
(6, 11, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `email`, `password`, `type`) VALUES
(7, 'Anand', 'anand@email.com', '$2b$12$blSYk36a9LogZzMUz/6dz.S7TLm5jk9Zuh.NazL77yxp2laoTwGvG', 'architect'),
(8, 'anand', 'admin@admin.com', '$2b$12$EkaKfU7BssZFdN6kQg/PquuUMHi61dwo9EdlTeaw/3JCCYT7EaG.G', 'admin'),
(10, 'Anand', 'anand@gmail.com', '$2b$12$bmlYpcryXhVc7kuA5cEex..3zUo1wEM4PRz8DEP.DMpwqaaVnsUX2', 'admin'),
(11, 'Amey', 'amey@email.com', '$2b$12$LiB/mQ5wuAMlIZquYPhjbeWaDzJE2uwY/IokUjuXKPuKDb5L5AowS', 'operations');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `page_access`
--
ALTER TABLE `page_access`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `uid_UNIQUE` (`uid`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `page_access`
--
ALTER TABLE `page_access`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
