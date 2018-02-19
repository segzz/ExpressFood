-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  jeu. 28 déc. 2017 à 16:42
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `Expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `adresse_1` varchar(200) DEFAULT NULL,
  `adresse_2` varchar(200) DEFAULT NULL,
  `batiment` varchar(15) DEFAULT NULL,
  `digicode` varchar(10) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `ville` varchar(200) DEFAULT NULL,
  `longitude` decimal(8,6) DEFAULT NULL,
  `latitude` decimal(7,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `utilisateur_id`, `adresse_1`, `adresse_2`, `batiment`, `digicode`, `code_postal`, `ville`, `longitude`, `latitude`) VALUES
(1, 10, '21 place vendôme', NULL, 'batC', '1987', '75001', 'PARIS', '48.868308', '2.329589'),
(2, 8, '3 Rue Turgot', NULL, NULL, NULL, '75009', 'PARIS', '48.879648', '2.345520'),
(3, 12, '9 Rue Augustin Thierry', 'Maison Huget', NULL, NULL, '75019', 'PARIS', '48.875925', '2.394143'),
(4, 11, '29 Rue Tchaïkovski', '18E-arrondissement', 'B07', NULL, '75018', 'PARIS', '48.895839', '2.365309'),
(5, 9, '1 Rue Ampère', NULL, 'C3', '#1879#', '75017', 'PARIS', '48.885148', '2.306992'),
(6, 6, '14 Rue Gustave Zédé', 'Maison Neuve', NULL, NULL, '75016', 'PARIS', '48.855584', '2.272230'),
(7, 10, '14 rue en froment', NULL, NULL, NULL, '75001', 'Paris', '48.152550', '2.125898');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'plats'),
(2, 'desserts');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `livreur_id` int(11) DEFAULT NULL,
  `ref_commande` varchar(16) DEFAULT NULL,
  `prix_total` varchar(10) DEFAULT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `statut_paiement` varchar(100) DEFAULT NULL,
  `statut_livraison` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `utilisateur_id`, `adresse_id`, `livreur_id`, `ref_commande`, `prix_total`, `date_paiement`, `statut_paiement`, `statut_livraison`) VALUES
(1, 10, 4, NULL, 'ref2017-01', '23.10', '2017-12-12 19:50:48', 'Terminé', 'Terminée'),
(2, 11, 5, NULL, 'ref2017-02', '38.00', '2017-12-12 20:52:49', 'Terminé', 'Terminée'),
(3, 9, 3, NULL, 'ref2017-03', '25.00', '2017-12-12 19:50:43', 'Terminé', 'Terminée'),
(4, 7, 1, 2, 'ref2017-04', '6.30', '2017-12-12 19:48:41', 'Terminé', 'En cours'),
(5, 8, 2, 4, 'ref2017-05', '48.50', '2017-12-13 20:43:42', 'Terminé', 'En cours'),
(6, 12, 6, 1, 'ref2017-06', '11.70', '2017-12-13 20:47:46', 'Terminé', 'En cours'),
(8, 5, 6, 2, 'ref2017-07', '52.50', '0000-00-00 00:00:00', 'Terminé', 'En cours');

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE `commande_produit` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `quantite` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande_produit`
--

INSERT INTO `commande_produit` (`id`, `produit_id`, `commande_id`, `quantite`) VALUES
(1, 7, 1, 2),
(2, 6, 1, 1),
(3, 8, 1, 1),
(4, 1, 2, 4),
(5, 3, 3, 2),
(6, 2, 3, 2),
(7, 6, 3, 2),
(8, 6, 4, 3),
(9, 8, 5, 10),
(10, 7, 5, 3),
(11, 2, 6, 1),
(12, 1, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `statut` varchar(45) DEFAULT NULL,
  `longitude` decimal(8,6) DEFAULT NULL,
  `latitude` decimal(7,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `utilisateur_id`, `statut`, `longitude`, `latitude`) VALUES
(1, 3, 'En livraison', '58.000000', '2.272230'),
(2, 4, 'En livraison', '48.868308', '2.329589'),
(3, 5, 'Libre', NULL, NULL),
(4, 6, 'En livraison', '48.879648', '2.345520'),
(5, 13, 'En congés ', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `produit_id`, `date`) VALUES
(1, 1, '2018-01-04'),
(2, 4, '2018-01-04'),
(3, 3, '2018-01-05'),
(4, 10, '2018-01-05'),
(5, 9, '2018-02-06'),
(6, 2, '2018-02-06');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `description` varchar(50) NOT NULL,
  `quantite` smallint(200) NOT NULL,
  `prix` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `categorie_id`, `nom`, `description`, `quantite`, `prix`) VALUES
