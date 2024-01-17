# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Base de datos: soporte-tecnico
# Tiempo de Generación: 2024-01-15 17:47:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '1= admin, 2= staff,3= customer',
  `ticket_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `receptions_comments` text,
  `receptios_status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `user_id`, `user_type`, `ticket_id`, `comment`, `date_created`, `receptions_comments`, `receptios_status`)
VALUES
	(1,1,1,1,'&lt;p&gt;Sample Comment only&lt;/p&gt; ','2020-11-09 14:52:16',NULL,NULL),
	(3,2,3,1,'&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;','2020-11-09 15:36:56',NULL,NULL),
	(4,2,2,2,'&lt;p&gt;Se arregla la computadora efectivamente.&lt;/p&gt;','2023-09-03 20:45:31',NULL,NULL);

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(600) DEFAULT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `avatar` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `username`, `password`, `date_created`, `date_updated`, `last_login`, `avatar`)
VALUES
	(1,'Samir','Cliente','','3059876451','Calle 34 24 15','scliente@cweb.com',NULL,'4b67deeb9aba04a5b54632ad19934f26','2020-11-09 10:24:42','0000-00-00 00:00:00',NULL,NULL),
	(2,'Daniel','Cliente','','3251649781','Calle 23 13 12','dcliente@cweb.com',NULL,'4b67deeb9aba04a5b54632ad19934f26','2020-11-09 10:48:30','0000-00-00 00:00:00',NULL,NULL),
	(3,'Juan','Cliente','','3025679874','Calle ','jcliente@cweb.com',NULL,'4b67deeb9aba04a5b54632ad19934f26','2023-09-03 20:35:59','0000-00-00 00:00:00',NULL,NULL),
	(4,'Juan','Usuario','','','','','jusuario@cweb.com','4b67deeb9aba04a5b54632ad19934f26','2021-05-10 23:23:35','2021-07-04 17:49:15',NULL,NULL);

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla departments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;

INSERT INTO `departments` (`id`, `name`, `description`, `date_created`)
VALUES
	(1,'Tecnología','Tecnologías de la Información','2020-11-09 11:43:18'),
	(2,'Gestion de Red','Gestión de Infraesctructura','2020-11-09 11:44:08'),
	(3,'Seguridad Informática','Seguridad Informática','2020-11-09 11:44:41');

/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_acquisition_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_acquisition_type`;

CREATE TABLE `equipment_acquisition_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_acquisition_type` WRITE;
/*!40000 ALTER TABLE `equipment_acquisition_type` DISABLE KEYS */;

INSERT INTO `equipment_acquisition_type` (`id`, `name`)
VALUES
	(1,'1'),
	(2,'2');

/*!40000 ALTER TABLE `equipment_acquisition_type` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_control_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_control_documents`;

CREATE TABLE `equipment_control_documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) unsigned NOT NULL,
  `invoice` varchar(255) NOT NULL DEFAULT '',
  `bailment_file` varchar(255) DEFAULT NULL,
  `contract_file` varchar(255) DEFAULT NULL,
  `usermanual_file` varchar(255) DEFAULT NULL,
  `fast_guide_file` varchar(255) DEFAULT NULL,
  `datasheet_file` varchar(255) DEFAULT NULL,
  `servicemanual_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `equipment_control_documents_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_control_documents` WRITE;
/*!40000 ALTER TABLE `equipment_control_documents` DISABLE KEYS */;

