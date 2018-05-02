-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 30 avr. 2018 à 20:43
-- Version du serveur :  5.7.17
-- Version de PHP :  7.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdgaragevirtuel`
--
CREATE DATABASE IF NOT EXISTS `bdgaragevirtuel` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bdgaragevirtuel`;

-- --------------------------------------------------------

--
-- Structure de la table `abonnements`
--

CREATE TABLE `abonnements` (
  `idAbonnement` int(8) NOT NULL,
  `typeAbonnement` varchar(8) CHARACTER SET latin1 NOT NULL,
  `prix` decimal(2,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `idAdresse` int(11) NOT NULL,
  `idMembre` int(11) DEFAULT NULL,
  `numeroCivique` int(11) DEFAULT NULL,
  `nomRue` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codePostal` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(18,9) DEFAULT NULL,
  `longitude` decimal(18,9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`idAdresse`, `idMembre`, `numeroCivique`, `nomRue`, `ville`, `codePostal`, `region`, `latitude`, `longitude`) VALUES
(1, 1, 12, 'Natalia Panfilii', 'Mont-Royal', '', 'QC', NULL, NULL),
(2, 2, 12, 'Natalia Panfilii', 'Mont-Royal', '', 'QC', NULL, NULL),
(3, 3, 23, 'Acadie', 'Montreal', 'H3R3L2', 'Qc', '45.518729500', '-73.654724700'),
(4, 4, 25, 'Acadie', 'Laval', 'H1H1H1', 'La', NULL, NULL),
(5, 5, 23, 'Natalia Panfilii', 'Mont-Royal', 'H3R-3L2', 'QC', '45.518729500', '-73.654724700'),
(6, 7, 12, 'Natalia', 'Mont-Royal', 'H3R-3L2', 'QC', '45.518729500', '-73.654724700'),
(7, 8, 12, 'Natalia', 'Mont-Royal', 'H3R 3L2', 'QC', '45.518729500', '-73.654724700'),
(8, 16, 12, 'cftydryt', 'xfghxf', 'H3R-3L2', 'gfghxf', '45.518729500', '-73.654724700'),
(9, 17, 12, 'Natalia Panfilii', 'Mont-Royal', 'H3R-3L2', 'QC', '45.518729500', '-73.654724700'),
(10, 18, 12, 'Natalia ', 'Mont-Royal', 'H3R-3L2', 'QC', '45.518729500', '-73.654724700'),
(11, 19, 12, 'Natalia Panfilii', 'Mont-Royal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(12, 20, 12, 'Natalia Panfilii', 'Mont-Royal', 'H3R-3L2', 'QC', '45.518729500', '-73.654724700'),
(13, 21, 12, 'Natalia Panfilii', 'Mont-Royal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(14, 22, 12, 'Natalia Panfilii', 'Mont-Royal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(15, 24, 12, 'Glengarry', 'Mont-Royal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(16, 26, 23, 'acadie', 'Mont-Royal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(17, 27, 11, 'Natalia', 'Mont-Royal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(18, 29, 12, 'Natalia', 'Mont-Royal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(19, 30, 12, 'Glengarry', 'Montreal', 'H3R3L2', 'QC', '45.518729500', '-73.654724700'),
(20, 31, 25, 'Acadie', 'Montreal', 'H2K2K1', 'Qc', '45.529729700', '-73.545975300'),
(21, 32, 25, 'Hubert', 'Trois Rivier', 'H3R3L2', 'Qc', '45.518729500', '-73.654724700');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `idCategorie` int(8) NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategorie`, `description`) VALUES
(1, 'Accessoires Informatiques'),
(2, 'Appareils electromenagers'),
(3, 'Appareils photo et cameras'),
(4, 'Art et objet de collection'),
(5, 'Articles pour bebes'),
(6, 'Articles de sport et exercice'),
(7, 'Autre'),
(8, 'Bijoux et montres'),
(9, 'Equipements electroniques'),
(10, 'Instruments de musique'),
(11, 'Objets gratuits'),
(12, 'Sante et besoins speciaux'),
(13, 'Souliers'),
(14, 'velos'),
(15, 'vetements');

-- --------------------------------------------------------

--
-- Structure de la table `connexions`
--

CREATE TABLE `connexions` (
  `idMembre` int(11) NOT NULL,
  `courriel` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `motPasse` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `connexions`
--

INSERT INTO `connexions` (`idMembre`, `courriel`, `motPasse`) VALUES
(3, 'delia@yahoo.com', '67b7dc54f86a48e0679841bb490a26657975b1d7'),
(4, 'maria@yahoo.com', '396f32a0e2e530a3d6c895fcab609e4a614e12f9'),
(1, 'nataliapanfi@gmail.com', '67b7dc54f86a48e0679841bb490a26657975b1d7'),
(2, 'nataliapanfilii86@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(7, 'pan@yahoo.com', '396f32a0e2e530a3d6c895fcab609e4a614e12f9');

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `idEvenement` int(8) NOT NULL,
  `titreEvenement` varchar(150) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `idAdresse` int(8) NOT NULL,
  `idProduit` int(8) NOT NULL,
  `dateDebut` datetime NOT NULL,
  `dateFin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `idMembre` int(4) NOT NULL,
  `prenom` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateNaissance` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexe` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoMembre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courriel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `motPasse` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`idMembre`, `prenom`, `nom`, `telephone`, `dateNaissance`, `sexe`, `photoMembre`, `courriel`, `motPasse`) VALUES
(13, 'zdsdfsf', 'zxfdgzd', '5147894561', '02/12/1234', 'M', 'avatar.jpg', 'nataliapa@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(14, 'sdfgsd', 'dfhgsf', '5147894561', '12/12/1234', 'M', 'avatar.jpg', 'delia@yahoo.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(15, 'nbvgvhg', 'hdgdg', '5146547896', '', 'M', 'avatar.jpg', 'nataliapanfilii85@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(16, 'xghxfh', 'fhxc', '5147894563', '02/13/1988', 'M', 'avatar.jpg', 'deliay@yahoo.com', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a'),
(17, 'sbvsvdbv', 'xdjgzfjdhfzh', '', '', 'M', 'avatar.jpg', 'nataliapanfilii@yahoo.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(18, 'zdsfsf', 'djhfszhf', '5146919845', '', 'M', 'avatar.jpg', 'nataliapanfilii86@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(19, 'srtsrter', 'srtsrt', '5146919845', '12/12/2017', 'M', 'avatar.jpg', 'nataliapanfilii@gmail.com', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a'),
(20, 'sdfsfa', 'xfgdfgs', '5146918745', '12/12/1234', 'M', 'avatar.jpg', 'nataliapanfilii89@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(21, 'sdrtdet', 'dfgdg', '', '', 'M', 'avatar.jpg', 'nataliapanfilii87@mail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(22, 'fgfg', 'hgfhgf', '', '', 'M', 'avatar.jpg', 'nataliapanfilii877@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(23, 'fgfg', 'hgfhgf', '', '', 'M', 'avatar.jpg', 'nataliapanfilii77@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(24, 'Eugeniu', 'Panfilii', '5146997845', '28/03/1987', 'M', 'avatar.jpg', 'eugen@yahoo.com', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a'),
(26, 'Delia', 'Panfilii', '', '', 'M', 'avatar.jpg', 'deluta@yahoo.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(27, 'dfgdgzsdg', 'dfdzfz', '', '', 'M', 'avatar.jpg', 'natalia@yahoo.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(28, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', ''),
(29, 'Magdalena', 'Mariana', '5146984561', '02/03/1999', 'M', 'avatar.jpg', 'nataliapanfilii81@gmail.com', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a'),
(30, 'Natalia', 'Jabinschi', '5147894561', '02/12/1789', 'M', 'd64136b42cc73a27f004873d2f3aa6901bf08ae7.jpg', 'natynela@yahoo.com', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a'),
(31, 'Lipceanu', 'Mariana', '51478945623', '02/05/1988', 'F', 'e299e7535a72426c3bb6eaec06345f3d85312f85.jpg', 'mariana@yahoo.com', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a'),
(32, 'Alexandra', 'Jambina', '5147894561', '02/05/1789', 'F', '4fb541d7f2b1ead372ab3221e17956888dd8a64e.jpg', 'alexandra@yahoo.com', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a');

-- --------------------------------------------------------

--
-- Structure de la table `photoproduits`
--

CREATE TABLE `photoproduits` (
  `idPhoto` int(8) NOT NULL,
  `idProduit` int(8) NOT NULL,
  `idEvenement` int(8) NOT NULL,
  `photoProd` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `idProduit` int(8) NOT NULL,
  `nomProduit` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `quantite` int(5) NOT NULL,
  `idCategorie` int(8) NOT NULL,
  `idMembre` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vendeurs`
--

CREATE TABLE `vendeurs` (
  `idMembre` int(8) NOT NULL,
  `idAbonnement` int(8) NOT NULL,
  `idAdresse` int(8) NOT NULL,
  `idEvenement` int(8) NOT NULL,
  `idProduit` int(8) NOT NULL,
  `actif` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnements`
--
ALTER TABLE `abonnements`
  ADD PRIMARY KEY (`idAbonnement`);

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`idAdresse`),
  ADD KEY `adresses_ibfk_2` (`idMembre`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `connexions`
--
ALTER TABLE `connexions`
  ADD UNIQUE KEY `courriel` (`courriel`),
  ADD KEY `connexions_ibfk_` (`idMembre`);

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`idEvenement`),
  ADD KEY `Evenements_FK` (`idAdresse`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`idMembre`);

--
-- Index pour la table `photoproduits`
--
ALTER TABLE `photoproduits`
  ADD PRIMARY KEY (`idPhoto`),
  ADD KEY `PhotoProduits_FK_idProduit` (`idProduit`),
  ADD KEY `PhotoProduits_FK_idEvenement` (`idEvenement`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`idProduit`),
  ADD KEY `Produits_FK_idVendeur` (`idMembre`),
  ADD KEY `Produits_FK_idCategorie` (`idCategorie`);

--
-- Index pour la table `vendeurs`
--
ALTER TABLE `vendeurs`
  ADD KEY `Vendeurs_FK_idMembre` (`idMembre`),
  ADD KEY `Vendeurs_FK_idAbonnement` (`idAbonnement`),
  ADD KEY `Vendeurs_FK_idEvenement` (`idEvenement`),
  ADD KEY `Vendeurs_FK_idProduit` (`idProduit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnements`
--
ALTER TABLE `abonnements`
  MODIFY `idAbonnement` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `idAdresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategorie` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `idEvenement` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `idMembre` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `photoproduits`
--
ALTER TABLE `photoproduits`
  MODIFY `idPhoto` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `idProduit` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vendeurs`
--
ALTER TABLE `vendeurs`
  MODIFY `idMembre` int(8) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `adresses_ibfk_2` FOREIGN KEY (`idMembre`) REFERENCES `membres` (`idMembre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `connexions`
--
ALTER TABLE `connexions`
  ADD CONSTRAINT `connexions_ibfk_1` FOREIGN KEY (`idMembre`) REFERENCES `membres` (`idMembre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
