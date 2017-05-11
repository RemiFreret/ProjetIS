-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2017 at 02:53 PM
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
-- Table structure for table `Alerte`
--

CREATE TABLE `Alerte` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `idRobot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Alerte`
--

INSERT INTO `Alerte` (`id`, `type`, `date`, `description`, `position`, `idRobot`) VALUES
(1, 'Alarme', '2017-05-11 14:28:02', 'Eboulement dans le tunnel n°1, le passage a été debloqué.', 11, NULL),
(2, 'Info', '2017-05-11 14:28:02', 'Réparation du robot n°2', NULL, 2),
(3, 'Alarme', '2017-05-11 14:33:54', 'Début d\'inondation dans la cave 3.', 3, NULL),
(4, 'Info', '2017-05-11 14:33:54', 'Révision du robot n°1', NULL, 1);

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
-- Table structure for table `Mine`
--

CREATE TABLE `Mine` (
  `id` int(11) NOT NULL,
  `dechetTotal` int(11) NOT NULL,
  `dechetExtrait` int(11) NOT NULL,
  `dechetExtraitMois` int(11) NOT NULL,
  `dechetExtraitSemaine` int(11) NOT NULL,
  `mouleJour` int(11) NOT NULL,
  `mouleAjd` int(11) NOT NULL,
  `capMoule` int(11) NOT NULL,
  `jourDebut` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mine`
--

INSERT INTO `Mine` (`id`, `dechetTotal`, `dechetExtrait`, `dechetExtraitMois`, `dechetExtraitSemaine`, `mouleJour`, `mouleAjd`, `capMoule`, `jourDebut`) VALUES
(0, 76800, 10344, 240, 72, 8, 3, 3, '07/03/2016');

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
  `position` int(11) NOT NULL,
  `batterie` int(11) DEFAULT NULL,
  `nomOpérateur` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Robot`
--

INSERT INTO `Robot` (`id`, `nomRobot`, `etat`, `position`, `batterie`, `nomOpérateur`) VALUES
(1, 'Robot1', 2, 11, 50, 'Philippe'),
(2, 'Robot2', 3, 16, 100, 'Merlin'),
(3, 'Robot3', 1, 1, 75, 'Michel Vedette');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Alerte`
--
ALTER TABLE `Alerte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Etat`
--
ALTER TABLE `Etat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Mine`
--
ALTER TABLE `Mine`
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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
