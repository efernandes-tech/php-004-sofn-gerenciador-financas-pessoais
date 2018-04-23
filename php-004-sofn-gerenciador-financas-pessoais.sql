SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `bill_pays`;
CREATE TABLE IF NOT EXISTS `bill_pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_launch` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_cost_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_cost_id` (`category_cost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `bill_pays` (`id`, `date_launch`, `name`, `value`, `user_id`, `category_cost_id`, `created_at`, `updated_at`) VALUES
(1, '2018-04-05', 'aspernatur', 716.55, 4, 5, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(2, '2018-04-13', 'occaecati', 305.8, 4, 17, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(3, '2018-03-31', 'iure', 148.12, 3, 12, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(4, '2018-03-23', 'est', 830.92, 4, 5, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(5, '2018-03-19', 'nobis', 545.28, 2, 14, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(6, '2018-03-25', 'incidunt', 229.96, 4, 1, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(7, '2018-03-29', 'inventore', 258.68, 1, 11, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(8, '2018-04-09', 'officia', 288.14, 3, 10, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(9, '2018-04-12', 'voluptatem', 978.34, 2, 14, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(10, '2018-04-07', 'labore', 905.44, 3, 18, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(11, '2018-04-15', 'ut', 646.77, 4, 2, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(12, '2018-03-29', 'architecto', 83.66, 2, 20, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(13, '2018-03-29', 'laborum', 714.73, 1, 3, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(14, '2018-04-10', 'debitis', 386.86, 1, 11, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(15, '2018-04-06', 'sed', 479.96, 3, 15, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(16, '2018-04-09', 'consequatur', 522.06, 1, 11, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(17, '2018-04-03', 'nobis', 287.05, 1, 6, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(18, '2018-04-07', 'doloremque', 298.87, 4, 5, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(19, '2018-04-14', 'optio', 409.26, 3, 18, '2018-04-16 19:09:57', '2018-04-16 19:09:57'),
(20, '2018-04-16', 'est', 30.21, 4, 17, '2018-04-16 19:09:57', '2018-04-16 19:09:57');

DROP TABLE IF EXISTS `bill_receives`;
CREATE TABLE IF NOT EXISTS `bill_receives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_launch` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `bill_receives` (`id`, `date_launch`, `name`, `value`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2018-04-16', 'Bico', 994.52, 4, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(2, '2018-03-24', 'Bolsa de valores', 818.6, 3, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(3, '2018-03-30', 'Bico', 286.43, 2, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(4, '2018-04-14', 'Venda de produtos usados', 609.93, 3, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(5, '2018-04-03', 'Previdência Privada', 557.44, 2, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(6, '2018-03-18', 'CDI', 647.9, 2, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(7, '2018-04-01', 'Bico', 215.03, 3, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(8, '2018-04-06', 'Bico', 782.44, 3, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(9, '2018-03-21', 'Venda de produtos usados', 348.64, 1, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(10, '2018-04-06', 'CDI', 728.99, 2, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(11, '2018-03-23', 'Previdência Privada', 437.78, 4, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(12, '2018-03-22', 'Bico', 636.9, 1, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(13, '2018-04-13', 'Bolsa de valores', 262.16, 2, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(14, '2018-03-24', 'CDI', 829.63, 2, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(15, '2018-04-04', 'Salário', 444, 1, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(16, '2018-04-02', 'Venda de produtos usados', 546.98, 2, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(17, '2018-04-07', 'Venda de produtos usados', 589.19, 4, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(18, '2018-04-12', 'Restituição de Imposto de Renda', 101.21, 4, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(19, '2018-04-06', 'Restituição de Imposto de Renda', 15.67, 1, '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(20, '2018-03-23', 'Bico', 809.96, 3, '2018-04-16 19:09:56', '2018-04-16 19:09:56');

DROP TABLE IF EXISTS `category_costs`;
CREATE TABLE IF NOT EXISTS `category_costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `category_costs` (`id`, `name`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Escola', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 4),
(2, 'LUZ', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 4),
(3, 'Reparos', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 1),
(4, 'Telefone', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 4),
(5, 'Escola', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 4),
(6, 'Reparos', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 1),
(7, 'Água', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 4),
(8, 'Telefone', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 3),
(9, 'IPVA', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 2),
(10, 'Água', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 3),
(11, 'Água', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 1),
(12, 'Cartão', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 3),
(13, 'Telefone', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 2),
(14, 'Escola', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 2),
(15, 'Entretenimento', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 3),
(16, 'Gasolina', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 1),
(17, 'Telefone', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 4),
(18, 'Imposto de Renda', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 3),
(19, 'Reparos', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 2),
(20, 'Cartão', '2018-04-16 19:09:56', '2018-04-16 19:09:56', 2);

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `migrations` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20180311185134, 'CreateUsersTable', '2018-04-16 22:09:55', '2018-04-16 22:09:55', 0),
(20180316190603, 'CreateUserAdminData', '2018-04-16 22:09:55', '2018-04-16 22:09:55', 0),
(20180409180718, 'CreateCategoryCosts', '2018-04-16 22:09:55', '2018-04-16 22:09:55', 0),
(20180412182141, 'AddUserToCategoryCosts', '2018-04-16 22:09:55', '2018-04-16 22:09:56', 0),
(20180412185446, 'CreateBillReceivesTable', '2018-04-16 22:09:56', '2018-04-16 22:09:56', 0),
(20180413185631, 'CreateBillPaysTable', '2018-04-16 22:09:56', '2018-04-16 22:09:56', 0);

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'System', 'admin@user.com', '$2y$10$uWd5uL6PaN9ZE/y5YOOQYOIMvjXRCb.tvJBz83qjcMQ5Rag1ANh4y', '2018-04-16 19:09:55', '2018-04-16 19:09:55'),
(2, 'Nicole', 'Padilha', 'beatriz.mendonca@delgado.com', '$2y$10$WL6dQK5Ci1PdyYtoKfgdhuMNTmcqCDlxSqMFrgbXA/MzycdK6U7su', '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(3, 'Matias', 'Assunção', 'josue50@ferminiano.com', '$2y$10$Qtr8/Vr6JiUh21UDodveVu8HJ4BhDmdsMF78n/cKQ9IXb0W5/OXNC', '2018-04-16 19:09:56', '2018-04-16 19:09:56'),
(4, 'Daniel', 'Perez', 'ornela.ferminiano@terra.com.br', '$2y$10$.DAa9.voZ5Ohd1uEMo6vD.9QJOSHSh1gq15mFkMox.KPBXMaEVMd.', '2018-04-16 19:09:56', '2018-04-16 19:09:56');


ALTER TABLE `bill_pays`
  ADD CONSTRAINT `bill_pays_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bill_pays_ibfk_2` FOREIGN KEY (`category_cost_id`) REFERENCES `category_costs` (`id`);

ALTER TABLE `bill_receives`
  ADD CONSTRAINT `bill_receives_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `category_costs`
  ADD CONSTRAINT `category_costs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
