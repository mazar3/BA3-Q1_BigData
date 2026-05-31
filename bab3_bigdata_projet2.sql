-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 jan. 2025 à 22:38
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bab3_bigdata_projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `idAdresse` int NOT NULL AUTO_INCREMENT,
  `Rue` varchar(20) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Boite` varchar(10) DEFAULT NULL,
  `CodePostal` int DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `Pays` varchar(50) DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL,
  PRIMARY KEY (`idAdresse`),
  KEY `lien_utilisateur_adresse` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clause`
--

DROP TABLE IF EXISTS `clause`;
CREATE TABLE IF NOT EXISTS `clause` (
  `idClause` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`idClause`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int NOT NULL AUTO_INCREMENT,
  `Date_Commande` date DEFAULT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL,
  `idFacture` int DEFAULT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `lien_commande_facture` (`idFacture`),
  KEY `lien_commande_utilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
CREATE TABLE IF NOT EXISTS `commande_produit` (
  `idCommande` int NOT NULL,
  `idProduit` int NOT NULL,
  `Quantite` int DEFAULT NULL,
  PRIMARY KEY (`idCommande`,`idProduit`),
  KEY `lien_commandeproduit_produit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `idCommentaire` int NOT NULL AUTO_INCREMENT,
  `idProjet` int NOT NULL,
  `idUtilisateur` int NOT NULL,
  `Commentaire` text NOT NULL,
  `Date_Commentaire` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCommentaire`),
  KEY `fk_commentaires_projet` (`idProjet`),
  KEY `fk_commentaires_utilisateur` (`idUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`idCommentaire`, `idProjet`, `idUtilisateur`, `Commentaire`, `Date_Commentaire`) VALUES
(1, 1, 3, 'Test', '2024-12-07 14:33:37'),
(2, 3, 3, 'bkabkabka', '2024-12-13 16:18:14'),
(3, 3, 3, 'bkabkabka', '2024-12-13 16:20:06'),
(4, 4, 3, 'jizdjiqzjdiqzjidjizq', '2025-01-08 15:16:18');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `idContrat` int NOT NULL AUTO_INCREMENT,
  `Date_Signature` date DEFAULT NULL,
  `Date_Fin` date DEFAULT NULL,
  `idClause` int DEFAULT NULL,
  PRIMARY KEY (`idContrat`),
  KEY `lien_contrat_clause` (`idClause`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `idFacture` int NOT NULL AUTO_INCREMENT,
  `Date_Facture` date DEFAULT NULL,
  `Montant` float NOT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  `idCommande` int DEFAULT NULL,
  PRIMARY KEY (`idFacture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `idFournisseur` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Adresse` varchar(150) DEFAULT NULL,
  `Telephone` varchar(15) NOT NULL,
  `Email` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idFournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`idFournisseur`, `Nom`, `Adresse`, `Telephone`, `Email`) VALUES
(1, 'TechPlanet', '45 Boulevard Tech, 1000 Bruxelles', '0987654321', 'sales@techplanet.com'),
(2, 'GlobalSoft', '200 Avenue Logiciel, 1200 Bruxelles', '0246801357', 'info@globalsoft.org'),
(3, 'MatLog SA', '10 Rue du Matériel, 4000 Liège', '0471234567', 'vente@matlog.be'),
(4, 'Meubles SPRL', '29 Rue du Bureau, 7000 Mons', '0478196737', 'support@meubles.be');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `idPanier` int NOT NULL AUTO_INCREMENT,
  `Date_Panier` date DEFAULT NULL,
  `Montant` float DEFAULT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPanier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`idPanier`, `Date_Panier`, `Montant`, `Statut`) VALUES
(1, '2024-12-07', 0, 'Devis Envoyé'),
(2, '2024-12-13', 0, 'Devis Envoyé'),
(3, '2024-12-13', 0, 'Devis Envoyé'),
(4, '2025-01-08', 0, 'Devis Envoyé');

-- --------------------------------------------------------

--
-- Structure de la table `panier_produit`
--