(1, 1, 'Frites d\'avocats', 'Produit Français 100% Bio', 100, '9.50'),
(2, 2, 'Crème onctueuse aux spéculoos', 'Produit Français 100% Bio', 200, '2.20'),
(3, 1, 'Purée carotte et patate douce à l\'orange ', 'Produit Français 100% Bio', 200, '8.50'),
(4, 2, 'Smoothie fruits rouges', 'Produit Français 100% Bio', 300, '1.20'),
(5, 1, 'Velouté de chou fleur aux noix de cajou', 'Produit Français 100% Bio', 100, '9.50'),
(6, 2, 'Fondant chocolat crème de marron ', 'Produit Français 100% Bio', 500, '2.10'),
(7, 1, 'Salade crémeuse fenouil, céleri et algues', 'Produit Français 100% Bio', 100, '9.50'),
(8, 2, 'Muffins aux pommes et aux épices d\'automne', 'Produit Français 100% Bio', 200, '2.00'),
(9, 1, 'Wok de légumes de saison, carottes, pomme de terre et citrouille', 'Produit Français 100% Bio', 100, '9.50'),
(10, 2, 'Crème brulée au chocolat', 'Produit Français 100% Bio', 200, '2.00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  `date_ajout` datetime NOT NULL,
  `date_modification` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `role`, `nom`, `prenom`, `email`, `telephone`, `mot_de_passe`, `date_ajout`, `date_modification`) VALUES
(1, 'Admin', 'Scouarnec', 'Marion', 'mscouarnec@expressfood.com', '0630857428', 'marionmarion', '2017-12-12 12:23:16', '2017-12-12 22:46:53'),
(2, 'Service client', 'Eychenne', 'Florian', 'feychenne@expressfood.com', '0685470127', 'lamalice', '2017-12-12 12:33:40', '2017-12-15 09:43:54'),
(3, 'Livreur', 'Pelmont', 'Quentin', 'qpelmont@expressfood.com', '0658404827', 'francine4000', '2017-12-12 10:18:29', '2017-12-15 09:47:36'),
(4, 'Livreur', 'Socquet', 'Cédric', 'csocquet@expressfood.com', '0635840258', 'cedricsocquet73', '2017-12-12 13:37:34', '2017-12-15 09:47:36'),
(5, 'Livreur', 'Kupper', 'Matthias', 'mkupper@expressfood.com', '0648254488', 'kupkup123', '2017-12-12 11:27:21', '2017-12-15 09:47:36'),
(6, 'Livreur', 'Guillaumard', 'Antoine', 'aguillaumard@expressfood.com', '0654741525', 'guillaume', '2017-12-12 10:28:22', '2017-12-15 09:47:36'),
(7, 'Client', 'Berkouk', 'Mehdi', 'mberkouk@wecom.com', '0758987425', 'berkouk123', '2017-12-12 09:21:28', '2017-12-12 23:04:17'),
(8, 'Client', 'Cabanes', 'Rachel', 'rcabanes@gmail.com', '0745234225', 'rcb1238', '2017-12-12 10:25:12', '2017-12-12 23:04:23'),
(9, 'Client', 'Glories', 'Yann', 'yann@contact.com', '0745105744', 'yespapa666', '2017-12-12 15:32:40', '2017-12-12 23:04:28'),
(10, 'Client', 'Pastre', 'Romain', 'pastreromain@gmail.com', '0658742220', 'marseillelanuit', '2017-12-12 14:28:23', '2017-12-12 23:04:34'),
(11, 'Client', 'Segonne', 'Julie', 'juliesegonne@contact.com', '0745510011', 'hellocmoi', '2017-12-12 12:46:28', '2017-12-12 23:04:38'),
(12, 'Client', 'Vannereau', 'Gautier', 'gao@fise.com', '0745201122', 'chengdu40', '2017-12-12 20:34:27', '2017-12-12 23:05:55'),
(13, 'Livreur', 'Seguy de Raspide', 'Robin', 'rob@expressfood.com', '0631409478', 'robinch', '2017-12-28 13:31:31', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`) USING BTREE;

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`,`adresse_id`,`livreur_id`),
  ADD KEY `livreur_id` (`livreur_id`),
  ADD KEY `adresse_id` (`adresse_id`);

--
-- Index pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_id` (`produit_id`,`commande_id`),
  ADD KEY `commande_id` (`commande_id`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `adresse_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `commande_produit_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `commande_produit_ibfk_2` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `livreur_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
