-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 05, 2017 at 07:12 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ProjetIS`
--

-- --------------------------------------------------------

--
-- Table structure for table `Etat`
--

CREATE TABLE `Etat` (
  `id` int(11) NOT NULL,
  `nomEtat` varchar(20) NOT NULL,
  `couleur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Etat`
--

INSERT INTO `Etat` (`id`, `nomEtat`, `couleur`) VALUES
(1, 'off', '#818181'),
(2, 'on', '#26FF00'),
(3, 'hs', '#F00000'),
(4, 'reparation', '#F0B400');

-- --------------------------------------------------------

--
-- Table structure for table `Position`
--

CREATE TABLE `Position` (
  `id` int(11) NOT NULL,
  `nomPosition` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Position`
--

INSERT INTO `Position` (`id`, `nomPosition`) VALUES
(18, 'asc1'),
(19, 'asc2'),
(1, 'cave1'),
(2, 'cave2'),
(3, 'cave3'),
(4, 'cave4'),
(5, 'cave5'),
(6, 'cave6'),
(7, 'cave7'),
(8, 'cave8'),
(9, 'cave9'),
(20, 'dome'),
(22, 'fond'),
(21, 'hell'),
(10, 'tunnel1'),
(11, 'tunnel2'),
(12, 'tunnel3'),
(13, 'tunnel4'),
(14, 'tunnel5'),
(15, 'tunnel6'),
(16, 'tunnel7'),
(17, 'tunnel8');

-- --------------------------------------------------------

--
-- Table structure for table `Robot`
--

CREATE TABLE `Robot` (
  `id` int(11) NOT NULL,
  `nomRobot` varchar(20) NOT NULL,
  `etat` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Robot`
--

INSERT INTO `Robot` (`id`, `nomRobot`, `etat`, `position`) VALUES
(1, 'Robot1', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Etat`
--
ALTER TABLE `Etat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Position`
--
ALTER TABLE `Position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nomPosition`);

--
-- Indexes for table `Robot`
--
ALTER TABLE `Robot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etat` (`etat`),
  ADD UNIQUE KEY `position` (`position`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Position`
--
ALTER TABLE `Position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `Robot`
--
ALTER TABLE `Robot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Robot`
--
ALTER TABLE `Robot`
  ADD CONSTRAINT `fkEtat` FOREIGN KEY (`etat`) REFERENCES `Etat` (`id`),
  ADD CONSTRAINT `fkPosition` FOREIGN KEY (`position`) REFERENCES `Position` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
