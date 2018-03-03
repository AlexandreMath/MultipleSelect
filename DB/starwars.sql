-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 02 Mars 2018 à 14:35
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `starwars`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartenance`
--

CREATE TABLE `appartenance` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `appartenance`
--

INSERT INTO `appartenance` (`id`, `name`) VALUES
(1, 'Empire Galactique'),
(2, 'Alliance Rebelle'),
(3, 'R&eacute;publique Galactique'),
(4, 'Ordre Jedi'),
(5, 'Ordre Sith');

-- --------------------------------------------------------

--
-- Structure de la table `organisation`
--

CREATE TABLE `organisation` (
  `id` int(10) NOT NULL,
  `foreign_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `organisation`
--

INSERT INTO `organisation` (`id`, `foreign_id`, `name`) VALUES
(1, 5, 'Confr&eacute;rie des Sith'),
(2, 5, 'Disciples de Ragnos'),
(3, 4, 'Gardes du Temple Jedi'),
(4, 4, 'Conseil Jedi'),
(5, 4, 'Conseil de l\'Enclave Jedi de Dantooine'),
(6, 1, 'Arm&eacute;e de terre Imp&eacute;riale'),
(7, 3, '501&egrave;me l&eacute;gion'),
(8, 2, 'Escadron Rogue'),
(9, 2, 'Escadron Phoenix'),
(10, 1, 'Escadron de la Mort'),
(11, 3, 'Flotte Open Circle'),
(12, 1, 'Marine Imp&eacute;rial');

-- --------------------------------------------------------

--
-- Structure de la table `personnages`
--

CREATE TABLE `personnages` (
  `id` int(10) NOT NULL,
  `foreign_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `personnages`
--

INSERT INTO `personnages` (`id`, `foreign_id`, `name`) VALUES
(1, 3, 'Garde un'),
(2, 5, 'Zhar Lestin'),
(3, 2, 'Alora'),
(4, 3, 'Garde deux'),
(5, 2, 'Tavion'),
(6, 1, 'Exar Kun'),
(7, 11, 'Anakin Skywalker'),
(8, 11, 'Yularen'),
(9, 12, 'Pellaeon'),
(10, 12, 'Daala'),
(11, 5, 'Aleco Stusea'),
(12, 4, 'Yoda'),
(13, 8, 'Luke Skywalker'),
(14, 9, 'Hera'),
(15, 1, 'Ulic Qel-Droma'),
(16, 4, 'Obi-Wan Kenobi'),
(17, 8, 'Wedge Antilles'),
(18, 6, 'Veers'),
(19, 7, 'Rex'),
(20, 9, 'Dicer'),
(21, 10, 'Piett'),
(22, 10, 'Ozzel'),
(23, 7, 'Ashoka Tano'),
(24, 6, 'Cav');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appartenance`
--
ALTER TABLE `appartenance`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personnages`
--
ALTER TABLE `personnages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `appartenance`
--
ALTER TABLE `appartenance`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `personnages`
--
ALTER TABLE `personnages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
