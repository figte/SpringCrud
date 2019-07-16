-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd
CREATE DATABASE IF NOT EXISTS `bd` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd`;

-- Volcando estructura para tabla bd.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `direccion` varchar(100) DEFAULT '0',
  `telefono` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd.clientes: ~0 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nombre`, `direccion`, `telefono`) VALUES
	(1, 'jose perez', 'sonsonate', '24205659');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla bd.detalles_ventas
CREATE TABLE IF NOT EXISTS `detalles_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL DEFAULT '0',
  `idVenta` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_detalles_ventas_productos` (`idProducto`),
  KEY `FK_detalles_ventas_ventas` (`idVenta`),
  CONSTRAINT `FK_detalles_ventas_productos` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_detalles_ventas_ventas` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd.detalles_ventas: ~2 rows (aproximadamente)
DELETE FROM `detalles_ventas`;
/*!40000 ALTER TABLE `detalles_ventas` DISABLE KEYS */;
INSERT INTO `detalles_ventas` (`id`, `cantidad`, `idProducto`, `idVenta`) VALUES
	(1, 2, 3, 1),
	(2, 1, 4, 1);
/*!40000 ALTER TABLE `detalles_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla bd.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT '0',
  `apellidos` varchar(50) DEFAULT '0',
  `edad` int(11) DEFAULT '0',
  `direccion` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd.personas: ~6 rows (aproximadamente)
DELETE FROM `personas`;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` (`id`, `nombre`, `apellidos`, `edad`, `direccion`) VALUES
	(15, 'Elmer', 'Lopez', 23, 'Ataco'),
	(17, 'Julia', 'Medina', 30, 'Turin'),
	(22, 'Marco', 'Gonzales', 19, 'Ataco'),
	(23, 'Felipe', 'Perez', 23, 'Ataco'),
	(24, 'Maria', 'Lopez', 20, 'Ahuachapan');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;

-- Volcando estructura para tabla bd.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `precio` double NOT NULL DEFAULT '0',
  `existencias` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd.productos: ~4 rows (aproximadamente)
DELETE FROM `productos`;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `precio`, `existencias`) VALUES
	(1, 'jabon', 1.5, 50),
	(2, 'shampoo', 2, 50),
	(3, 'Camisa tipo polo', 3.5, 60),
	(4, 'Pantalon Levi', 15, 50);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla bd.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd.roles: ~2 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `nombre`) VALUES
	(1, 'admin'),
	(2, 'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla bd.trabajador
CREATE TABLE IF NOT EXISTS `trabajador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `cargo` varchar(100) NOT NULL DEFAULT '0',
  `direccion` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='tabla que contiene todos los empleados';

-- Volcando datos para la tabla bd.trabajador: ~12 rows (aproximadamente)
DELETE FROM `trabajador`;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` (`id`, `nombre`, `email`, `cargo`, `direccion`) VALUES
	(1, 'Luis', 'luis.rodriguez@gmail.com', 'Alferes', 'Bo. El Centro, 2-6'),
	(2, 'karina', 'karina.russell@popffets.org', 'vendedora', 'col.santa rita #22'),
	(3, 'katheryn', 'kathy.martinez@procesal.sv', 'rectora', 'paseo General Escalon N523'),
	(4, 'Josselyn', 'josselyn.herrera@financiera.com', 'cajera', 'colonia altos del pino'),
	(6, 'Yeimi', 'yeimi.martinez@muni.sv', 'inspectora', 'pacifica n23'),
	(7, 'keyla', 'keyla.maria@telux.com', 'recepcionista', 'residencial universitaria'),
	(8, 'Eunice', 'eunice.rosas@interchange.org', 'Interpolador', 'colonia masfererr'),
	(9, 'Michelle', 'michelle.moran@pilotos.sv', 'piloto de riesgo', 'bo la vega'),
	(10, 'Johanna', 'johanna.merino@oneclick.sv', 'interlocutora', 'colonia el trebol'),
	(11, 'Libny', 'libny.azurdia@docentes.org', 'docente', 'zona 6 chimaltenango'),
	(12, 'Sindy', 'sindy.azurdia@clinica.org', 'enfermera', 'zona 6 chimaltenango'),
	(16, 'Jessica', 'jessica.hernandez@comercial.com', 'Rutera', 'santa gertrudis');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;

-- Volcando estructura para tabla bd.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuarios_roles` (`idRol`),
  CONSTRAINT `FK_usuarios_roles` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd.usuarios: ~2 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `idRol`, `password`) VALUES
	(1, 'juan', 1, 'admin'),
	(2, 'elmer', 1, 'secret');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla bd.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idcliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ventas_clientes` (`idcliente`),
  CONSTRAINT `FK_ventas_clientes` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd.ventas: ~0 rows (aproximadamente)
DELETE FROM `ventas`;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id`, `fecha`, `idcliente`) VALUES
	(1, '2019-07-14', 1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
