-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para cervecero
CREATE DATABASE IF NOT EXISTS `cervecero` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `cervecero`;

-- Volcando estructura para tabla cervecero.estados
CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cervecero.estados: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
REPLACE INTO `estados` (`id`, `estado`) VALUES
	(1, 'Iniciado'),
	(2, 'Finalizado'),
	(3, 'Fallo');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.firmwares
CREATE TABLE IF NOT EXISTS `firmwares` (
  `version` varchar(10) NOT NULL,
  `fechaSalida` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.firmwares: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `firmwares` DISABLE KEYS */;
REPLACE INTO `firmwares` (`version`, `fechaSalida`) VALUES
	('1.0.0', '2020-03-28 17:44:39'),
	('1.0.1', '2020-03-28 17:44:44'),
	('1.0.2', '2020-03-28 23:51:53'),
	('1.0.3', '2020-03-29 14:50:19'),
	('1.0.4', '2020-03-29 15:26:33');
/*!40000 ALTER TABLE `firmwares` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.info
CREATE TABLE IF NOT EXISTS `info` (
  `IDplaca` int(11) NOT NULL AUTO_INCREMENT,
  `receta` int(11) DEFAULT NULL,
  `proceso` int(11) DEFAULT NULL,
  `pasoProceso` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `tiempoRestante` int(11) DEFAULT NULL,
  `porcentaje` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IDplaca`),
  KEY `FK_info_recetas` (`receta`),
  KEY `FK_info_procesos` (`proceso`),
  KEY `FK_info_estados` (`estado`),
  CONSTRAINT `FK_info_estados` FOREIGN KEY (`estado`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_info_placas` FOREIGN KEY (`IDplaca`) REFERENCES `placas` (`IDplaca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_info_procesos` FOREIGN KEY (`proceso`) REFERENCES `procesos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_info_recetas` FOREIGN KEY (`receta`) REFERENCES `recetas` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.info: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
REPLACE INTO `info` (`IDplaca`, `receta`, `proceso`, `pasoProceso`, `estado`, `tiempoRestante`, `porcentaje`) VALUES
	(1, 1, 1, 1, 2, 0, 100);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.log
CREATE TABLE IF NOT EXISTS `log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDplaca` int(11) DEFAULT NULL,
  `receta` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proceso` int(11) DEFAULT NULL,
  `pasoProceso` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `tiempoRestante` int(11) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `estado` (`estado`),
  KEY `proceso` (`proceso`),
  KEY `placaID` (`IDplaca`) USING BTREE,
  KEY `FK_log_recetas` (`receta`),
  CONSTRAINT `FK_log_estados` FOREIGN KEY (`estado`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_log_placas` FOREIGN KEY (`IDplaca`) REFERENCES `placas` (`IDplaca`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_log_procesos` FOREIGN KEY (`proceso`) REFERENCES `procesos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_log_recetas` FOREIGN KEY (`receta`) REFERENCES `recetas` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.log: ~317 rows (aproximadamente)
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
REPLACE INTO `log` (`ID`, `IDplaca`, `receta`, `time`, `proceso`, `pasoProceso`, `estado`, `tiempoRestante`, `porcentaje`) VALUES
	(6, 1, NULL, '2020-03-20 19:53:53', 1, NULL, 1, NULL, NULL),
	(7, 1, NULL, '2020-03-20 21:13:26', 1, NULL, 1, NULL, NULL),
	(8, 1, NULL, '2020-03-20 21:14:23', 1, NULL, 3, NULL, NULL),
	(9, 1, NULL, '2020-03-21 16:11:11', 1, NULL, 1, NULL, NULL),
	(10, 1, NULL, '2020-03-21 16:11:12', 1, NULL, 2, NULL, NULL),
	(11, 1, NULL, '2020-03-21 16:12:41', 1, NULL, 1, NULL, NULL),
	(12, 1, NULL, '2020-03-21 16:13:48', 1, NULL, 2, NULL, NULL),
	(13, 1, NULL, '2020-03-21 17:51:33', 1, NULL, 1, NULL, NULL),
	(14, 1, NULL, '2020-03-21 17:52:33', 1, NULL, 2, NULL, NULL),
	(15, 1, NULL, '2020-03-21 17:56:53', 1, NULL, 1, NULL, NULL),
	(16, 1, NULL, '2020-03-21 17:57:56', 1, NULL, 2, NULL, NULL),
	(17, 1, NULL, '2020-03-21 21:23:16', 1, NULL, 1, NULL, NULL),
	(18, 1, NULL, '2020-03-21 21:24:19', 1, NULL, 2, NULL, NULL),
	(19, 1, NULL, '2020-03-21 21:24:38', 1, NULL, 1, NULL, NULL),
	(20, 1, NULL, '2020-03-21 21:25:42', 1, NULL, 2, NULL, NULL),
	(21, 1, NULL, '2020-03-21 21:25:52', 1, NULL, 1, NULL, NULL),
	(22, 1, NULL, '2020-03-21 21:26:00', 1, NULL, 3, NULL, NULL),
	(23, 1, NULL, '2020-03-21 21:27:50', 1, NULL, 1, NULL, NULL),
	(24, 1, NULL, '2020-03-21 21:27:58', 1, NULL, 3, NULL, NULL),
	(25, 1, NULL, '2020-03-21 22:25:08', 1, NULL, 1, NULL, NULL),
	(26, 1, NULL, '2020-03-21 22:25:26', 1, NULL, 3, NULL, NULL),
	(27, 1, NULL, '2020-03-21 22:32:10', 4, NULL, 1, NULL, NULL),
	(28, 1, NULL, '2020-03-21 22:33:27', 4, NULL, 3, NULL, NULL),
	(29, 1, NULL, '2020-03-21 22:33:43', 4, NULL, 1, NULL, NULL),
	(30, 1, NULL, '2020-03-21 22:34:50', 4, NULL, 3, NULL, NULL),
	(31, 1, NULL, '2020-03-21 22:35:05', 4, NULL, 1, NULL, NULL),
	(32, 1, NULL, '2020-03-21 22:39:31', 4, NULL, 1, NULL, NULL),
	(33, 1, NULL, '2020-03-21 22:39:42', 4, NULL, 3, NULL, NULL),
	(34, 1, NULL, '2020-03-21 22:52:58', 4, NULL, 1, NULL, NULL),
	(35, 1, NULL, '2020-03-21 22:56:50', 4, NULL, 3, NULL, NULL),
	(36, 1, NULL, '2020-03-21 23:06:50', 4, NULL, 1, NULL, NULL),
	(37, 1, NULL, '2020-03-21 23:07:23', 4, NULL, 3, NULL, NULL),
	(38, 1, NULL, '2020-03-21 23:13:32', 4, NULL, 1, NULL, NULL),
	(39, 1, NULL, '2020-03-21 23:17:41', 4, NULL, 1, NULL, NULL),
	(40, 1, NULL, '2020-03-21 23:24:26', 4, NULL, 1, NULL, NULL),
	(41, 1, NULL, '2020-03-21 23:28:10', 4, NULL, 1, NULL, NULL),
	(42, 1, NULL, '2020-03-22 00:44:12', 1, NULL, 1, NULL, NULL),
	(43, 1, NULL, '2020-03-22 00:47:08', 1, NULL, 1, NULL, NULL),
	(44, 1, NULL, '2020-03-22 00:48:03', 1, NULL, 1, NULL, NULL),
	(45, 1, NULL, '2020-03-22 00:49:31', 1, NULL, 1, NULL, NULL),
	(46, 1, NULL, '2020-03-22 00:51:04', 1, NULL, 1, NULL, NULL),
	(47, 1, NULL, '2020-03-22 00:52:42', 1, NULL, 1, NULL, NULL),
	(48, 1, NULL, '2020-03-22 00:59:19', 1, NULL, 1, NULL, NULL),
	(49, 1, NULL, '2020-03-22 00:59:56', 1, NULL, 3, NULL, NULL),
	(50, 1, NULL, '2020-03-22 01:01:34', 1, NULL, 1, NULL, NULL),
	(51, 1, NULL, '2020-03-22 01:08:12', 1, NULL, 1, NULL, NULL),
	(52, 1, NULL, '2020-03-22 01:12:27', 1, NULL, 1, NULL, NULL),
	(53, 1, NULL, '2020-03-22 01:13:30', 1, NULL, 2, NULL, NULL),
	(54, 1, NULL, '2020-03-22 01:16:18', 1, NULL, 1, NULL, NULL),
	(55, 1, NULL, '2020-03-22 01:17:22', 1, NULL, 2, NULL, NULL),
	(56, 1, NULL, '2020-03-22 01:17:48', 1, NULL, 1, NULL, NULL),
	(57, 1, NULL, '2020-03-22 01:17:52', 1, NULL, 2, NULL, NULL),
	(58, 1, NULL, '2020-03-22 01:18:23', 1, NULL, 1, NULL, NULL),
	(59, 1, NULL, '2020-03-22 01:20:18', 1, NULL, 1, NULL, NULL),
	(60, 1, NULL, '2020-03-22 01:20:25', 1, NULL, 2, NULL, NULL),
	(61, 1, NULL, '2020-03-22 01:21:26', 1, NULL, 2, NULL, NULL),
	(64, 1, NULL, '2020-03-22 14:21:00', 1, 1, 1, NULL, NULL),
	(65, 1, NULL, '2020-03-22 14:26:04', 1, 1, 2, NULL, NULL),
	(66, 1, NULL, '2020-03-22 20:16:26', 1, 1, 1, NULL, 0),
	(67, 1, NULL, '2020-03-22 20:20:20', 1, 1, 1, NULL, 0),
	(68, 1, NULL, '2020-03-23 02:08:14', 1, 1, 1, NULL, 0),
	(69, 1, NULL, '2020-03-23 02:09:06', 1, 1, 1, 100, 0),
	(70, 1, 1, '2020-03-23 02:27:46', 1, 1, 1, 120, 0),
	(71, 1, 1, '2020-03-23 13:31:05', 1, 1, 2, 120, 96),
	(72, 1, 1, '2020-03-23 13:38:32', 1, 1, 1, 120, 96),
	(73, 1, 1, '2020-03-23 19:32:02', 1, 1, 1, 30, 96),
	(74, 1, 1, '2020-03-24 20:25:44', 1, 1, 1, 30, 50),
	(79, 1, 1, '2020-03-24 21:21:25', 1, 1, 2, 0, 100),
	(80, 1, 1, '2020-03-26 19:32:49', 1, 1, 1, 0, 0),
	(81, 1, 1, '2020-03-26 19:32:57', 1, 1, 1, 55, 6),
	(82, 1, 1, '2020-03-26 19:33:01', 1, 1, 1, 50, 16),
	(83, 1, 1, '2020-03-26 19:33:06', 1, 1, 1, 45, 25),
	(84, 1, 1, '2020-03-26 19:33:11', 1, 1, 1, 40, 33),
	(85, 1, 1, '2020-03-26 19:33:17', 1, 1, 1, 35, 40),
	(86, 1, 1, '2020-03-26 19:33:21', 1, 1, 1, 30, 50),
	(87, 1, 1, '2020-03-26 19:50:15', 1, 1, 1, 25, 56),
	(88, 1, 1, '2020-03-26 19:50:20', 1, 1, 1, 20, 66),
	(89, 1, 1, '2020-03-26 19:50:24', 1, 1, 1, 15, 73),
	(90, 1, 1, '2020-03-26 19:50:30', 1, 1, 1, 10, 81),
	(91, 1, 1, '2020-03-26 19:50:34', 1, 1, 1, 5, 91),
	(92, 1, 1, '2020-03-26 19:50:52', 1, 1, 2, 0, 100),
	(93, 1, 1, '2020-03-26 19:51:57', 1, 2, 1, 0, 0),
	(94, 1, 1, '2020-03-26 19:52:05', 1, 2, 1, 295, 1),
	(95, 1, 1, '2020-03-26 19:52:11', 1, 2, 1, 290, 3),
	(96, 1, 1, '2020-03-26 19:52:15', 1, 2, 1, 285, 5),
	(97, 1, 1, '2020-03-26 19:52:20', 1, 2, 1, 280, 6),
	(98, 1, 1, '2020-03-26 19:52:27', 1, 2, 1, 275, 8),
	(99, 1, 1, '2020-03-26 19:52:34', 1, 2, 1, 270, 9),
	(100, 1, 1, '2020-03-26 19:52:36', 1, 2, 1, 264, 12),
	(101, 1, 1, '2020-03-26 19:52:41', 1, 2, 1, 259, 13),
	(102, 1, 1, '2020-03-26 19:52:46', 1, 2, 1, 254, 15),
	(103, 1, 1, '2020-03-26 19:52:52', 1, 2, 1, 249, 16),
	(104, 1, 1, '2020-03-26 19:52:56', 1, 2, 1, 244, 18),
	(105, 1, 1, '2020-03-26 19:53:01', 1, 2, 1, 239, 20),
	(106, 1, 1, '2020-03-26 19:53:06', 1, 2, 1, 234, 22),
	(107, 1, 1, '2020-03-26 19:53:12', 1, 2, 1, 229, 23),
	(108, 1, 1, '2020-03-26 19:53:17', 1, 2, 1, 224, 25),
	(109, 1, 1, '2020-03-26 19:53:21', 1, 2, 1, 219, 27),
	(110, 1, 1, '2020-03-26 19:53:26', 1, 2, 1, 214, 28),
	(111, 1, 1, '2020-03-26 19:53:40', 1, 2, 1, 209, 30),
	(112, 1, 1, '2020-03-26 19:53:47', 1, 2, 1, 204, 32),
	(113, 1, 1, '2020-03-26 19:53:50', 1, 2, 1, 199, 33),
	(114, 1, 1, '2020-03-26 19:54:35', 1, 2, 1, 194, 35),
	(115, 1, 1, '2020-03-26 19:54:40', 1, 2, 1, 189, 37),
	(116, 1, 1, '2020-03-26 19:54:45', 1, 2, 1, 184, 38),
	(117, 1, 1, '2020-03-26 19:54:51', 1, 2, 1, 179, 40),
	(118, 1, 1, '2020-03-26 19:54:55', 1, 2, 1, 174, 42),
	(119, 1, 1, '2020-03-26 19:55:00', 1, 2, 1, 169, 43),
	(120, 1, 1, '2020-03-26 19:55:05', 1, 2, 1, 164, 45),
	(121, 1, 1, '2020-03-26 19:55:11', 1, 2, 1, 159, 46),
	(122, 1, 1, '2020-03-26 19:55:16', 1, 2, 1, 154, 48),
	(123, 1, 1, '2020-03-26 19:55:20', 1, 2, 1, 149, 50),
	(124, 1, 1, '2020-03-26 19:55:25', 1, 2, 1, 144, 52),
	(125, 1, 1, '2020-03-26 19:55:30', 1, 2, 1, 139, 53),
	(126, 1, 1, '2020-03-26 19:55:35', 1, 2, 1, 134, 55),
	(127, 1, 1, '2020-03-26 19:55:40', 1, 2, 1, 129, 57),
	(128, 1, 1, '2020-03-26 19:55:45', 1, 2, 1, 124, 58),
	(129, 1, 1, '2020-03-26 19:56:29', 1, 2, 1, 119, 60),
	(130, 1, 1, '2020-03-26 19:56:35', 1, 2, 1, 114, 61),
	(131, 1, 1, '2020-03-26 19:56:39', 1, 2, 1, 109, 63),
	(132, 1, 1, '2020-03-26 19:56:44', 1, 2, 1, 104, 65),
	(133, 1, 1, '2020-03-26 19:56:49', 1, 2, 1, 99, 67),
	(134, 1, 1, '2020-03-26 19:56:55', 1, 2, 1, 94, 68),
	(135, 1, 1, '2020-03-26 19:56:59', 1, 2, 1, 89, 70),
	(136, 1, 1, '2020-03-26 19:57:04', 1, 2, 1, 84, 72),
	(137, 1, 1, '2020-03-26 19:57:18', 1, 2, 1, 79, 73),
	(138, 1, 1, '2020-03-26 19:57:21', 1, 2, 1, 68, 77),
	(139, 1, 1, '2020-03-26 19:57:25', 1, 2, 1, 63, 79),
	(140, 1, 1, '2020-03-26 19:57:32', 1, 2, 1, 58, 80),
	(141, 1, 1, '2020-03-26 19:57:35', 1, 2, 1, 53, 82),
	(142, 1, 1, '2020-03-26 19:57:40', 1, 2, 1, 48, 84),
	(143, 1, 1, '2020-03-26 19:57:45', 1, 2, 1, 43, 85),
	(144, 1, 1, '2020-03-26 19:57:51', 1, 2, 1, 38, 87),
	(145, 1, 1, '2020-03-26 19:57:55', 1, 2, 1, 33, 89),
	(146, 1, 1, '2020-03-26 19:58:00', 1, 2, 1, 28, 90),
	(147, 1, 1, '2020-03-26 19:58:05', 1, 2, 1, 23, 92),
	(148, 1, 1, '2020-03-26 19:58:10', 1, 2, 1, 18, 94),
	(149, 1, 1, '2020-03-26 19:58:16', 1, 2, 1, 13, 95),
	(150, 1, 1, '2020-03-26 19:58:29', 1, 2, 1, 8, 97),
	(151, 1, 1, '2020-03-26 19:58:34', 1, 2, 1, 3, 99),
	(152, 1, 1, '2020-03-26 19:58:38', 1, 2, 2, 0, 100),
	(153, 1, 1, '2020-03-26 19:58:57', 1, 1, 1, 0, 0),
	(154, 1, 1, '2020-03-26 19:59:05', 1, 1, 1, 55, 6),
	(155, 1, 1, '2020-03-26 19:59:10', 1, 1, 1, 50, 16),
	(156, 1, 1, '2020-03-26 19:59:16', 1, 1, 1, 45, 23),
	(157, 1, 1, '2020-03-26 19:59:20', 1, 1, 1, 40, 33),
	(158, 1, 1, '2020-03-26 19:59:25', 1, 1, 1, 35, 41),
	(159, 1, 1, '2020-03-26 19:59:30', 1, 1, 1, 30, 50),
	(160, 1, 1, '2020-03-26 19:59:36', 1, 1, 1, 25, 56),
	(161, 1, 1, '2020-03-26 19:59:51', 1, 1, 1, 20, 65),
	(162, 1, 1, '2020-03-26 19:59:55', 1, 1, 1, 15, 73),
	(163, 1, 1, '2020-03-26 20:00:01', 1, 1, 1, 10, 81),
	(164, 1, 1, '2020-03-26 20:00:05', 1, 1, 1, 5, 91),
	(165, 1, 1, '2020-03-26 20:00:11', 1, 1, 2, 0, 100),
	(166, 1, 1, '2020-03-26 20:29:04', 3, 0, 1, 0, 100),
	(167, 1, 1, '2020-03-26 20:49:21', 1, 1, 1, 515, 0),
	(168, 1, 1, '2020-03-26 20:49:28', 1, 1, 1, 55, 6),
	(169, 1, 1, '2020-03-26 20:49:29', 1, 1, 3, 55, 100),
	(170, 1, 1, '2020-03-26 21:17:45', 3, 0, 1, 0, 0),
	(171, 1, 1, '2020-03-26 21:48:05', 3, 0, 3, 105, 100),
	(172, 1, 1, '2020-03-26 22:20:01', 3, 0, 1, 0, 0),
	(173, 1, 1, '2020-03-26 22:40:39', 3, 0, 3, 225, 100),
	(174, 1, 1, '2020-03-26 23:32:04', 4, 4, 1, 225, 0),
	(175, 1, 1, '2020-03-26 23:32:09', 4, 4, 2, -2862, 100),
	(176, 1, 1, '2020-03-26 23:39:06', 4, 1, 1, -2862, 0),
	(177, 1, 1, '2020-03-26 23:39:11', 4, 1, 2, -3284, 100),
	(178, 1, 1, '2020-03-26 23:47:35', 1, 7, 1, 0, 0),
	(179, 1, 1, '2020-03-26 23:47:39', 1, 7, 2, 0, 100),
	(180, 1, 1, '2020-03-26 23:47:51', 4, 1, 1, 0, 0),
	(181, 1, 1, '2020-03-26 23:47:58', 4, 1, 1, 7889245, 0),
	(182, 1, 1, '2020-03-26 23:48:04', 4, 1, 1, 7889240, 0),
	(183, 1, 1, '2020-03-26 23:48:09', 4, 1, 1, 7889235, 0),
	(184, 1, 1, '2020-03-26 23:48:13', 4, 1, 1, 7889230, 0),
	(185, 1, 1, '2020-03-26 23:48:18', 4, 1, 1, 7889225, 0),
	(186, 1, 1, '2020-03-26 23:48:24', 4, 1, 1, 7889220, 0),
	(187, 1, 1, '2020-03-26 23:48:28', 4, 1, 1, 7889215, 0),
	(188, 1, 1, '2020-03-26 23:48:35', 4, 1, 1, 7889210, 0),
	(189, 1, 1, '2020-03-26 23:48:41', 4, 1, 1, 7889205, 0),
	(190, 1, 1, '2020-03-26 23:48:44', 4, 1, 1, 7889200, 0),
	(191, 1, 1, '2020-03-26 23:48:49', 4, 1, 1, 7889195, 0),
	(192, 1, 1, '2020-03-26 23:48:55', 4, 1, 1, 7889190, 0),
	(193, 1, 1, '2020-03-26 23:48:59', 4, 1, 1, 7889185, 0),
	(194, 1, 1, '2020-03-26 23:49:04', 4, 1, 1, 7889180, 0),
	(195, 1, 1, '2020-03-26 23:49:08', 4, 1, 1, 7889175, 0),
	(196, 1, 1, '2020-03-26 23:49:13', 4, 1, 1, 7889170, 0),
	(197, 1, 1, '2020-03-26 23:49:19', 4, 1, 1, 7889165, 0),
	(198, 1, 1, '2020-03-26 23:49:24', 4, 1, 1, 7889160, 0),
	(199, 1, 1, '2020-03-26 23:49:28', 4, 1, 1, 7889155, 0),
	(200, 1, 1, '2020-03-26 23:49:35', 4, 1, 1, 7889150, 0),
	(201, 1, 1, '2020-03-26 23:49:40', 4, 1, 1, 7889145, 0),
	(202, 1, 1, '2020-03-26 23:49:44', 4, 1, 1, 7889140, 0),
	(203, 1, 1, '2020-03-26 23:49:48', 4, 1, 1, 7889135, 0),
	(204, 1, 1, '2020-03-26 23:49:56', 4, 1, 1, 7889130, 0),
	(205, 1, 1, '2020-03-26 23:49:59', 4, 1, 1, 7889124, 0),
	(206, 1, 1, '2020-03-26 23:50:05', 4, 1, 1, 7889119, 0),
	(207, 1, 1, '2020-03-26 23:50:10', 4, 1, 1, 7889114, 0),
	(208, 1, 1, '2020-03-26 23:50:16', 4, 1, 1, 7889109, 0),
	(209, 1, 1, '2020-03-26 23:50:27', 4, 1, 1, 7889104, 0),
	(210, 1, 1, '2020-03-26 23:50:31', 4, 1, 1, 7889094, 0),
	(211, 1, 1, '2020-03-26 23:50:40', 4, 1, 1, 7889089, 0),
	(212, 1, 1, '2020-03-26 23:50:45', 4, 1, 1, 7889080, 0),
	(213, 1, 1, '2020-03-26 23:50:48', 4, 1, 1, 7889075, 0),
	(214, 1, 1, '2020-03-26 23:51:00', 4, 1, 1, 7889070, 0),
	(215, 1, 1, '2020-03-26 23:51:03', 4, 1, 1, 7889061, 0),
	(216, 1, 1, '2020-03-26 23:51:08', 4, 1, 1, 7889056, 0),
	(217, 1, 1, '2020-03-26 23:51:12', 4, 1, 1, 7889051, 0),
	(218, 1, 1, '2020-03-26 23:51:17', 4, 1, 1, 7889046, 0),
	(219, 1, 1, '2020-03-26 23:51:22', 4, 1, 1, 7889041, 0),
	(220, 1, 1, '2020-03-26 23:51:28', 4, 1, 1, 7889036, 0),
	(221, 1, 1, '2020-03-26 23:51:33', 4, 1, 1, 7889031, 0),
	(222, 1, 1, '2020-03-26 23:51:37', 4, 1, 1, 7889026, 0),
	(223, 1, 1, '2020-03-26 23:51:42', 4, 1, 1, 7889021, 0),
	(224, 1, 1, '2020-03-26 23:51:47', 4, 1, 1, 7889016, 0),
	(225, 1, 1, '2020-03-26 23:51:55', 4, 1, 1, 7889011, 0),
	(226, 1, 1, '2020-03-26 23:51:58', 4, 1, 1, 7889005, 0),
	(227, 1, 1, '2020-03-26 23:52:04', 4, 1, 1, 7889000, 0),
	(228, 1, 1, '2020-03-26 23:52:09', 4, 1, 1, 7888995, 0),
	(229, 1, 1, '2020-03-26 23:52:13', 4, 1, 1, 7888990, 0),
	(230, 1, 1, '2020-03-26 23:52:18', 4, 1, 1, 7888985, 0),
	(231, 1, 1, '2020-03-26 23:52:24', 4, 1, 1, 7888979, 0),
	(232, 1, 1, '2020-03-26 23:52:30', 4, 1, 1, 7888974, 0),
	(233, 1, 1, '2020-03-26 23:52:34', 4, 1, 1, 7888969, 0),
	(234, 1, 1, '2020-03-26 23:52:39', 4, 1, 1, 7888964, 0),
	(235, 1, 1, '2020-03-26 23:52:44', 4, 1, 1, 7888959, 0),
	(236, 1, 1, '2020-03-26 23:52:50', 4, 1, 1, 7888954, 0),
	(237, 1, 1, '2020-03-26 23:52:54', 4, 1, 1, 7888949, 0),
	(238, 1, 1, '2020-03-26 23:52:59', 4, 1, 1, 7888944, 0),
	(239, 1, 1, '2020-03-26 23:53:04', 4, 1, 1, 7888939, 0),
	(240, 1, 1, '2020-03-26 23:53:10', 4, 1, 1, 7888934, 0),
	(241, 1, 1, '2020-03-26 23:53:15', 4, 1, 1, 7888929, 0),
	(242, 1, 1, '2020-03-26 23:53:19', 4, 1, 1, 7888924, 0),
	(243, 1, 1, '2020-03-26 23:53:24', 4, 1, 1, 7888919, 0),
	(244, 1, 1, '2020-03-26 23:53:29', 4, 1, 1, 7888914, 0),
	(245, 1, 1, '2020-03-26 23:53:35', 4, 1, 1, 7888909, 0),
	(246, 1, 1, '2020-03-26 23:53:40', 4, 1, 1, 7888904, 0),
	(247, 1, 1, '2020-03-26 23:53:44', 4, 1, 1, 7888899, 0),
	(248, 1, 1, '2020-03-26 23:53:49', 4, 1, 1, 7888894, 0),
	(249, 1, 1, '2020-03-26 23:53:55', 4, 1, 1, 7888889, 0),
	(250, 1, 1, '2020-03-26 23:54:00', 4, 1, 1, 7888884, 0),
	(251, 1, 1, '2020-03-26 23:54:04', 4, 1, 1, 7888879, 0),
	(252, 1, 1, '2020-03-26 23:54:09', 4, 1, 1, 7888874, 0),
	(253, 1, 1, '2020-03-26 23:54:15', 4, 1, 1, 7888869, 0),
	(254, 1, 1, '2020-03-26 23:54:20', 4, 1, 1, 7888864, 0),
	(255, 1, 1, '2020-03-26 23:54:24', 4, 1, 1, 7888859, 0),
	(256, 1, 1, '2020-03-26 23:54:29', 4, 1, 1, 7888854, 0),
	(257, 1, 1, '2020-03-26 23:54:35', 4, 1, 1, 7888849, 0),
	(258, 1, 1, '2020-03-26 23:54:40', 4, 1, 1, 7888844, 0),
	(259, 1, 1, '2020-03-26 23:54:44', 4, 1, 1, 7888839, 0),
	(260, 1, 1, '2020-03-26 23:54:52', 4, 1, 1, 7888834, 0),
	(261, 1, 1, '2020-03-26 23:54:54', 4, 1, 1, 7888829, 0),
	(262, 1, 1, '2020-03-26 23:54:59', 4, 1, 1, 7888824, 0),
	(263, 1, 1, '2020-03-26 23:55:04', 4, 1, 1, 7888819, 0),
	(264, 1, 1, '2020-03-26 23:55:10', 4, 1, 1, 7888814, 0),
	(265, 1, 1, '2020-03-26 23:55:15', 4, 1, 1, 7888809, 0),
	(266, 1, 1, '2020-03-26 23:55:19', 4, 1, 1, 7888804, 0),
	(267, 1, 1, '2020-03-26 23:55:24', 4, 1, 1, 7888799, 0),
	(268, 1, 1, '2020-03-26 23:55:30', 4, 1, 1, 7888794, 0),
	(269, 1, 1, '2020-03-26 23:55:35', 4, 1, 1, 7888789, 0),
	(270, 1, 1, '2020-03-26 23:55:39', 4, 1, 1, 7888784, 0),
	(271, 1, 1, '2020-03-26 23:55:44', 4, 1, 1, 7888779, 0),
	(272, 1, 1, '2020-03-26 23:55:50', 4, 1, 1, 7888774, 0),
	(273, 1, 1, '2020-03-26 23:55:55', 4, 1, 1, 7888769, 0),
	(274, 1, 1, '2020-03-26 23:55:55', 4, 1, 3, 7888769, 100),
	(275, 1, 1, '2020-03-26 23:56:15', 4, 1, 1, 7888769, 0),
	(276, 1, 1, '2020-03-26 23:56:21', 4, 1, 1, 7889245, 0),
	(277, 1, 1, '2020-03-26 23:56:36', 4, 1, 1, 7889240, 0),
	(278, 1, 1, '2020-03-26 23:56:42', 4, 1, 1, 7889235, 0),
	(279, 1, 1, '2020-03-26 23:56:47', 4, 1, 1, 7889230, 0),
	(280, 1, 1, '2020-03-26 23:57:03', 4, 1, 1, 7889225, 0),
	(281, 1, 1, '2020-03-26 23:57:12', 4, 1, 1, 7889220, 0),
	(282, 1, 1, '2020-03-26 23:58:19', 4, 1, 1, 7889215, 0),
	(283, 1, 1, '2020-03-26 23:58:22', 4, 1, 1, 7889207, 0),
	(284, 1, 1, '2020-03-26 23:58:27', 4, 1, 1, 7889202, 0),
	(285, 1, 1, '2020-03-26 23:59:09', 4, 1, 1, 7889197, 0),
	(286, 1, 1, '2020-03-26 23:59:16', 4, 1, 1, 7889192, 0),
	(287, 1, 1, '2020-03-26 23:59:23', 4, 1, 1, 7889185, 0),
	(288, 1, 1, '2020-03-26 23:59:35', 4, 1, 1, 7889178, 0),
	(289, 1, 1, '2020-03-26 23:59:39', 4, 1, 1, 7889166, 0),
	(290, 1, 1, '2020-03-26 23:59:42', 4, 1, 1, 7889161, 0),
	(291, 1, 1, '2020-03-26 23:59:47', 4, 1, 1, 7889156, 0),
	(292, 1, 1, '2020-03-26 23:59:52', 4, 1, 1, 7889151, 0),
	(293, 1, 1, '2020-03-26 23:59:58', 4, 1, 1, 7889146, 0),
	(294, 1, 1, '2020-03-27 00:00:03', 4, 1, 1, 7889141, 0),
	(295, 1, 1, '2020-03-27 00:00:07', 4, 1, 1, 7889136, 0),
	(296, 1, 1, '2020-03-27 00:00:15', 4, 1, 1, 7889131, 0),
	(297, 1, 1, '2020-03-27 00:00:17', 4, 1, 1, 7889126, 0),
	(298, 1, 1, '2020-03-27 00:00:22', 4, 1, 1, 7889121, 0),
	(299, 1, 1, '2020-03-27 00:00:27', 4, 1, 1, 7889116, 0),
	(300, 1, 1, '2020-03-27 00:00:33', 4, 1, 1, 7889111, 0),
	(301, 1, 1, '2020-03-27 00:00:38', 4, 1, 1, 7889106, 0),
	(302, 1, 1, '2020-03-27 00:00:44', 4, 1, 1, 7889101, 0),
	(303, 1, 1, '2020-03-27 00:00:45', 4, 1, 3, 7889101, 100),
	(304, 1, 1, '2020-03-27 00:02:11', 2, 1, 1, 0, 0),
	(305, 1, 1, '2020-03-27 00:02:19', 2, 1, 1, 55, 6),
	(306, 1, 1, '2020-03-27 00:02:25', 2, 1, 1, 50, 15),
	(307, 1, 1, '2020-03-27 00:02:29', 2, 1, 1, 45, 25),
	(308, 1, 1, '2020-03-27 00:02:34', 2, 1, 1, 40, 33),
	(309, 1, 1, '2020-03-27 00:02:39', 2, 1, 1, 35, 41),
	(310, 1, 1, '2020-03-27 00:03:02', 2, 1, 1, 30, 48),
	(311, 1, 1, '2020-03-27 00:03:05', 2, 1, 1, 22, 63),
	(312, 1, 1, '2020-03-27 00:03:11', 2, 1, 1, 17, 71),
	(313, 1, 1, '2020-03-27 00:03:23', 2, 1, 1, 12, 80),
	(314, 1, 1, '2020-03-27 00:03:29', 2, 1, 1, 1, 98),
	(315, 1, 1, '2020-03-27 00:03:40', 2, 1, 2, -5, 100),
	(316, 1, 1, '2020-03-28 19:16:50', 1, 1, 1, 0, 0),
	(317, 1, 1, '2020-03-28 19:16:57', 1, 1, 1, 55, 6),
	(318, 1, 1, '2020-03-28 19:17:02', 1, 1, 1, 50, 16),
	(319, 1, 1, '2020-03-28 19:17:07', 1, 1, 1, 45, 25),
	(320, 1, 1, '2020-03-28 19:17:12', 1, 1, 1, 40, 33),
	(321, 1, 1, '2020-03-28 19:17:18', 1, 1, 1, 35, 40),
	(322, 1, 1, '2020-03-28 19:17:22', 1, 1, 1, 30, 50),
	(323, 1, 1, '2020-03-28 19:17:27', 1, 1, 1, 25, 58),
	(324, 1, 1, '2020-03-28 19:17:32', 1, 1, 1, 20, 66),
	(325, 1, 1, '2020-03-28 19:17:36', 1, 1, 1, 15, 75),
	(326, 1, 1, '2020-03-28 19:17:42', 1, 1, 1, 10, 81),
	(327, 1, 1, '2020-03-28 19:17:47', 1, 1, 1, 5, 91),
	(328, 1, 1, '2020-03-28 19:17:53', 1, 1, 2, 0, 100);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.log_updates
CREATE TABLE IF NOT EXISTS `log_updates` (
  `IDplaca` int(11) NOT NULL,
  `fecha_update` timestamp NULL DEFAULT NULL,
  `oldVersion` varchar(10) DEFAULT NULL,
  `newVersion` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `version` (`oldVersion`) USING BTREE,
  KEY `FK_log_updates_placas` (`IDplaca`),
  CONSTRAINT `FK_log_updates_firmwares` FOREIGN KEY (`oldVersion`) REFERENCES `firmwares` (`version`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_log_updates_placas` FOREIGN KEY (`IDplaca`) REFERENCES `placas` (`IDplaca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.log_updates: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `log_updates` DISABLE KEYS */;
REPLACE INTO `log_updates` (`IDplaca`, `fecha_update`, `oldVersion`, `newVersion`, `id`) VALUES
	(1, '2020-03-29 00:15:58', '1.0.0', '1.0.2', 22),
	(1, '2020-03-29 12:55:43', '1.0.2', '1.0.2', 23),
	(1, '2020-03-29 12:56:42', '1.0.2', '1.0.2', 24),
	(1, '2020-03-29 12:58:15', '1.0.2', '1.0.2', 25),
	(1, '2020-03-29 12:58:34', '1.0.2', '1.0.2', 26),
	(1, '2020-03-29 12:58:47', '1.0.2', '1.0.2', 27),
	(1, '2020-03-29 12:59:24', '1.0.2', '1.0.2', 28),
	(1, '2020-03-29 12:59:45', '1.0.2', '1.0.2', 29),
	(1, '2020-03-29 14:50:33', '1.0.2', '1.0.3', 30),
	(1, '2020-03-29 15:22:47', '1.0.3', '1.0.3', 31),
	(1, '2020-03-29 15:26:46', '1.0.3', '1.0.3', 32),
	(1, '2020-03-29 15:26:55', '1.0.3', '1.0.2', 33),
	(1, '2020-03-29 15:27:18', '1.0.2', '1.0.3', 34),
	(1, '2020-03-29 15:27:56', '1.0.3', '1.0.4', 35);
/*!40000 ALTER TABLE `log_updates` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `IDplaca` int(11) NOT NULL DEFAULT 0,
  `menu` int(11) NOT NULL DEFAULT 0,
  `fallo` int(11) NOT NULL DEFAULT 0,
  `updateNextBoot` int(11) DEFAULT 0,
  PRIMARY KEY (`IDplaca`) USING BTREE,
  CONSTRAINT `FK_menu_placas` FOREIGN KEY (`IDplaca`) REFERENCES `placas` (`IDplaca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.menu: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE INTO `menu` (`IDplaca`, `menu`, `fallo`, `updateNextBoot`) VALUES
	(1, 0, 0, 0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.placas
CREATE TABLE IF NOT EXISTS `placas` (
  `IDplaca` int(11) NOT NULL AUTO_INCREMENT,
  `mac` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `needUpdate` int(11) DEFAULT 0,
  `usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDplaca`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.placas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `placas` DISABLE KEYS */;
REPLACE INTO `placas` (`IDplaca`, `mac`, `needUpdate`, `usuario`) VALUES
	(1, '84:0D:8E:B0:7C:53', 0, NULL);
/*!40000 ALTER TABLE `placas` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.procesos
CREATE TABLE IF NOT EXISTS `procesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.procesos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
REPLACE INTO `procesos` (`id`, `proceso`) VALUES
	(1, 'Maceracion'),
	(2, 'Coccion'),
	(3, 'Transvase'),
	(4, 'Fermentacion');
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.recetas
CREATE TABLE IF NOT EXISTS `recetas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `tempMacer` varchar(50) NOT NULL DEFAULT '0',
  `tiempoMacer` varchar(50) NOT NULL DEFAULT '0',
  `tempCoc` varchar(50) NOT NULL DEFAULT '0',
  `tiempoCoc` varchar(50) NOT NULL DEFAULT '0',
  `tempFermen` varchar(50) NOT NULL DEFAULT '0',
  `tiempoFermen` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.recetas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
REPLACE INTO `recetas` (`ID`, `nombre`, `tempMacer`, `tiempoMacer`, `tempCoc`, `tiempoCoc`, `tempFermen`, `tiempoFermen`) VALUES
	(1, 'Pinta', '0:54:78:89:34', '0:1:5:7:3', '0:30', '0:1', '0:42', '0:3');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.updates
CREATE TABLE IF NOT EXISTS `updates` (
  `IDplaca` int(11) NOT NULL,
  `currentVersion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IDplaca`),
  KEY `FK_updates_firmwares` (`currentVersion`) USING BTREE,
  CONSTRAINT `FK_updates_firmwares` FOREIGN KEY (`currentVersion`) REFERENCES `firmwares` (`version`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_updates_placas` FOREIGN KEY (`IDplaca`) REFERENCES `placas` (`IDplaca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla cervecero.updates: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
REPLACE INTO `updates` (`IDplaca`, `currentVersion`) VALUES
	(1, '1.0.4');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;

-- Volcando estructura para tabla cervecero.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `registered_date` datetime DEFAULT NULL,
  `removed_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `manager` int(11) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `shift_start` time DEFAULT NULL,
  `shift_end` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cervecero.users: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `title`, `first_name`, `last_name`, `phone`, `city`, `zip`, `updated_date`, `registered_date`, `removed_date`, `active`, `manager`, `site`, `image`, `shift_start`, `shift_end`) VALUES
	(1, 'Miss', 'Quynn', 'Contreras', '1-971-977-4681', 'Slidell', '81080', '2020-03-29 20:59:25', '2012-04-06 18:53:00', NULL, 0, 1, 1, NULL, '08:00:00', '16:00:00'),
	(2, 'Mr', 'Kaitlin', 'Smith', '1-436-523-6103', 'Orlando', 'U5G 7J3', '2020-03-29 20:59:25', '2012-11-20 05:58:25', NULL, 1, 1, 2, NULL, '09:00:00', '17:00:00'),
	(3, 'Mrs', 'Cruz', 'Reynolds', '1-776-102-6352', 'Lynn', 'EJ89 9DQ', '2020-03-29 20:59:25', '2011-12-31 23:34:03', NULL, 0, 2, 3, NULL, '09:00:00', '17:00:00'),
	(4, 'Dr', 'Sophia', 'Morris', '1-463-224-1405', 'Belleville', 'T1F 2X1', '2020-03-29 20:59:25', '2012-08-04 02:55:53', NULL, 0, 3, 4, NULL, '08:00:00', '15:30:00'),
	(5, 'Miss', 'Kamal', 'Roberson', '1-134-408-5227', 'Rehoboth Beach', 'V7I 6T5', '2020-03-29 20:59:25', '2012-12-23 00:17:03', NULL, 1, 1, 5, NULL, '09:00:00', '17:00:00'),
	(6, 'Dr', 'Dustin', 'Rosa', '1-875-919-3188', 'Jersey City', 'E4 8ZE', '2020-03-29 20:59:25', '2012-10-05 22:18:59', NULL, 0, 1, 6, NULL, '09:00:00', '17:00:00'),
	(7, 'Dr', 'Xantha', 'George', '1-106-884-4754', 'Billings', 'Y2I 6J7', '2020-03-29 20:59:25', '2012-11-25 12:50:16', NULL, 0, 6, 1, NULL, '07:00:00', '15:00:00'),
	(8, 'Mrs', 'Bryar', 'Long', '1-918-114-8083', 'San Bernardino', '82983', '2020-03-29 20:59:25', '2012-05-14 23:32:25', NULL, 0, 1, 2, NULL, '09:00:00', '17:00:00'),
	(9, 'Mrs', 'Kuame', 'Wynn', '1-101-692-4039', 'Truth or Consequences', '21290', '2020-03-29 20:59:25', '2011-06-21 16:27:07', NULL, 1, 2, 3, NULL, '06:00:00', '14:00:00'),
	(10, 'Ms', 'Indigo', 'Brennan', '1-756-756-8161', 'Moline', 'NO8 3UY', '2020-03-29 20:59:25', '2011-02-19 12:51:08', NULL, 1, 5, 4, NULL, '12:00:00', '00:00:00'),
	(11, 'Mrs', 'Avram', 'Allison', '1-751-507-2640', 'Rancho Palos Verdes', 'I7Q 8H4', '2020-03-29 20:59:25', '2012-12-30 17:02:10', NULL, 0, 1, 5, NULL, '09:00:00', '17:00:00'),
	(12, 'Mr', 'Martha', 'Burgess', '1-971-722-1203', 'Toledo', 'Q5R 9HI', '2020-03-29 20:59:25', '2011-02-04 17:25:55', NULL, 1, 1, 6, NULL, '12:00:00', '00:00:00'),
	(13, 'Miss', 'Lael', 'Kim', '1-626-697-2194', 'Lake Charles', '34209', '2020-03-29 20:59:25', '2012-07-24 06:44:22', NULL, 1, 7, 1, NULL, '09:00:00', '17:00:00'),
	(14, 'Dr', 'Lyle', 'Lewis', '1-231-793-3520', 'Simi Valley', 'H9B 2H4', '2020-03-29 20:59:25', '2012-08-30 03:28:54', NULL, 0, 1, 2, NULL, '00:00:00', '12:00:00'),
	(15, 'Miss', 'Veronica', 'Marks', '1-750-981-6759', 'Glens Falls', 'E3C 5D1', '2020-03-29 20:59:25', '2012-08-14 12:09:24', NULL, 1, 2, 3, NULL, '09:00:00', '17:00:00'),
	(16, 'Mrs', 'Wynne', 'Ruiz', '1-983-744-5362', 'Branson', 'L9E 6E2', '2020-03-29 20:59:25', '2012-11-06 01:04:07', NULL, 0, 1, 4, NULL, '12:00:00', '00:00:00'),
	(17, 'Ms', 'Jessica', 'Bryan', '1-949-932-6772', 'Boulder City', 'F5P 6NU', '2020-03-29 20:59:25', '2013-02-01 20:22:33', NULL, 0, 5, 5, NULL, '09:00:00', '17:00:00'),
	(18, 'Ms', 'Quinlan', 'Hyde', '1-625-664-6072', 'Sheridan', 'Y8A 1LQ', '2020-03-29 20:59:25', '2011-10-25 16:53:45', NULL, 1, 1, 6, NULL, '08:00:00', '15:00:00'),
	(19, 'Miss', 'Mona', 'Terry', '1-443-179-7343', 'Juneau', 'G62 1OF', '2020-03-29 20:59:25', '2012-01-15 09:26:59', NULL, 0, 1, 1, NULL, '08:30:00', '16:30:00'),
	(20, 'Mrs', 'Medge', 'Patterson', '1-636-979-0497', 'Texarkana', 'I5U 6E0', '2020-03-29 20:59:25', '2012-10-20 16:26:18', NULL, 1, 1, 2, NULL, '09:00:00', '17:00:00'),
	(21, 'Mrs', 'Perry', 'Gamble', '1-440-976-9560', 'Arcadia', '98923', '2020-03-29 20:59:25', '2012-06-06 02:03:49', NULL, 1, 2, 3, NULL, '00:00:00', '12:00:00'),
	(22, 'Mrs', 'Pandora', 'Armstrong', '1-197-431-4390', 'Glendora', '34124', '2020-03-29 20:59:25', '2011-08-29 01:45:06', NULL, 0, 7, 4, NULL, '21:00:00', '03:00:00'),
	(23, 'Mr', 'Pandora', 'Briggs', '1-278-288-9221', 'Oneida', 'T9M 4H9', '2020-03-29 20:59:25', '2012-07-16 08:44:41', NULL, 1, 4, 5, NULL, '09:00:00', '17:00:00'),
	(24, 'Mrs', 'Maris', 'Leblanc', '1-936-114-2921', 'Cohoes', 'V1H 6Z7', '2020-03-29 20:59:25', '2011-05-04 13:07:04', NULL, 1, 1, 6, NULL, '00:00:00', '12:00:00'),
	(25, 'Mrs', 'Ishmael', 'Crosby', '1-307-243-2684', 'Midwest City', 'T6 8PS', '2020-03-29 20:59:25', '2011-07-02 23:11:11', NULL, 0, 3, 1, NULL, '09:00:00', '17:00:00'),
	(26, 'Miss', 'Quintessa', 'Pickett', '1-801-122-7471', 'North Tonawanda', '09166', '2020-03-29 20:59:25', '2013-02-05 10:33:22', NULL, 1, 1, 2, NULL, '12:00:00', '00:00:00'),
	(27, 'Miss', 'Ifeoma', 'Mays', '1-103-883-0962', 'Parkersburg', '87377', '2020-03-29 20:59:25', '2011-08-22 12:19:09', NULL, 0, 1, 3, NULL, '09:00:00', '17:00:00'),
	(28, 'Mrs', 'Basia', 'Harrell', '1-528-238-4178', 'Cody', 'LJ54 1IU', '2020-03-29 20:59:25', '2012-05-07 14:42:55', NULL, 1, 1, 4, NULL, '09:00:00', '17:00:00'),
	(29, 'Mrs', 'Hamilton', 'Blackburn', '1-676-857-1423', 'Delta Junction', 'X5 9HE', '2020-03-29 20:59:25', '2011-05-19 07:39:48', NULL, 0, 6, 5, NULL, '10:00:00', '18:00:00'),
	(30, 'Ms', 'Dexter', 'Burton', '1-275-332-8186', 'Gainesville', '65914', '2020-03-29 20:59:25', '2013-02-01 16:21:20', NULL, 1, 5, 6, NULL, '21:00:00', '03:00:00'),
	(31, 'Mrs', 'Quinn', 'Mccall', '1-808-916-4497', 'Fallon', 'X4 8UB', '2020-03-29 20:59:25', '2012-03-24 19:31:51', NULL, 0, 1, 1, NULL, '09:00:00', '17:00:00'),
	(32, 'Mr', 'Alexa', 'Wilder', '1-727-307-1997', 'Johnson City', '16765', '2020-03-29 20:59:25', '2011-10-14 08:21:14', NULL, 0, 3, 2, NULL, '09:00:00', '17:00:00'),
	(33, 'Ms', 'Rhonda', 'Harrell', '1-934-906-6474', 'Minnetonka', 'I2R 1H2', '2020-03-29 20:59:25', '2011-11-15 00:08:02', NULL, 1, 1, 3, NULL, '12:00:00', '00:00:00'),
	(34, 'Mrs', 'Jocelyn', 'England', '1-826-860-7773', 'Chico', '71102', '2020-03-29 20:59:25', '2012-05-31 18:01:43', NULL, 1, 1, 4, NULL, '09:00:00', '17:00:00'),
	(35, 'Dr', 'Vincent', 'Banks', '1-225-418-0941', 'Palo Alto', '03281', '2020-03-29 20:59:25', '2011-08-07 07:22:43', NULL, 0, 1, 5, NULL, '18:00:00', '02:00:00'),
	(36, 'Mrs', 'Stewart', 'Chan', '1-781-793-2340', 'Grand Forks', 'L1U 3ED', '2020-03-29 20:59:25', '2012-11-01 23:14:44', NULL, 1, 6, 6, NULL, '08:00:00', '16:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para disparador cervecero.info_AU
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `info_AU` AFTER UPDATE ON `info` FOR EACH ROW BEGIN
	INSERT INTO log (IDplaca,receta,time,proceso,pasoProceso,estado,tiempoRestante,porcentaje) VALUES (NEW.IDplaca,NEW.receta,NOW(),NEW.proceso,NEW.pasoProceso,NEW.estado,NEW.tiempoRestante,NEW.porcentaje);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador cervecero.placas_AI
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `placas_AI` AFTER INSERT ON `placas` FOR EACH ROW BEGIN
	INSERT INTO menu (IDplaca) VALUES (NEW.id);
	INSERT INTO info (IDplaca) VALUES (NEW.id);
	INSERT INTO updates (IDplaca) VALUES (NEW.id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador cervecero.updates_BU
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `updates_BU` BEFORE UPDATE ON `updates` FOR EACH ROW BEGIN
	INSERT INTO log_updates (IDplaca,fecha_update,oldVersion,newVersion) VALUES (NEW.IDplaca,NOW(),OLD.currentVersion,NEW.currentVersion);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
