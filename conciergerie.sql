-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 25 jan. 2023 à 00:08
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `conciergerie`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `street_num` int DEFAULT NULL,
  `street_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_customer` int NOT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id_address`, `street_num`, `street_name`, `postal_code`, `city`, `id_customer`) VALUES
(1, 1, 'Rue de la Liberté', 59000, 'Lille', 1),
(2, 2, 'Avenue de la Victoire', 33000, 'Bordeaux', 1),
(3, 3, 'Boulevard de la Mer', 64200, 'Biarritz', 2),
(4, 4, 'Rue des Frères Lumière', 69100, 'Villeurbanne', 3),
(5, 5, 'Avenue des Alpes', 74000, 'Annecy', 4),
(6, 6, 'Rue de la Republique', 69001, 'Lyon', 5),
(7, 7, 'Avenue des Ternes', 75017, 'Paris', 4),
(8, 8, 'Boulevard de la Croisette', 62000, 'Cannes', 2),
(9, 9, 'Rue de la Huchette', 75005, 'Paris', 3),
(10, 10, 'Avenue des Gobelins', 75013, 'Paris', 1);

-- --------------------------------------------------------

--
-- Structure de la table `advantage`
--

DROP TABLE IF EXISTS `advantage`;
CREATE TABLE IF NOT EXISTS `advantage` (
  `id_advantage` int NOT NULL AUTO_INCREMENT,
  `advantage` varchar(50) NOT NULL,
  PRIMARY KEY (`id_advantage`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `advantage`
--

INSERT INTO `advantage` (`id_advantage`, `advantage`) VALUES
(1, 'Service de conciergerie gratuit'),
(2, 'Remise de 10% sur les achats'),
(3, 'Accès à des ventes exclusives'),
(4, 'Deux nuits gratuites dans un hôtel de la chaîne'),
(5, 'Vols gratuits'),
(6, 'Repas gratuits'),
(7, 'Transport gratuit');

-- --------------------------------------------------------

--
-- Structure de la table `allow`
--

DROP TABLE IF EXISTS `allow`;
CREATE TABLE IF NOT EXISTS `allow` (
  `id_level` int NOT NULL,
  `id_advantage` int NOT NULL,
  PRIMARY KEY (`id_level`,`id_advantage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `allow`
--

INSERT INTO `allow` (`id_level`, `id_advantage`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7);

-- --------------------------------------------------------

--
-- Structure de la table `client_order`
--

DROP TABLE IF EXISTS `client_order`;
CREATE TABLE IF NOT EXISTS `client_order` (
  `id_order` varchar(15) NOT NULL,
  `date_order` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `id_delivery` int NOT NULL,
  `id_customer` int NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client_order`
--

INSERT INTO `client_order` (`id_order`, `date_order`, `status`, `price`, `id_delivery`, `id_customer`) VALUES
('ORDER1', '2022-01-15', 'Completed', 35, 1, 1),
('ORDER2', '2022-02-01', 'Processing', 200, 2, 2),
('ORDER3', '2022-03-01', 'Cancelled', 150, 3, 3),
('ORDER4', '2022-04-01', 'Completed', 250, 4, 4),
('ORDER5', '2022-05-01', 'Shipped', 300, 5, 5),
('ORDER6', '2022-06-01', 'Completed', 200, 1, 1),
('ORDER7', '2022-07-01', 'Processing', 150, 2, 2),
('ORDER8', '2022-08-01', 'Cancelled', 100, 3, 3),
('ORDER9', '2022-09-01', 'Completed', 300, 4, 4),
('ORDER10', '2022-10-01', 'Shipped', 200, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `sex` enum('Mr.','Mme.') DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `facebook` varchar(150) NOT NULL,
  `instagram` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `id_loyal` int NOT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id_customer`, `name`, `firstname`, `sex`, `phone`, `facebook`, `instagram`, `email`, `id_loyal`) VALUES