INSERT INTO `equipment_control_documents` (`id`, `equipment_id`, `invoice`, `bailment_file`, `contract_file`, `usermanual_file`, `fast_guide_file`, `datasheet_file`, `servicemanual_file`)
VALUES
	(1,21,'1234','uploads/logo.png','uploads/empleado.jpg','uploads/pensionado.jpg','uploads/pensionado.jpg','uploads/Carta Laboral  copia.pdf','uploads/Prestamo_DANIEL_QUIROZ.pdf'),
	(2,30,'10','uploads/Documento de explicacion_software.pdf','uploads/Campos+Clientes+BD+Centro+Ch%C3%ADa+-+WEB_Hoja1.A1_I24.pdf',NULL,NULL,NULL,NULL),
	(3,31,'1234',NULL,NULL,NULL,NULL,NULL,NULL),
	(4,32,'1234',NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `equipment_control_documents` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_delivery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_delivery`;

CREATE TABLE `equipment_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) unsigned NOT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `location_id` int(11) unsigned DEFAULT NULL,
  `responsible_name` varchar(255) DEFAULT NULL,
  `responsible_position` int(11) unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `date_training` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_id` (`equipment_id`),
  KEY `department_id` (`department_id`),
  KEY `location_id` (`location_id`),
  KEY `responsible_position` (`responsible_position`),
  CONSTRAINT `equipment_delivery_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipment_delivery_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `equipment_deparments` (`id`),
  CONSTRAINT `equipment_delivery_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `equipment_locations` (`id`),
  CONSTRAINT `equipment_delivery_ibfk_4` FOREIGN KEY (`responsible_position`) REFERENCES `equipment_responsible_positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_delivery` WRITE;
/*!40000 ALTER TABLE `equipment_delivery` DISABLE KEYS */;

INSERT INTO `equipment_delivery` (`id`, `equipment_id`, `department_id`, `location_id`, `responsible_name`, `responsible_position`, `date`, `date_training`)
VALUES
	(8,20,1,1,'daniel quiroz',1,'2023-10-31 00:00:00',NULL),
	(9,21,1,1,'daniel quiroz',1,'2023-10-31 00:00:00','2023-11-07 00:00:00'),
	(12,30,2,2,'10',2,'2023-11-10 00:00:00','2023-11-10 00:00:00'),
	(13,31,1,1,'1234',1,'2023-11-23 00:00:00','2023-11-23 00:00:00'),
	(14,32,1,1,'1234',1,'2023-11-23 00:00:00','2023-11-23 00:00:00');

/*!40000 ALTER TABLE `equipment_delivery` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_deparments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_deparments`;

CREATE TABLE `equipment_deparments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_deparments` WRITE;
/*!40000 ALTER TABLE `equipment_deparments` DISABLE KEYS */;

INSERT INTO `equipment_deparments` (`id`, `name`)
VALUES
	(1,'Recepción'),
	(2,'Almacen');

/*!40000 ALTER TABLE `equipment_deparments` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_locations`;

CREATE TABLE `equipment_locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_locations` WRITE;
/*!40000 ALTER TABLE `equipment_locations` DISABLE KEYS */;

INSERT INTO `equipment_locations` (`id`, `name`)
VALUES
	(1,'ALMACEN'),
	(2,'BODEGA');

/*!40000 ALTER TABLE `equipment_locations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_reception
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_reception`;

CREATE TABLE `equipment_reception` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) unsigned DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `equipment_reception_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_reception` WRITE;
/*!40000 ALTER TABLE `equipment_reception` DISABLE KEYS */;

INSERT INTO `equipment_reception` (`id`, `equipment_id`, `state`, `comments`)
VALUES
	(1,11,1,'adadasda		'),
	(2,12,0,'notas 2'),
	(3,13,1,' notas\r\n							'),
	(4,14,1,' asdasd\r\n							'),
	(5,15,1,' asdasda							'),
	(6,16,1,' asdasda							'),
	(7,17,1,' asdasda							'),
	(8,18,1,' asdasda							'),
	(9,19,1,' asdasda							'),
	(10,20,1,' asdasda							'),
	(11,21,1,' \r\n							 \r\n							 \r\n							SDASDA																					'),
	(15,30,1,'10'),
	(16,31,1,'1234							'),
	(17,32,1,' 1234');

/*!40000 ALTER TABLE `equipment_reception` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_responsible_positions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_responsible_positions`;

CREATE TABLE `equipment_responsible_positions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_responsible_positions` WRITE;
/*!40000 ALTER TABLE `equipment_responsible_positions` DISABLE KEYS */;

INSERT INTO `equipment_responsible_positions` (`id`, `name`)
VALUES
	(1,'Supervisor Almacen'),
	(2,'Supervisor Bodega');

/*!40000 ALTER TABLE `equipment_responsible_positions` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_revision
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_revision`;

CREATE TABLE `equipment_revision` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) DEFAULT NULL,
  `date_revision` date DEFAULT NULL,
  `frecuencia` int(11) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_revision` WRITE;
/*!40000 ALTER TABLE `equipment_revision` DISABLE KEYS */;

