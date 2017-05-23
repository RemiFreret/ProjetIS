-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 23 Mai 2017 à 19:53
-- Version du serveur :  5.7.18-0ubuntu0.16.04.1
-- Version de PHP :  7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ProjetIS`
--

-- --------------------------------------------------------

--
-- Structure de la table `Alerte`
--

CREATE TABLE `Alerte` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `idRobot` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Alerte`
--

INSERT INTO `Alerte` (`id`, `type`, `date`, `description`, `position`, `idRobot`) VALUES
(1, '0', '2017-05-22 14:20:02', 'Eboulement dans le tunnel n°1, le passage a été debloqué.', 11, 1),
(2, '1', '2017-05-20 14:28:02', 'Réparation du robot n°2', 1, 2),
(3, '1', '2017-05-11 14:33:54', 'Révision du robot n°1', 1, 1),
(4, '0', '2017-05-18 22:04:00', 'Glissement de terrain dans la cave n°7.\r\n', 7, 1),
(5, '0', '2017-05-12 10:24:00', 'Eboulement dans la cave n°1', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `composante`
--

CREATE TABLE `composante` (
  `id` int(11) NOT NULL,
  `nomComposante` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `composante`
--

INSERT INTO `composante` (`id`, `nomComposante`) VALUES
(1, 'Bibliothèque universitaire'),
(2, 'Centre de recherche Christiaan HUYGENS'),
(3, 'Compositic'),
(4, 'Centre Kerjulaude'),
(5, 'École d\'ingénieurs ENSIBS'),
(6, 'Faculté Droit, Sciences Économiques & Gestion'),
(7, 'Faculté Lettres, Langues, Sciences Humaines & Sociales'),
(8, 'Faculté Sciences & Sciences de l\'Ingénieur'),
(9, 'IUT'),
(10, 'Maison des Étudiants'),
(11, 'Présidence');

-- --------------------------------------------------------

--
-- Structure de la table `Etat`
--

CREATE TABLE `Etat` (
  `id` int(11) NOT NULL,
  `nomEtat` varchar(20) NOT NULL,
  `couleur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Etat`
--

INSERT INTO `Etat` (`id`, `nomEtat`, `couleur`) VALUES
(1, 'OFF', '#818181'),
(2, 'ON', '#26FF00'),
(3, 'HS', '#F00000'),
(4, 'Maintenance', '#F0B400');

-- --------------------------------------------------------

--
-- Structure de la table `Mine`
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
-- Contenu de la table `Mine`
--

INSERT INTO `Mine` (`id`, `dechetTotal`, `dechetExtrait`, `dechetExtraitMois`, `dechetExtraitSemaine`, `mouleJour`, `mouleAjd`, `capMoule`, `jourDebut`) VALUES
(0, 76800, 10686, 606, 54, 8, 2, 3, '07/03/2016');

-- --------------------------------------------------------

--
-- Structure de la table `Position`
--

CREATE TABLE `Position` (
  `id` int(11) NOT NULL,
  `nomPosition` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Position`
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
-- Structure de la table `Robot`
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
-- Contenu de la table `Robot`
--

INSERT INTO `Robot` (`id`, `nomRobot`, `etat`, `position`, `batterie`, `nomOpérateur`) VALUES
(1, 'Robot1', 1, 20, 95, 'Philippe'),
(2, 'Robot2', 2, 1, 53, 'Merlin'),
(3, 'Robot3', 2, 14, 77, 'Michel Vedette');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Alerte`
--
ALTER TABLE `Alerte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `composante`
--
ALTER TABLE `composante`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Etat`
--
ALTER TABLE `Etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Mine`
--
ALTER TABLE `Mine`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Position`
--
ALTER TABLE `Position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nomPosition`);

--
-- Index pour la table `Robot`
--
ALTER TABLE `Robot`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Position`
--
ALTER TABLE `Position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `Robot`
--
ALTER TABLE `Robot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
