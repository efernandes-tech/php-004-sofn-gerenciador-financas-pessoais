SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `category_costs`;
CREATE TABLE IF NOT EXISTS `category_costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

INSERT INTO `category_costs` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Luara Helena Duarte', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(2, 'Emiliano Domingues Jr.', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(3, 'Dr. Thalissa Júlia Barreto', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(4, 'Dr. Joaquin Hernani Verdugo', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(5, 'Sr. Felipe Casanova Rico Jr.', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(6, 'Dr. Rafael Maldonado Bezerra Neto', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(7, 'Olívia Valéria Galindo Filho', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(8, 'Sra. Giovana Amanda Pacheco', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(9, 'Sr. Ziraldo Ivan de Oliveira', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(10, 'Dr. Constância Flores Saraiva Sobrinho', '2018-04-09 18:49:08', '2018-04-09 18:49:08'),
(19, 'Sr. Jerônimo Duarte Galvão Sobrinho', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(20, 'Srta. Adriana Reis Quintana', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(21, 'Dr. Sabrina Valência Jr.', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(22, 'Luis Salgado', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(23, 'Fernando Pacheco Ferraz', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(24, 'João Cortês Aragão', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(25, 'Srta. Malena Paulina Barreto Jr.', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(26, 'Pâmela Thalissa Padilha', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(27, 'Ricardo Lira Neto', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(28, 'Paulina Garcia Bonilha', '2018-04-11 18:56:42', '2018-04-11 18:56:42');

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
(20180409180718, 'CreateCategoryCosts', '2018-04-09 21:49:08', '2018-04-09 21:49:08', 0),
(20180411185134, 'CreateUsersTable', '2018-04-11 21:56:29', '2018-04-11 21:56:29', 0);

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
(1, 'Estêvão', 'Delvalle', 'admin@user.com', '123456', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(2, 'Sara', 'Pacheco', 'pamela90@ig.com.br', '123456', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(3, 'Elias', 'Marés', 'abgail39@meireles.com', '123456', '2018-04-11 18:56:42', '2018-04-11 18:56:42'),
(4, 'Thiago', 'Carmona', 'batista.sophie@terra.com.br', '123456', '2018-04-11 18:56:42', '2018-04-11 18:56:42');
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