INSERT INTO `equipment_revision` (`id`, `equipment_id`, `date_revision`, `frecuencia`, `comments`)
VALUES
	(1,32,'2023-12-06',7,NULL);

/*!40000 ALTER TABLE `equipment_revision` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_safeguard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_safeguard`;

CREATE TABLE `equipment_safeguard` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) unsigned NOT NULL,
  `rfc_id` int(11) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `warranty_time` int(11) DEFAULT NULL,
  `date_adquisition` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `equipment_safeguard_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_safeguard` WRITE;
/*!40000 ALTER TABLE `equipment_safeguard` DISABLE KEYS */;

INSERT INTO `equipment_safeguard` (`id`, `equipment_id`, `rfc_id`, `business_name`, `phone`, `email`, `warranty_time`, `date_adquisition`)
VALUES
	(1,21,1,'daniel reason',2345678,'xxx@xxx.com',3,'2023-11-09 00:00:00'),
	(4,30,2,'10',1010101010,'10101@1010.com',10,'2023-11-10 00:00:00'),
	(5,31,1,'1234',1234,'1234@ 1234.com',1,'2023-11-23 00:00:00'),
	(6,32,1,'1234',1234,'1234@ 1234.com',1,'2023-11-23 00:00:00');

/*!40000 ALTER TABLE `equipment_safeguard` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_unsubscribe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_unsubscribe`;

CREATE TABLE `equipment_unsubscribe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `withdrawal_reason` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(600) DEFAULT NULL,
  `comments` varchar(600) DEFAULT NULL,
  `opinion` tinyint(1) DEFAULT NULL,
  `destination` int(11) DEFAULT NULL,
  `responsible` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_unsubscribe` WRITE;
/*!40000 ALTER TABLE `equipment_unsubscribe` DISABLE KEYS */;

INSERT INTO `equipment_unsubscribe` (`id`, `date`, `equipment_id`, `withdrawal_reason`, `description`, `comments`, `opinion`, `destination`, `responsible`)
VALUES
	(1,'2023-11-20',30,'[\"1\",\"2\",\"3\",\"4\",\"5\",\"7\",\"9\",\"11\"]','descripcion 1, mas descripciones','comentarios 1, y mas comentarios',0,5,2);

/*!40000 ALTER TABLE `equipment_unsubscribe` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipment_withdrawal_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipment_withdrawal_reason`;

CREATE TABLE `equipment_withdrawal_reason` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipment_withdrawal_reason` WRITE;
/*!40000 ALTER TABLE `equipment_withdrawal_reason` DISABLE KEYS */;

INSERT INTO `equipment_withdrawal_reason` (`id`, `name`)
VALUES
	(1,'No existen accesorios/refacciones en el mercado'),
	(2,'No existen consumibles en el mercado'),
	(3,'Entrega de archivo documental a contabilidad'),
	(4,'Retiro por el proveedor'),
	(5,'El equipo es obsoleto'),
	(6,'El equipo es irreparable'),
	(7,'El equipo no es útil en el área'),
	(8,'Disfuncional'),
	(9,'El equipo es inseguro'),
	(10,'Mantenimiento Preventivo'),
	(11,'Costo de reparación mayor al 40%'),
	(12,'Equipo en préstamo');