(1, 'Smith', 'John', 'Mr.', ' 3361234567', 'john', 'johnsmith', 'johnsmith@example.com', 1),
(2, 'Johnson', 'Jane', 'Mme.', '+3362345678', 'janejohnson', 'janejohnson', 'janejohnson@example.com', 2),
(3, 'Williams', 'Bob', 'Mr.', '+336347890', 'bobwilliams', 'bobwilliams', 'bobwilliams@example.com', 3),
(4, 'Jones', 'Emily', 'Mme.', '+3364567890', 'emilyjones', 'emilyjones', 'emilyjones@example.com', 4),
(5, 'Brown', 'Michael', 'Mr.', '+336578901', 'michaelbrown', 'michaelbrown', 'michaelbrown@example.com', 5),
(6, 'may', 'madeth', 'Mr.', '333', 'mm', 'mm', 'mm', 6);

-- --------------------------------------------------------

--
-- Structure de la table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `id_delivery` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `dispatch_date` date NOT NULL,
  `reception_date` date NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `id_address` int NOT NULL,
  PRIMARY KEY (`id_delivery`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `delivery`
--

INSERT INTO `delivery` (`id_delivery`, `price`, `dispatch_date`, `reception_date`, `note`, `id_address`) VALUES
(1, 10, '2022-01-15', '2022-01-20', 'Delivered on time', 1),
(2, 20, '2022-02-01', '2022-02-05', 'Customer not home', 2),
(3, 15, '2022-03-01', '2022-03-02', 'Weather delay', 3),
(4, 25, '2022-04-01', '2022-04-03', NULL, 4),
(5, 30, '2022-05-01', '2022-05-07', 'Lost package', 5),
(6, 20, '2022-06-01', '2022-06-03', 'Customer not satisfied', 1),
(7, 15, '2022-07-01', '2022-07-02', 'Delivered on time', 2),
(8, 10, '2022-08-01', '2022-08-03', 'Weather delay', 3),
(9, 25, '2022-09-01', '2022-09-04', NULL, 4),
(10, 30, '2022-10-01', '2022-10-05', 'Lost package', 5);

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `earned` int DEFAULT NULL,
  `spend` int DEFAULT NULL,
  `h_date` date DEFAULT NULL,
  `id_rule_used` int DEFAULT NULL,
  `id_point_changed` int NOT NULL,
  `id_related_order` int DEFAULT NULL,
  PRIMARY KEY (`id_history`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inorder`
--

DROP TABLE IF EXISTS `inorder`;
CREATE TABLE IF NOT EXISTS `inorder` (
  `id_order` varchar(15) NOT NULL,
  `item_amount` int NOT NULL,
  `id_item` int NOT NULL,
  `id_status` int NOT NULL,
  PRIMARY KEY (`id_order`,`id_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `inorder`
--

INSERT INTO `inorder` (`id_order`, `item_amount`, `id_item`, `id_status`) VALUES
('ORDER1', 2, 1, 1),
('ORDER1', 1, 2, 1),
('ORDER2', 3, 3, 2),
('ORDER3', 1, 4, 3),
('ORDER4', 2, 5, 1),
('ORDER5', 3, 1, 2),
('ORDER6', 1, 2, 3),
('ORDER7', 2, 3, 1),
('ORDER8', 1, 4, 2),
('ORDER9', 3, 5, 3),
('ORDER10', 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `date_invoice` date NOT NULL,
  `date_update` date NOT NULL,
  `charge` int DEFAULT NULL,
  `price` int NOT NULL,
  `id_payement` int DEFAULT NULL,
  `id_order` int NOT NULL,
  PRIMARY KEY (`id_invoice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id_item`, `item_name`, `price`, `stock`) VALUES
(1, 'item1', 10, 20),
(2, 'item2', 15, 15),
(3, 'item3', 20, 10),
(4, 'item4', 25, 5),
(5, 'item5', 30, 2);

-- --------------------------------------------------------

--
-- Structure de la table `level`
--

DROP TABLE IF EXISTS `level`;
CREATE TABLE IF NOT EXISTS `level` (
  `id_level` int NOT NULL AUTO_INCREMENT,
  `min_point` int DEFAULT NULL,
  `max_point` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `level`
--

INSERT INTO `level` (`id_level`, `min_point`, `max_point`, `name`) VALUES
(1, 0, 999, 'Silver'),
(2, 1000, 4999, 'Gold'),
(3, 5000, 9999, 'Platinum'),
(4, 10000, 19999, 'Premium'),
(5, 20000, NULL, 'Elite');

-- --------------------------------------------------------

--
-- Structure de la table `loyalty`
--

DROP TABLE IF EXISTS `loyalty`;
CREATE TABLE IF NOT EXISTS `loyalty` (
  `id_loyalty` int NOT NULL AUTO_INCREMENT,
  `description` varchar(250) DEFAULT NULL,
  `id_level` int NOT NULL,
  PRIMARY KEY (`id_loyalty`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `loyalty`
--

INSERT INTO `loyalty` (`id_loyalty`, `description`, `id_level`) VALUES
(1, 'Programme de fidélité Silver : Réduction de 5% sur tous les achats', 1),
(2, 'Programme de fidélité Gold : Réduction de 10% sur tous les achats et une nuit gratuite dans un hôtel de la chaîne', 2),
(3, 'Programme de fidélité Platinum : Réduction de 15% sur tous les achats, une nuit gratuite dans un hôtel de la chaîne et des vols gratuits', 3),
(4, 'Programme de fidélité Premium : Réduction de 20% sur tous les achats, une nuit gratuite dans un hôtel de la chaîne, des vols gratuits et des repas gratuits', 4),
(5, 'Programme de fidélité Elite : Réduction de 25% sur tous les achats, une nuit gratuite dans un hôtel de la chaîne, des vols gratuits, des repas gratuits et un concierge personnel', 5),
(6, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `payement`
--

DROP TABLE IF EXISTS `payement`;
CREATE TABLE IF NOT EXISTS `payement` (
  `id_payement` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `payement_date` date NOT NULL,
  `id_mode` int NOT NULL,
  PRIMARY KEY (`id_payement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payement_card`
--

DROP TABLE IF EXISTS `payement_card`;
CREATE TABLE IF NOT EXISTS `payement_card` (
  `id_card` int NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `ccv` int NOT NULL,
  `expire_date` date NOT NULL,
  `id_customer` int NOT NULL,
  `id_payement_mode` int NOT NULL,
  PRIMARY KEY (`id_card`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payement_mode`
--

DROP TABLE IF EXISTS `payement_mode`;
CREATE TABLE IF NOT EXISTS `payement_mode` (
  `id_mode` int NOT NULL AUTO_INCREMENT,
  `mode` varchar(20) NOT NULL,
  PRIMARY KEY (`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payement_paypal`
--

DROP TABLE IF EXISTS `payement_paypal`;
CREATE TABLE IF NOT EXISTS `payement_paypal` (
  `id_paypal` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `account` varchar(25) NOT NULL,
  `id_mode` int NOT NULL,
  PRIMARY KEY (`id_paypal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `points`
--

DROP TABLE IF EXISTS `points`;
CREATE TABLE IF NOT EXISTS `points` (
  `id_points` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `expire_date` date DEFAULT NULL,
  `id_loyal` int NOT NULL,
  PRIMARY KEY (`id_points`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `points`
--

INSERT INTO `points` (`id_points`, `amount`, `expire_date`, `id_loyal`) VALUES
(1, 100, '2022-05-01', 1),
(2, 200, '2022-10-01', 2),
(3, 300, '2022-12-31', 3),
(4, 400, '2023-03-01', 4),
(5, 500, '2023-06-01', 5),
(6, 600, NULL, 1),
(7, 700, NULL, 2),
(8, 800, NULL, 3),
(9, 900, NULL, 4),
(10, 1000, NULL, 5);

-- --------------------------------------------------------

--
-- Structure de la table `promoted`
--

DROP TABLE IF EXISTS `promoted`;
CREATE TABLE IF NOT EXISTS `promoted` (
  `id_promotion` int NOT NULL,
  `id_item` int NOT NULL,
  PRIMARY KEY (`id_promotion`,`id_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promotion` int NOT NULL AUTO_INCREMENT,
  `condition_p` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fix_discount` int DEFAULT NULL,
  `percent_discount` int DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  PRIMARY KEY (`id_promotion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rules`
--

DROP TABLE IF EXISTS `rules`;
CREATE TABLE IF NOT EXISTS `rules` (
  `id_Rules` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nb_point` int DEFAULT NULL,
  `condition_R` varchar(250) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  PRIMARY KEY (`id_Rules`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id_status`, `state`) VALUES
(1, 'In Stock'),
(2, 'Out of Stock'),
(3, 'Backordered'),
(4, 'Discontinued');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