DROP TABLE IF EXISTS `panier_produit`;
CREATE TABLE IF NOT EXISTS `panier_produit` (
  `idPanier` int NOT NULL,
  `idProduit` int NOT NULL,
  `Quantite` int NOT NULL,
  PRIMARY KEY (`idPanier`,`idProduit`),
  KEY `fk_paniers_produit_produit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `panier_produit`
--

INSERT INTO `panier_produit` (`idPanier`, `idProduit`, `Quantite`) VALUES
(1, 4, 6),
(1, 13, 5);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Prix` int DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `idTypeProduit` int DEFAULT NULL,
  `idFournisseur` int DEFAULT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `lien_produit_typeproduit` (`idTypeProduit`),
  KEY `lien_produit_fournisseur` (`idFournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `Nom`, `Description`, `Prix`, `Stock`, `idTypeProduit`, `idFournisseur`) VALUES
(4, 'PC Portable', 'PC portable pour taches communes', 700, 64, 1, 1),
(5, 'PC Portable Pro', 'PC portable haute performance', 1200, 50, 1, 1),
(6, 'Windows Server Licence', 'Licence Windows Server 2022', 800, 30, 2, 2),
(7, 'Pack Bureautique', 'Suite complète de bureautique', 200, 100, 2, 3),
(8, 'Souris Gaming', 'Souris optique haute précision', 40, 75, 4, 3),
(9, 'Switch Réseau 24 ports', 'Switch Gigabit 24 ports', 150, 20, 5, 3),
(10, 'PC Bureau Standard', 'Ordinateur fixe entrée de gamme', 500, 60, 1, 4),
(11, 'Clavier Mécanique', 'Clavier mécanique haute durabilité', 70, 45, 4, 3),
(12, 'Logiciel CRM', 'CRM pour gestion de clients', 300, 25, 2, 2),
(13, 'Casque Audio', 'Casque pour visioconférence', 25, 75, 4, 1),
(14, 'Routeur Wi-Fi Pro', 'Routeur Dual-Band haute performance', 120, 15, 5, 3),
(15, 'Bureau', 'Bureau en bois massif pour ordinateur fixe', 700, 20, 3, 4),
(16, 'Chaise bureau', 'Chaise ergonomique pour bureau', 300, 50, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `idProjet` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Date_Debut` date DEFAULT NULL,
  `Date_Fin` date DEFAULT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  `idUtilisateur` int DEFAULT NULL,
  `idPanier` int DEFAULT NULL,
  `idContrat` int DEFAULT NULL,
  `Description` mediumtext NOT NULL,
  PRIMARY KEY (`idProjet`),
  KEY `lien_utilisateur_projet` (`idUtilisateur`),
  KEY `lien_projet_contrat` (`idContrat`),
  KEY `lien_projet_panier` (`idPanier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`idProjet`, `Nom`, `Date_Debut`, `Date_Fin`, `Statut`, `idUtilisateur`, `idPanier`, `idContrat`, `Description`) VALUES
(1, 'Upgrade de l\'IGLab', '2024-12-07', NULL, 'Terminé', 3, 1, NULL, 'Madame, Monsieur,\r\n\r\nJe me permets de vous contacter au nom de l\'UMONS concernant notre salle informatique, le \"IGLab\". Nous souhaitons améliorer cette salle afin d’optimiser son fonctionnement et de proposer un environnement plus moderne et performant à nos utilisateurs.\r\n\r\nNous serions intéressés par une offre complète incluant, mais sans s\'y limiter :\r\n\r\nLa mise à jour du matériel informatique (ordinateurs, serveurs, périphériques).\r\nL\'amélioration des infrastructures réseau (switchs, câblage, sécurité).\r\nL\'intégration de solutions logicielles adaptées à nos besoins.\r\nUn éventuel accompagnement pour la formation des utilisateurs et la gestion technique de l\'espace.\r\nAfin de nous aider à définir précisément notre projet, nous serions ravis de recevoir une proposition détaillée, incluant vos conseils techniques, les équipements que vous recommandez, ainsi qu\'une estimation des coûts associés.\r\n\r\nRestant à votre disposition pour toute information complémentaire ou pour organiser une visite de la salle, je vous remercie par avance de votre attention et de votre réactivité.\r\n\r\nDans l’attente de votre retour, je vous prie d\'agréer, Madame, Monsieur, l\'expression de mes salutations distinguées.'),
(2, 'Réchauffer', '2024-12-13', NULL, 'Terminé', 3, 2, NULL, 'jj'),
(3, 'Test projet', '2024-12-13', NULL, 'Terminé', 3, 3, NULL, 'Test description'),
(4, 'Upgrade de l\'IGLAb 2', '2025-01-08', NULL, 'Devis Envoyé', 3, 4, NULL, 'dzqjdohuqziphdpqizd hiip');

-- --------------------------------------------------------

--
-- Structure de la table `projet_manager`
--

DROP TABLE IF EXISTS `projet_manager`;
CREATE TABLE IF NOT EXISTS `projet_manager` (
  `idProjet` int NOT NULL,
  `idUtilisateur` int NOT NULL,
  PRIMARY KEY (`idProjet`,`idUtilisateur`),
  KEY `fk_projet_manager_utilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projet_manager`
--

INSERT INTO `projet_manager` (`idProjet`, `idUtilisateur`) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `idRole` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`idRole`, `Description`) VALUES
(1, 'Administrateur'),
(2, 'Responsable de projet'),
(3, 'Client');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `idService` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Tarif_Horaire` float DEFAULT NULL,
  `idTypeService` int DEFAULT NULL,
  `idProjet` int DEFAULT NULL,
  PRIMARY KEY (`idService`),
  KEY `lien_service_typeservice` (`idTypeService`),
  KEY `lien_service_projet` (`idProjet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typeservice`
--

DROP TABLE IF EXISTS `typeservice`;
CREATE TABLE IF NOT EXISTS `typeservice` (
  `idTypeService` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTypeService`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_produit`
--

DROP TABLE IF EXISTS `type_produit`;
CREATE TABLE IF NOT EXISTS `type_produit` (
  `idTypeProduit` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTypeProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type_produit`
--

INSERT INTO `type_produit` (`idTypeProduit`, `Nom`) VALUES
(1, 'Informatique'),
(2, 'Logiciels'),
(3, 'Bureautique'),
(4, 'Accessoires'),
(5, 'Réseaux');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Telephone` varchar(15) NOT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `Mot_De_Passe_Hash` varchar(250) DEFAULT NULL,
  `idAdresse` int DEFAULT NULL,
  `idRole` int DEFAULT NULL,
  `idProjet` int DEFAULT NULL,
  `idCommande` int DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`),
  UNIQUE KEY `unique_email` (`Email`),
  KEY `lien_utilisateur_role` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `Nom`, `Prenom`, `Telephone`, `Email`, `Mot_De_Passe_Hash`, `idAdresse`, `idRole`, `idProjet`, `idCommande`) VALUES
(1, 'ADMIN', 'Admin', '048999999', 'admin@admin.com', '$2y$10$yYMdsOQAGeRcu5HHnO1EZeVo8btimwVFel3vmrtCofyqNvrsmO8Gy', NULL, 1, NULL, NULL),
(3, 'CLIENTTEST', 'Clienttest', '04488988989', 'client@client.com', '$2y$10$8ccrDIdSb0yMhQsf680gEeQcAZkN0A83u1L/.sucUAuq/c/CfNc1K', NULL, 3, NULL, NULL),
(5, 'MANAGERTEST', 'Managertest', '12515415151', 'mng@mng.com', '$2y$10$hxD0/gEaqWZNJPOTIk1Uj.5.dqgc0pgwAxXJmRcil9FMpzdOk/cUi', NULL, 2, NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `lien_utilisateur_adresse` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `lien_commande_facture` FOREIGN KEY (`idFacture`) REFERENCES `facture` (`idFacture`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lien_commande_utilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `lien_commandeproduit_commande` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lien_commandeproduit_produit` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `fk_commentaires_projet` FOREIGN KEY (`idProjet`) REFERENCES `projet` (`idProjet`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_commentaires_utilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE CASCADE;

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `lien_contrat_clause` FOREIGN KEY (`idClause`) REFERENCES `clause` (`idClause`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  ADD CONSTRAINT `fk_paniers_produit` FOREIGN KEY (`idPanier`) REFERENCES `panier` (`idPanier`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_paniers_produit_produit` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `lien_produit_fournisseur` FOREIGN KEY (`idFournisseur`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lien_produit_typeproduit` FOREIGN KEY (`idTypeProduit`) REFERENCES `type_produit` (`idTypeProduit`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `lien_projet_contrat` FOREIGN KEY (`idContrat`) REFERENCES `contrat` (`idContrat`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lien_projet_panier` FOREIGN KEY (`idPanier`) REFERENCES `panier` (`idPanier`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lien_utilisateur_projet` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet_manager`
--
ALTER TABLE `projet_manager`
  ADD CONSTRAINT `fk_projet_manager_projet` FOREIGN KEY (`idProjet`) REFERENCES `projet` (`idProjet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_projet_manager_utilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `lien_service_projet` FOREIGN KEY (`idProjet`) REFERENCES `projet` (`idProjet`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lien_service_typeservice` FOREIGN KEY (`idTypeService`) REFERENCES `typeservice` (`idTypeService`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `lien_utilisateur_role` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