/*!40000 ALTER TABLE `equipment_withdrawal_reason` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla equipments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `equipments`;

CREATE TABLE `equipments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number_inventory` varchar(255) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `brand` varchar(255) NOT NULL DEFAULT '',
  `model` varchar(255) NOT NULL DEFAULT '',
  `acquisition_type` int(11) unsigned NOT NULL,
  `mandate_period` int(11) NOT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `discipline` varchar(255) DEFAULT NULL,
  `characteristics` text,
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acquisition_type` (`acquisition_type`),
  CONSTRAINT `equipments_ibfk_1` FOREIGN KEY (`acquisition_type`) REFERENCES `equipment_acquisition_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;

INSERT INTO `equipments` (`id`, `number_inventory`, `serie`, `date_created`, `name`, `brand`, `model`, `acquisition_type`, `mandate_period`, `amount`, `discipline`, `characteristics`, `revision`)
VALUES
	(2,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(3,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(4,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(5,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(6,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(7,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(8,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(9,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(10,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(11,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(12,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(13,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(14,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(15,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(16,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(17,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(18,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(19,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(20,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(21,NULL,NULL,'2023-10-31 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(22,NULL,NULL,'2023-11-09 00:00:00','soporte-tecnico','marca1','2020',1,1,NULL,NULL,NULL,NULL),
	(30,'1234','2223333ssdd','2023-11-09 00:00:00','10','10','10',1,2,30000.00,NULL,NULL,NULL),
	(31,'1234','1234','2023-01-10 00:00:00','1234','1234','1234',1,1,100000.00,'1234','123',1),
	(32,'1234','1234','2023-07-10 00:00:00','1234','1234','1234',1,1,1234.00,'1234',' 1234',1);

/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla quote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quote`;

CREATE TABLE `quote` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `service_ids` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;

INSERT INTO `quote` (`id`, `email`, `service_ids`, `date_created`)
VALUES
	(1,'jusuario@cweb.com','3,4,2','2021-05-11 01:08:50');

/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla reporte_frecuencia_anual
# ------------------------------------------------------------

DROP VIEW IF EXISTS `reporte_frecuencia_anual`;

CREATE TABLE `reporte_frecuencia_anual` (
   `equipo_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `disciplina` VARCHAR(255) NULL DEFAULT NULL,
   `encargado` VARCHAR(255) NULL DEFAULT NULL,
   `marca` VARCHAR(255) NOT NULL DEFAULT '',
   `caracteristicas` TEXT NULL DEFAULT NULL,
   `inventario` VARCHAR(255) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Volcado de tabla services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_id` int(30) NOT NULL,
  `service` text,
  `description` text,
  `img_path` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;

INSERT INTO `services` (`id`, `category_id`, `service`, `description`, `img_path`)
VALUES
	(2,2,'Re aprovisionamiento de dispositivos','Se reconfiguran dispositivos a su versión de fábrica y se optimizan para procesos específicos','uploads/services/2_img.png'),
	(3,1,'Actualización de Sistema Operativo','Actualización y versionamiento de sistema operativo de Windows','uploads/services/3_img.jpg'),
	(4,1,'Actualización de Sistemas Operativos IOS','Se optimiza la configuración de teléfonos y portátiles MAC','uploads/services/4_img.png');

/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla services_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services_category`;

CREATE TABLE `services_category` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category` text,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `services_category` WRITE;
/*!40000 ALTER TABLE `services_category` DISABLE KEYS */;

INSERT INTO `services_category` (`id`, `category`, `description`)
VALUES
	(1,'Actualizaciones','Se actualizan sistemas operativos, Windows, Android o IOS'),
	(2,'Puesta a punto de dispositivos','Se aprovisionan dispositivos en Microsoft Windows, Android y IOS'),
	(3,'nueva categoria','nueva categoria'),
	(4,'nueva categoria 2','nueva categoria 2');

/*!40000 ALTER TABLE `services_category` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla staff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `department_id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;

INSERT INTO `staff` (`id`, `department_id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `date_created`)
VALUES
	(1,3,'Daniel','Empleado','','3062589471','Calle 54 09 20','dempleado@cweb.com','4b67deeb9aba04a5b54632ad19934f26','2020-11-09 11:59:01'),
	(2,1,'Juan','Empleado','','3025897412','Calle 98 67 54','jempleado@cweb.com','4b67deeb9aba04a5b54632ad19934f26','2023-09-03 20:39:20');

/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla system_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_info`;

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `system_info` WRITE;
/*!40000 ALTER TABLE `system_info` DISABLE KEYS */;

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`)
VALUES
	(1,'name','Sistema de Tickets'),
	(4,'intro','Hi! I&apos;m Johnny, a ChatBot of this application. How can I help you?'),
	(6,'short_name','Ticlets'),
	(10,'no_result','I am sorry. I can&apos;t understand your question. Please rephrase your question and make sure it is related to this site. Thank you :)'),
	(11,'logo','uploads/1625709600_tech-support-icon-png-0.jpg'),
	(12,'bot_avatar','uploads/bot_avatar.png'),
	(13,'user_avatar','uploads/user_avatar.jpg'),
	(14,'welcome_message','');

/*!40000 ALTER TABLE `system_info` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ticket_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ticket_comment`;

CREATE TABLE `ticket_comment` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(30) NOT NULL,
  `comment` text,
  `user_id` varchar(30) NOT NULL,
  `user_created` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `ticket_comment` WRITE;
