SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


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
(1, '2005-02-22', 'Previdência Privada', 679.63, 2, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(2, '1981-07-18', 'Salário', 516.41, 4, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(3, '1979-12-13', 'Previdência Privada', 413.84, 2, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(4, '2013-02-20', 'Tesouro direto', 570.94, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(5, '1998-06-20', 'CDI', 127.89, 2, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(6, '1970-03-29', 'Venda de produtos usados', 918.81, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(7, '2013-03-19', 'Salário', 368.34, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(8, '2001-03-01', 'Salário', 239.97, 4, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(9, '1998-07-08', 'Bolsa de valores', 471.74, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(10, '2007-05-02', 'Bolsa de valores', 316.96, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(11, '1998-10-18', 'Salário', 199.36, 4, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(12, '2004-09-15', 'Bolsa de valores', 197.8, 3, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(13, '2002-01-22', 'Bolsa de valores', 475.48, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(14, '2010-03-29', 'Previdência Privada', 160.4, 3, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(15, '2009-01-13', 'Tesouro direto', 978.43, 3, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(16, '2003-03-01', 'Previdência Privada', 957.97, 3, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(17, '1987-05-20', 'CDI', 376.64, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(18, '2006-12-29', 'CDI', 182.75, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(19, '1993-06-08', 'Salário', 144.93, 1, '2018-04-12 18:59:15', '2018-04-12 18:59:15'),
(20, '1993-06-25', 'Tesouro direto', 544.77, 3, '2018-04-12 18:59:15', '2018-04-12 18:59:15');

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
(1, 'Escola', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 2),
(2, 'Entretenimento', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 2),
(3, 'Vestuário', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 2),
(4, 'Vestuário', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 4),
(5, 'Água', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 1),
(6, 'Cartão', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 1),
(7, 'Cartão', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 3),
(8, 'Cartão', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 2),
(9, 'Vestuário', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 1),
(10, 'Água', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 3),
(11, 'Gasolina', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 1),
(12, 'Escola', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 3),
(13, 'Gasolina', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 2),
(14, 'Imposto de Renda', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 1),
(15, 'Vestuário', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 3),
(16, 'Imposto de Renda', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 3),
(17, 'Reparos', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 3),
(18, 'Imposto de Renda', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 1),
(19, 'Entretenimento', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 3),
(20, 'Reparos', '2018-04-12 18:59:14', '2018-04-12 18:59:14', 1);

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
(20180409180718, 'CreateCategoryCosts', '2018-04-12 21:59:14', '2018-04-12 21:59:14', 0),
(20180411185134, 'CreateUsersTable', '2018-04-12 21:59:14', '2018-04-12 21:59:14', 0),
(20180412182141, 'AddUserToCategoryCosts', '2018-04-12 21:59:14', '2018-04-12 21:59:14', 0),
(20180412185446, 'CreateBillReceivesTable', '2018-04-12 21:59:14', '2018-04-12 21:59:14', 0);

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
(1, 'Josefina', 'Feliciano', 'admin@user.com', '$2y$10$WazTITW1bWbNIUmzt0PaGePU8iIUg4UPifEGVdk9fC27zzRRjGJ7K', '2018-04-12 18:59:14', '2018-04-12 18:59:14'),
(2, 'Maximiano', 'Paes', 'christopher00@verdara.net.br', '$2y$10$x8DDrlgy2TRAoh/xIOlZtep4xprXuQsCg1VmK8ehiXNFnawJ1Tq0C', '2018-04-12 18:59:14', '2018-04-12 18:59:14'),
(3, 'Ketlin', 'Medina', 'jasmin.azevedo@yahoo.com', '$2y$10$MDIjQijkgo/SEtot7QaQ3uNGvXMLa0ChEUsfJwWr5lnQXVsEneYBW', '2018-04-12 18:59:14', '2018-04-12 18:59:14'),
(4, 'Vicente', 'Domingues', 'matias09@saraiva.com.br', '$2y$10$o3JHRJ6bF1Bnhmjn1cp9Fufvoj2Tv52cW2h7ruqcAlBfpFOpGGRWK', '2018-04-12 18:59:14', '2018-04-12 18:59:14');


ALTER TABLE `bill_receives`
  ADD CONSTRAINT `bill_receives_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `category_costs`
  ADD CONSTRAINT `category_costs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