/*!40000 ALTER TABLE `ticket_comment` DISABLE KEYS */;

INSERT INTO `ticket_comment` (`id`, `ticket_id`, `comment`, `user_id`, `user_created`, `date_created`)
VALUES
	(2,1,'Necesito me ayuden en lo posible para solucionar mi inconveniente','-1','admin','2021-05-10 16:36:21'),
	(4,1,'Necesito se le de solución al inconveniente cuanto antes','-1','admin','2021-05-10 21:55:34'),
	(5,4,'Requiero que el fallo sea resuelto el día de hoy','1','user','2021-05-10 23:55:39'),
	(6,4,'Estoy disponible por cualquier duda que tengan','1','admin','2021-05-11 00:02:06'),
	(7,4,'Estamos trabajando para darles solución a su requerimientos','1','admin','2021-07-04 18:18:10'),
	(8,4,'Muchas gracias, favor me avisan en cuanto resuelvan el inconveniente, quedo al pendiente, me urge','1','user','2021-07-04 18:19:51'),
	(9,4,'Se ha resuelto el fallo a satisfacción !!','1','admin','2021-07-04 18:33:10');

/*!40000 ALTER TABLE `ticket_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tickets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `subject` text,
  `description` text,
  `status` tinyint(1) DEFAULT NULL COMMENT '0=Pending,1=on process,2= Closed',
  `service_id` int(11) DEFAULT NULL,
  `department_id` int(30) DEFAULT NULL,
  `customer_id` int(30) DEFAULT NULL,
  `staff_id` int(30) DEFAULT NULL,
  `admin_id` int(30) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `title` text,
  `user_id` int(11) DEFAULT NULL,
  `user_created` varchar(255) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;

INSERT INTO `tickets` (`id`, `subject`, `description`, `status`, `service_id`, `department_id`, `customer_id`, `staff_id`, `admin_id`, `date_created`, `date_updated`, `title`, `user_id`, `user_created`)
VALUES
	(1,'Fallos con la pantalla del dispositivo','Hubo un inconveniente con la resoluci&oacute;n de mi pantalla, y ahora se queda suspendida y me toca apagar el equipo.',1,NULL,1,2,1,1,'2020-11-09 13:44:43',NULL,'',NULL,'2023-10-22 19:55:39'),
	(2,'Ayuda con mi Laptopr','&lt;p&gt;Hola, estimados, para informarlos que desde hace un par de semanas mi laptop no enciende no hab&iacute;a avisado porque me encontraba en periodo de vacaciones.&lt;/p&gt;',2,NULL,1,3,2,0,'2023-09-03 20:42:57',NULL,'',NULL,'2023-10-22 19:55:39'),
	(5,'','<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Enciendo el ordenador tengo acceso a Internet pero no llamadas.</p>',2,2,0,0,0,0,'2021-05-10 13:59:54','2021-07-04 18:26:06','Mi teléfono no recibe llamadas',1,'0000-00-00 00:00:00'),
	(6,'','<p>El dispositivo no pasa del inicio</p>',2,3,0,0,0,0,'2021-05-10 23:38:52','2021-07-04 18:33:15','Solicito ayuda con mi ordenador',1,'0000-00-00 00:00:00'),
	(7,NULL,'<p>pruebas</p>',NULL,3,NULL,NULL,NULL,NULL,'2023-10-23 15:59:33','2023-10-23 15:59:33','pruebas',1,'admin');

/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1 = Admin,2=support',
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `role`, `username`, `password`, `date_created`)
VALUES
	(1,'Mauricio','','Sevilla',1,'configuroweb','4b67deeb9aba04a5b54632ad19934f26',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;




# Replace placeholder table for reporte_frecuencia_anual with correct view syntax
# ------------------------------------------------------------

DROP TABLE `reporte_frecuencia_anual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reporte_frecuencia_anual`
AS SELECT
   `e`.`id` AS `equipo_id`,
   `e`.`discipline` AS `disciplina`,
   `d`.`responsible_name` AS `encargado`,
   `e`.`brand` AS `marca`,
   `e`.`characteristics` AS `caracteristicas`,
   `e`.`number_inventory` AS `inventario`
FROM (`equipments` `e` join `equipment_delivery` `d` on((`d`.`equipment_id` = `e`.`id`)));

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
