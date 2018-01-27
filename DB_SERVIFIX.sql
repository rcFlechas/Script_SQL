-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: servifix
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_servicio`
--

DROP TABLE IF EXISTS `categoria_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_servicio` (
  `id_categoria_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria_servicio` varchar(50) NOT NULL,
  `descripcion_categoria_servicio` varchar(200) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria_servicio`),
  KEY `categoriaServicio_estado_fk_idx` (`id_estado`),
  CONSTRAINT `categoriaServicio_estado_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_servicio`
--

LOCK TABLES `categoria_servicio` WRITE;
/*!40000 ALTER TABLE `categoria_servicio` DISABLE KEYS */;
INSERT INTO `categoria_servicio` VALUES (1,'PYMES',NULL,'2017-06-29 06:14:30','2017-06-29 06:14:30',1),(2,'HOGARES',NULL,'2017-06-29 06:14:41','2017-06-29 06:14:41',1),(3,'OTRO',NULL,'2017-06-29 06:14:41','2017-06-29 06:14:41',1);
/*!40000 ALTER TABLE `categoria_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `documento_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `direccion_cliente` varchar(100) NOT NULL,
  `telefono_cliente` varchar(20) NOT NULL,
  `email_cliente` varchar(100) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`documento_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1090404246,'RENZON ALIRIO CACERES FLECHAS','CALLE 26','3175542950','renzon_06@hotmail.com','2017-07-09 01:30:30','2017-07-09 01:30:30'),(1090404247,'RENZON ALIRIO CACERES FLECHAS','CALLE 26','3175542950','','2017-07-13 03:57:09','2017-07-13 03:57:09');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'ACTVIO'),(2,'INACTIVO');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `documento_persona` int(11) NOT NULL,
  `nombres_persona` varchar(50) NOT NULL,
  `apellidos_persona` varchar(50) NOT NULL,
  `telefono_persona` varchar(20) NOT NULL DEFAULT 'NA',
  `celular_persona` varchar(20) NOT NULL,
  `direccion_persona` varchar(100) NOT NULL,
  `email_persona` varchar(100) NOT NULL,
  `foto_persona` varchar(100) NOT NULL DEFAULT 'colocar imagen por defecto',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`documento_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (2,'RENZON ALIRIO ','CACERES FLECHAS','NA','3175542950','CALLE 26','renzon_06@hotmail.com','colocar imagen por defecto','2017-07-11 05:24:51','2017-07-11 05:24:51'),(3,'RENZON ALIRIO ','DUARTE','NA','3175542950','CALLE 26','renzon_06@hotmail.com','colocar imagen por defecto','2017-07-11 05:27:59','2017-07-11 05:27:59'),(999,'RENZON ALIRIO ','CACERES FLECHAS','NA','3175542950','CALLE 26','renzon_06@hotmail.com','colocar imagen por defecto','2017-07-14 07:11:22','2017-07-14 07:11:22'),(7000,'RENZON ALIRIO ','CACERES FLECHAS','NA','3175542950','CALLE 26','renzon_06@hotmail.com','colocar imagen por defecto','2017-07-12 01:00:29','2017-07-12 01:00:29'),(1111111,'RENZON ALIRIO CACERES FLECHAS','CACERES FLECHAS','NA','3175542950','CALLE 26','renzon_06@hotmail.com','colocar imagen por defecto','2017-07-12 01:17:26','2017-07-12 01:17:26'),(88226044,'JHON JAIRO DUARTE','DUARTE','NA','3142412408','TORRE LOS LIBERTADORES APTO 201 ALMEIDAS ','jhonny.jdt18@gmail.com','colocar imagen por defecto','2017-07-09 01:22:01','2017-07-09 01:22:01'),(1090404246,'RENZON ALIRIO ','CACERES FLECHAS','NA','3175542950','CALLE 26','renzon_06@hotmail.com','colocar imagen por defecto','2017-07-09 01:18:32','2017-07-09 01:18:32'),(1090444444,'ANDRÉS LEONARDO ','CACERES FLECHAS','NA','3175542950','CALLE 26','renzon_06@hotmail.com','colocar imagen por defecto','2017-07-21 22:19:07','2017-07-21 22:19:07');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesion` (
  `id_profesion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(50) NOT NULL,
  `descripcion_profesion` varchar(200) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES (1,'TECNICO ELECTRICISTA',NULL,'2017-07-06 05:15:02','2017-07-06 05:15:02'),(2,'TECNICO MECATRONICO',NULL,'2017-07-06 05:15:02','2017-07-06 05:15:02'),(3,'TECNICO DE SISTEMAS',NULL,'2017-07-06 05:15:02','2017-07-06 05:15:02'),(4,'TECNICO EN REFRIGERACION',NULL,'2017-07-06 05:15:02','2017-07-06 05:15:02');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion_rol` varchar(200) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMINISTRADOR',NULL,'2017-07-06 05:09:39','2017-07-06 05:09:39'),(2,'TECNICO',NULL,'2017-07-06 05:09:58','2017-07-06 05:09:58');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(50) NOT NULL,
  `descripcion_servicio` varchar(200) DEFAULT NULL,
  `imagen_servicio` varchar(100) NOT NULL DEFAULT 'ruta de imagen por defecto',
  `id_subcategoria_servicio` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_servicio`),
  KEY `servicio_categoriaServicio_idx` (`id_subcategoria_servicio`),
  KEY `servicio_estado_idx` (`id_estado`),
  CONSTRAINT `servicio_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `servicio_subcategoria` FOREIGN KEY (`id_subcategoria_servicio`) REFERENCES `subcategoria_servicio` (`id_subcategoria_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'FUSIBLES ELECTRICOS','Realice el cambio o la instalación de tus fusible con ServiFix, utilizando profesionales debidamente seleccionados.','recursos/img/thumbnail/electricidad/cambio_fusible.jpg',7,'2017-06-30 02:04:21','2017-06-30 02:04:21',1),(2,'COCINA ELECTRICA','Realice la instalación de su cocina eléctrica con un electricistas matriculados y verificado por ServiFix. Trabajo con garantía.','recursos/img/thumbnail/electricidad/instalacion_cocina_electrica.jpg',7,'2017-06-30 02:11:38','2017-06-30 02:11:38',1),(3,'HORNO ELECTRICO','Realice la instalación de tu horno eléctrico con ServiFix, utilizando únicamente electricistas matriculados. Nuestro servicio de instalación de horno eléctrico consta con garantía.','recursos/img/thumbnail/electricidad/instalacion_horno_electrico.jpg',7,'2017-06-30 02:14:37','2017-06-30 02:14:37',1),(4,'TOMACORRIENTES','Realice el cambio o la instalación de tus tomacorrientes con ServiFix, utilizando profesionales debidamente seleccionados.','recursos/img/thumbnail/electricidad/cambio_tomacorrientes.jpg',7,'2017-06-30 02:19:57','2017-06-30 02:19:57',1),(5,'FORMATEAR','Formatee o actualice el sistema operativo de tu equipo con ServiFix, utilizando profesionales debidamente seleccionados.','recursos/img/thumbnail/computo/formatear.jpg',8,'2017-06-30 02:25:46','2017-06-30 02:25:46',1),(6,'INSTALAR PROGRAMAS','Instalación de programas varios como antivirus, procesadores de texto, exploradores de internet y todo software solicitado por el cliente. ','recursos/img/thumbnail/computo/instalar_3.jpg',8,'2017-06-30 03:29:01','2017-06-30 03:29:01',1),(7,'REVISION GENERAL','Realizamos un analisis general del rendimiento de su equipo, escaneando y eliminando virus y archivos innecesarios para optimizar el rendimiento.','recursos/img/thumbnail/computo/revicion.jpg',8,'2017-06-30 03:38:24','2017-06-30 03:38:24',1),(8,'MANTENIMIENTO','Mantenimiento preventivo y correctivo del hardware de su equipo. Instalacion de memoria RAM, disco duro, tarjetas inalambricas...','recursos/img/thumbnail/computo/mantenimiento.jpg',8,'2017-06-30 03:43:31','2017-06-30 03:43:31',1),(9,'AIRES ACONDICIONADOS','Somos especializados en todos los Servicios de AIRES ACONDICIONADOS: Realizamos Instalaciones, Mantenimientos preventivos y correctivos, cargas de gas, reparaciones...','recursos/img/thumbnail/electrodomesticos/aires_acondicionado.jpg',9,'2017-06-30 03:49:01','2017-06-30 03:49:01',1),(10,'NEVERAS','Somos especializados en todos los Servicios de NEVERAS: Realizamos Instalaciones, Mantenimientos preventivos y correctivos, cargas de gas, reparaciones...','recursos/img/thumbnail/electrodomesticos/nevera_2.jpg',9,'2017-06-30 03:59:43','2017-06-30 03:59:43',1),(11,'LAVADORAS','Somos especializados en todos los Servicios de LAVADORAS: Realizamos Instalaciones, Mantenimientos preventivos y correctivos,  reparaciones...','recursos/img/thumbnail/electrodomesticos/lavadora2.jpg',9,'2017-06-30 04:09:06','2017-06-30 04:09:06',1),(12,'SISTEMAS OPERATIVOS','Formatee o actualice el sistema operativo de tu equipo con ServiFix, utilizando profesionales debidamente seleccionados.','recursos/img/thumbnail/computo/software_2.jpg',3,'2017-06-30 04:30:49','2017-06-30 04:30:49',1),(13,'FOTOCOPIADORAS / IMPRESORAS','Somos especializados en todos los Servicios para FOTOCOPIADORAS / IMPRESORAS: Reparación, mantenimiento e instalación de fotocopiadoras, impresoras / scanner...','recursos/img/thumbnail/computo/impresora.jpg',3,'2017-06-30 04:34:35','2017-06-30 04:34:35',1),(14,'COMPUTADORES','Somos especializados en todos los Servicios para COMPUTADORES: Mantenimiento preventivo y correctivo del hardware de su equipo. Instalacion de memoria RAM, disco duro...','recursos/img/thumbnail/computo/computo_2.jpg',3,'2017-06-30 04:38:55','2017-06-30 04:38:55',1),(15,'AIRES ACONDICIONADOS','Somos especializados en todos los Servicios de AIRES ACONDICIONADOS: Realizamos Instalaciones, Mantenimientos preventivos y correctivos, cargas de gas, reparaciones...','recursos/img/thumbnail/refrigeracion/aires_acondicionado.jpg',2,'2017-06-30 04:42:31','2017-06-30 04:42:31',1),(16,'CUARTOS FRIOS','Somos especializados en todos los Servicios de CUARTOS FRIOS: Realizamos Instalaciones, Mantenimientos preventivos y correctivos, cargas de gas, reparaciones...','recursos/img/thumbnail/refrigeracion/cuarto_frio.jpg',2,'2017-06-30 04:46:43','2017-06-30 04:46:43',1),(17,'ENFRIADORES COMERCIALES','Somos especializados en todos los Servicios de ENFRIADORES COMERCIALES: Realizamos Instalaciones, Mantenimientos preventivos y correctivos, cargas de gas, reparaciones...','recursos/img/thumbnail/refrigeracion/nevera_industrial.jpg',2,'2017-06-30 04:46:43','2017-06-30 04:46:43',1),(18,'DIAGNOSTICO','Visita, asesoramiento y presupuesto de reparación de Electricidad. Recibe a un técnico en tu domicilio para que confeccione un presupuesto a medida de lo que necesitás.','recursos/img/thumbnail/electricidad/diagnostico.jpg',7,'2017-07-04 04:47:50','2017-07-04 04:47:50',1),(19,'INSTALACION ELECTRICA','Somos especializados en todos los Servicios de ELÉCTRICIDAD: Instalacion, traslado y cambio del servicio eléctrico de tu hogar.','recursos/img/thumbnail/electricidad/instalacion.jpg',7,'2017-07-04 05:08:40','2017-07-04 05:08:40',1),(20,'LUMINARIAS','Somos especializados en todos los Servicios de ELÉCTRICIDAD: Cambio e instalación de lamparas, bombillas, luces led y cualquier artefacto lumínico.','recursos/img/thumbnail/electricidad/luminaria.jpg',7,'2017-07-04 05:42:00','2017-07-04 05:42:00',1),(21,'VENTILADORES','Somos especializados en todos los Servicios de ELÉCTRICIDAD: Instalación de ventelidaores de pared o techo y extractores de calor.','recursos/img/thumbnail/electricidad/ventilador.jpg',7,'2017-07-04 05:50:34','2017-07-04 05:50:34',1),(22,'APAGADORES','Somos especializados en todos los Servicios de ELÉCTRICIDAD: Cambio e instalación de apagadores de luz.','recursos/img/thumbnail/electricidad/apagador.jpg',7,'2017-07-04 06:01:18','2017-07-04 06:01:18',1),(23,'RED WIFI','Somos especializados en todos los Servicios de COMPUTO: Instalación de red cableada y WIFI.','recursos/img/thumbnail/computo/wifi.jpg',8,'2017-07-04 06:12:03','2017-07-04 06:12:03',1),(24,'IMPRESORAS / SCANNERS','Somos especializados en todos los Servicios de COMPUTO: Intalación y reparación de impresoras y scanners.','recursos/img/thumbnail/computo/impresora.jpg',8,'2017-07-04 06:15:15','2017-07-04 06:15:15',1),(25,'INSTALACION ELECTRICA','Somos especializados en todos los Servicios de ELÉCTRICIDAD: Instalacion, traslado y cambio del servicios monofásico, bifásico y trifásicos .','recursos/img/thumbnail/electricidad/instalacion.jpg',1,'2017-07-05 02:56:13','2017-07-05 02:56:13',1),(26,'TABLERO DE CONTROL','Somos especializados en todos los Servicios de ELÉCTRICIDAD: Diseño e interpretación de planos eléctricos y cudros de carga.','recursos/img/thumbnail/electricidad/tableros_electricos.jpg',1,'2017-07-05 03:10:06','2017-07-05 03:10:06',1),(27,'INSTALACIÓN PUNTOS ELÉCTRICOS','Somos especializados en todos los Servicios de ELÉCTRICIDAD: Instalación o traslados de tomas electricos.','recursos/img/thumbnail/electricidad/cambio_tomacorrientes.jpg',1,'2017-07-05 04:00:02','2017-07-05 04:00:02',1),(28,'FUSIBLES ELECTRICOS','Realice el cambio o la instalación de tus fusible con ServiFix, utilizando profesionales debidamente seleccionados.','recursos/img/thumbnail/electricidad/cambio_fusible.jpg',1,'2017-07-05 04:27:10','2017-07-05 04:27:10',1),(29,'SISTEMAS IDUSTRIALES','Mantenimiento preventivo y correctivo de sistemas mecanicos, hidráulicos, neumáticos, electromecánico de maquinaria en general.','recursos/img/thumbnail/mecanica_industrial/sistema_industrial.jpg',4,'2017-07-05 04:48:52','2017-07-05 04:48:52',1),(30,'SOLDADURA','Servicio completo de instalación y mantenimiento en estructuras, tuberías e instalaciones en general de acuerdo a disposición de nuestros clientes.','recursos/img/thumbnail/mecanica_industrial/soldador.jpg',4,'2017-07-05 05:07:25','2017-07-05 05:07:25',1),(31,'SISTEMAS INALAMBRICOS Y CONEXIONES','Diseño y montaje de cableado estructurado, sistemas inalámbricos y conexiones.','recursos/img/thumbnail/telecomunicaciones/conexiones.jpg',6,'2017-07-05 05:21:23','2017-07-05 05:21:23',1),(32,'MAQUINARIA INDUSTRIAL','Desmonte total o parcial de máquinas o equipos, interpretación de planos y catálogos para su mantenimiento o reparación.','recursos/img/thumbnail/mecanica_industrial/maquinaria_industrial2.jpg',4,'2017-07-06 02:54:38','2017-07-06 02:54:38',1),(33,'SISTEMAS ELECTRONICOS','Diseño, fabricación, reconstrucción  o reemplazo de circuitos o sistemas electrónicos. Análisis de fallas electrónicas con el fin de proyectar y adaptar rediseños que mejoren el sistema.','recursos/img/thumbnail/electronica/sistema_electronico.jpg',5,'2017-07-06 03:10:29','2017-07-06 03:10:29',1),(34,'CIRCUITOS ELECTRONICOS','Inspección, mantenimiento, prevención y detección de fallas en circuitos electrónicos que comprometan el funcionamiento y desempeño del sistema o procesos.','recursos/img/thumbnail/electronica/circuitos_electronicos.jpg',5,'2017-07-06 03:24:41','2017-07-06 03:24:41',1),(35,'ARDUINO','Desarrollo y programación de sistemas embebidos (Arduino) de acuerdo con especificaciones técnicas.','recursos/img/thumbnail/electronica/arduino.jpg',5,'2017-07-06 03:28:18','2017-07-06 03:28:18',1),(36,'SISTEMA DE AUDIO','Instalación y calibración de sistemas de audio. Operario de sonido en eventos de banda musical en vivo.','recursos/img/thumbnail/electronica/sistema_audio.jpg',5,'2017-07-06 03:45:42','2017-07-06 03:45:42',1),(37,'MEZCLADORA DE AUDIO','Mantenimiento y reparación de mezcladora de audio análoga ó digital, cables de audio, micrófonos inhalambricos y amplificadores.','recursos/img/thumbnail/electronica/mezcladora_audio.jpg',5,'2017-07-06 03:53:05','2017-07-06 03:53:05',1),(38,'SISTEMAS DE SEGURIDAD','Con equipos y sistemas de última tecnología, diseñamos e implementamos la seguridad de nuestros clientes de acuerdo a sus necesidades.','recursos/img/thumbnail/telecomunicaciones/sistema_seguridad.jpg',6,'2017-07-06 04:11:28','2017-07-06 04:11:28',1),(39,'CAMARAS DE SEGURIDAD','Instalación de camaras de seguridad y circuito cerrado de TV, DVRS, monitores y camaras IP. Configuración para su correcta visualización en PC, tablet o movil.','recursos/img/thumbnail/telecomunicaciones/camara_seguridad.jpg',6,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(40,'OTRO','OTRO','OTRO',1,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(41,'OTRO','OTRO','OTRO',2,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(42,'OTRO','OTRO','OTRO',3,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(43,'OTRO','OTRO','OTRO',4,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(44,'OTRO','OTRO','OTRO',5,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(45,'OTRO','OTRO','OTRO',6,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(46,'OTRO','OTRO','OTRO',7,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(47,'OTRO','OTRO','OTRO',8,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(48,'OTRO','OTRO','OTRO',9,'2017-07-06 04:33:01','2017-07-06 04:33:01',1),(49,'OTRO','OTRO','OTRO',10,'2017-07-06 04:33:01','2017-07-06 04:33:01',1);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_servicio`
--

DROP TABLE IF EXISTS `solicitud_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_servicio` (
  `id_solicitud_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `documento_cliente` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `fecha_agendada_solicitud_servicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detalle_servicio_solicitud_servicio` varchar(500) NOT NULL,
  `imagen_adjunta_solicitud_servicio` varchar(100) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_solicitud_servicio`),
  KEY `solicitudServicio_cliente_fk_idx` (`documento_cliente`),
  KEY `solicitudServicio_servicio_idx` (`id_servicio`),
  CONSTRAINT `solicitudServicio_cliente_fk` FOREIGN KEY (`documento_cliente`) REFERENCES `cliente` (`documento_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `solicitudServicio_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_servicio`
--

LOCK TABLES `solicitud_servicio` WRITE;
/*!40000 ALTER TABLE `solicitud_servicio` DISABLE KEYS */;
INSERT INTO `solicitud_servicio` VALUES (58,1090404246,5,'2018-01-08 01:29:00','rtrtrtrtrtt','recursos/img/solicitud_cliente/login.png','2017-07-09 01:30:31','2017-07-09 01:30:31'),(59,1090404246,7,'2017-12-08 01:34:00','fyuvutvyugvyuj',NULL,'2017-07-09 01:35:01','2017-07-09 01:35:01'),(60,1090404246,19,'2017-12-07 21:46:00','ghtfhrt','recursos/img/solicitud_cliente/pendientes.png','2017-07-10 21:46:43','2017-07-10 21:46:43'),(61,1090404246,19,'2018-02-06 21:50:00','7ityutyju',NULL,'2017-07-10 21:50:58','2017-07-10 21:50:58'),(62,1090404246,19,'2018-08-07 05:03:00','ghdgfsefge',NULL,'2017-07-11 05:04:11','2017-07-11 05:04:11'),(63,1090404246,19,'2019-03-07 05:17:00','eqwrwerew','recursos/img/solicitud_cliente/login.png','2017-07-11 05:17:13','2017-07-11 05:17:13'),(64,1090404246,19,'2019-04-07 18:38:00','dsvdsvds',NULL,'2017-07-11 18:39:12','2017-07-11 18:39:12'),(65,1090404246,19,'2018-09-07 18:41:00','gggr',NULL,'2017-07-11 18:42:12','2017-07-11 18:42:12'),(66,1090404246,19,'2017-05-08 03:32:00','hotmail',NULL,'2017-07-12 03:32:42','2017-07-12 03:32:42'),(67,1090404246,19,'2017-05-08 04:06:00','yhdhd',NULL,'2017-07-12 04:06:56','2017-07-12 04:06:56'),(68,1090404246,19,'2017-11-08 04:28:00','hmjdgtkhtjd',NULL,'2017-07-12 04:28:40','2017-07-12 04:28:40'),(69,1090404246,19,'2017-04-07 15:00:00','tdryrurst',NULL,'2017-07-12 04:36:54','2017-07-12 04:36:54'),(70,1090404246,19,'2019-04-08 04:38:00','yhmgfj',NULL,'2017-07-12 04:39:00','2017-07-12 04:39:00'),(71,1090404246,19,'2019-04-08 04:38:00','yhmgfj',NULL,'2017-07-12 04:39:55','2017-07-12 04:39:55'),(72,1090404246,19,'2017-04-07 15:00:00','ryeyyr',NULL,'2017-07-12 04:41:28','2017-07-12 04:41:28'),(73,1090404246,19,'2018-08-08 04:48:00','gghthtr',NULL,'2017-07-12 04:48:11','2017-07-12 04:48:11'),(74,1090404246,19,'2019-03-07 06:36:00','hdrhdrhdr',NULL,'2017-07-12 06:37:44','2017-07-12 06:37:44'),(75,1090404246,15,'2017-04-07 15:00:00','bdfhdfh',NULL,'2017-07-12 07:09:40','2017-07-12 07:09:40'),(76,1090404247,19,'2019-05-08 03:56:00','ngfnfnn',NULL,'2017-07-13 03:57:09','2017-07-13 03:57:09'),(77,1090404246,19,'2018-02-07 05:16:00','dfbgdrgreg',NULL,'2017-07-13 05:16:27','2017-07-13 05:16:27'),(78,1090404246,19,'2018-01-07 05:20:00','rrrr',NULL,'2017-07-13 05:20:43','2017-07-13 05:20:43'),(79,1090404246,19,'2018-01-07 05:20:00','rrrr',NULL,'2017-07-13 05:26:58','2017-07-13 05:26:58'),(80,1090404246,19,'2018-07-07 20:51:00','err34r34',NULL,'2017-07-13 20:51:27','2017-07-13 20:51:27'),(81,1090404246,9,'2018-06-07 20:54:00','t54treer',NULL,'2017-07-13 20:54:34','2017-07-13 20:54:34'),(82,1090404246,9,'2018-08-07 22:23:00','rferfer',NULL,'2017-07-13 22:23:17','2017-07-13 22:23:17'),(83,1090404246,9,'2018-10-07 22:45:00','gfhdfhfr',NULL,'2017-07-13 22:45:42','2017-07-13 22:45:42'),(84,1090404246,9,'2019-02-08 00:10:00','ufygfyujgu',NULL,'2017-07-14 00:10:24','2017-07-14 00:10:24'),(85,1090404246,9,'2018-09-08 01:01:00','sdsvfsf',NULL,'2017-07-14 01:01:39','2017-07-14 01:01:39'),(86,1090404246,9,'2019-03-08 01:04:00','prueba pc',NULL,'2017-07-14 01:04:54','2017-07-14 01:04:54'),(87,1090404246,19,'2018-01-08 01:22:00','prueba desde pc 2',NULL,'2017-07-14 01:22:40','2017-07-14 01:22:40'),(88,1090404246,19,'2018-08-08 04:06:00','prueba',NULL,'2017-07-14 04:06:24','2017-07-14 04:06:24'),(89,1090404246,19,'2019-04-08 04:28:00','prueba de servicio',NULL,'2017-07-14 04:28:47','2017-07-14 04:28:47'),(90,1090404246,5,'2018-01-08 04:29:00','prueba',NULL,'2017-07-14 04:31:33','2017-07-14 04:31:33'),(91,1090404246,9,'2018-02-07 05:03:00','prueba dos mensajes.',NULL,'2017-07-14 05:03:52','2017-07-14 05:03:52'),(92,1090404246,9,'2019-04-07 05:07:00','Esto es un mensaje de prueba',NULL,'2017-07-14 05:08:22','2017-07-14 05:08:22'),(93,1090404246,9,'2018-02-07 05:16:00','prueba',NULL,'2017-07-14 05:16:56','2017-07-14 05:16:56'),(94,1090404246,19,'2018-08-07 07:15:00','gsergew',NULL,'2017-07-14 07:16:05','2017-07-14 07:16:05'),(95,1090404246,9,'2018-08-07 17:26:00','prueba de reparaciÃ³n y enviÃ³ con tildes.',NULL,'2017-07-20 17:27:45','2017-07-20 17:27:45'),(96,1090404246,9,'2018-06-07 17:33:00','kjfwjenfojwe',NULL,'2017-07-20 17:34:46','2017-07-20 17:34:46'),(97,1090404246,9,'2018-08-07 17:42:00','AcciÃ³n.',NULL,'2017-07-20 17:43:38','2017-07-20 17:43:38'),(98,1090404246,9,'2018-07-07 20:19:00','AcciÃ³n.',NULL,'2017-07-20 20:25:14','2017-07-20 20:25:14'),(99,1090404246,9,'2018-09-07 20:15:00','AcciÃ³n.',NULL,'2017-07-21 20:15:37','2017-07-21 20:15:37'),(100,1090404246,9,'2018-09-07 20:18:00','AcciÃ³n.',NULL,'2017-07-21 20:18:22','2017-07-21 20:18:22'),(101,1090404246,9,'2018-09-07 20:22:00','AcciÃ³n.',NULL,'2017-07-21 20:22:56','2017-07-21 20:22:56'),(102,1090404246,9,'2018-09-07 20:26:00','AcciÃ³n.',NULL,'2017-07-21 20:26:27','2017-07-21 20:26:27'),(103,1090404246,9,'2017-06-07 20:28:00','AcciÃ³n.',NULL,'2017-07-21 20:28:29','2017-07-21 20:28:29'),(104,1090404246,9,'2018-09-07 20:42:00','AcciÃ³n.',NULL,'2017-07-21 20:42:17','2017-07-21 20:42:17'),(105,1090404246,9,'2018-09-07 20:44:00','AcciÃ³n.',NULL,'2017-07-21 20:44:54','2017-07-21 20:44:54'),(106,1090404246,9,'2018-09-07 20:50:00','AcciÃ³n.',NULL,'2017-07-21 20:50:51','2017-07-21 20:50:51'),(107,1090404246,9,'2018-09-07 20:54:00','AcciÃ³n.',NULL,'2017-07-21 20:54:47','2017-07-21 20:54:47'),(108,1090404246,19,'2018-09-07 21:03:00','AcciÃ³n.',NULL,'2017-07-21 21:03:38','2017-07-21 21:03:38'),(109,1090404246,9,'2018-09-07 21:10:00','AcciÃ³n',NULL,'2017-07-21 21:10:29','2017-07-21 21:10:29'),(110,1090404246,9,'2018-09-07 21:15:00','AcciÃ³n',NULL,'2017-07-21 21:16:09','2017-07-21 21:16:09'),(111,1090404246,9,'2018-09-07 21:21:00','AcciÃ³n',NULL,'2017-07-21 21:21:25','2017-07-21 21:21:25'),(112,1090404246,9,'2018-09-07 21:26:00','AcciÃ³n',NULL,'2017-07-21 21:26:44','2017-07-21 21:26:44'),(113,1090404246,19,'2018-09-07 21:29:00','AcciÃ³n',NULL,'2017-07-21 21:29:29','2017-07-21 21:29:29'),(114,1090404246,9,'2018-09-07 21:30:00','AcciÃ³n',NULL,'2017-07-21 21:30:36','2017-07-21 21:30:36'),(115,1090404246,9,'2018-09-07 21:46:00','Acción',NULL,'2017-07-21 21:46:28','2017-07-21 21:46:28'),(116,1090404246,9,'2017-06-07 21:48:00','Detalle prueba',NULL,'2017-07-21 21:48:34','2017-07-21 21:48:34'),(117,1090404246,9,'2018-09-07 21:52:00','Prueba',NULL,'2017-07-21 21:52:23','2017-07-21 21:52:23'),(118,1090404246,9,'2018-09-07 21:54:00','Prueba',NULL,'2017-07-21 21:54:26','2017-07-21 21:54:26'),(119,1090404246,9,'2018-09-07 21:59:00','Detalle',NULL,'2017-07-21 21:59:42','2017-07-21 21:59:42'),(120,1090404246,9,'2018-09-07 22:00:00','AcciÃ³n',NULL,'2017-07-21 22:00:42','2017-07-21 22:00:42'),(121,1090404246,9,'2018-09-07 22:02:00','AcciÃ³n',NULL,'2017-07-21 22:03:20','2017-07-21 22:03:20'),(122,1090404246,9,'2018-09-07 22:05:00','Acción.',NULL,'2017-07-21 22:06:01','2017-07-21 22:06:01'),(123,1090404246,9,'2018-09-07 22:07:00','García, ñandú, electrónica, está.',NULL,'2017-07-21 22:08:18','2017-07-21 22:08:18'),(124,1090404246,9,'2018-09-07 22:17:00','Acción.',NULL,'2017-07-21 22:17:50','2017-07-21 22:17:50'),(125,1090404246,9,'2018-09-08 03:42:00','Prueba de correo.',NULL,'2017-07-22 03:43:19','2017-07-22 03:43:19'),(126,1090404246,9,'2018-09-08 04:03:00','prueba...',NULL,'2017-07-22 04:04:14','2017-07-22 04:04:14'),(127,1090404246,19,'2018-09-08 04:39:00','prueba 2',NULL,'2017-07-22 04:39:32','2017-07-22 04:39:32'),(128,1090404246,9,'2018-11-07 20:04:00','Prueba',NULL,'2017-07-23 20:05:19','2017-07-23 20:05:19'),(129,1090404246,25,'2018-11-07 20:13:00','pppp',NULL,'2017-07-23 20:13:54','2017-07-23 20:13:54'),(130,1090404246,19,'2018-11-07 20:18:00','cccccc',NULL,'2017-07-23 20:18:50','2017-07-23 20:18:50'),(131,1090404246,19,'2018-11-07 20:55:00','rrrrrr',NULL,'2017-07-23 20:56:16','2017-07-23 20:56:16'),(132,1090404246,19,'2018-11-07 21:03:00','jjjj',NULL,'2017-07-23 21:03:28','2017-07-23 21:03:28'),(133,1090404246,19,'2018-11-07 21:10:00','kkkk',NULL,'2017-07-23 21:11:05','2017-07-23 21:11:05'),(134,1090404246,19,'2018-11-07 21:17:00','lllll',NULL,'2017-07-23 21:17:52','2017-07-23 21:17:52'),(135,1090404246,19,'2018-11-07 21:23:00','unico',NULL,'2017-07-23 21:24:06','2017-07-23 21:24:06'),(136,1090404246,19,'2018-11-07 21:53:00','ggggg',NULL,'2017-07-23 21:53:45','2017-07-23 21:53:45'),(137,1090404246,5,'2018-11-07 23:09:00','renzon',NULL,'2017-07-23 23:10:10','2017-07-23 23:10:10'),(138,1090404246,21,'2017-06-09 16:15:00','PRUEBA',NULL,'2017-09-06 16:15:46','2017-09-06 16:15:46'),(139,1090404246,49,'2017-04-07 15:00:00','prueba de otro',NULL,'2017-09-12 22:33:59','2017-09-12 22:33:59');
/*!40000 ALTER TABLE `solicitud_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria_servicio`
--

DROP TABLE IF EXISTS `subcategoria_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategoria_servicio` (
  `id_subcategoria_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_subcategoria_servicio` varchar(50) NOT NULL,
  `descripcion_subcategoria_servicio` varchar(200) DEFAULT NULL,
  `id_categoria_servicio` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_subcategoria_servicio`),
  KEY `subcategoria_categoria_fk_idx` (`id_categoria_servicio`),
  CONSTRAINT `subcategoria_categoria_fk` FOREIGN KEY (`id_categoria_servicio`) REFERENCES `categoria_servicio` (`id_categoria_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria_servicio`
--

LOCK TABLES `subcategoria_servicio` WRITE;
/*!40000 ALTER TABLE `subcategoria_servicio` DISABLE KEYS */;
INSERT INTO `subcategoria_servicio` VALUES (1,'ELECTRICIDAD INDUSTRIAL',NULL,1,'2017-06-29 06:16:48','2017-06-29 06:16:48',1),(2,'REFRIGERACION INDUSTRIAL',NULL,1,'2017-06-29 06:19:21','2017-06-29 06:19:21',1),(3,'SERVICIO TECNICO DE COMPUTO EMPRESARIAL',NULL,1,'2017-06-29 06:19:21','2017-06-29 06:19:21',1),(4,'MECANICA INDUSTRIAL',NULL,1,'2017-06-29 06:19:21','2017-06-29 06:19:21',1),(5,'ELECTRONICA INDUSTRIAL',NULL,1,'2017-06-29 06:19:21','2017-06-29 06:19:21',1),(6,'TELECOMUNICACIONES',NULL,1,'2017-06-29 06:19:21','2017-06-29 06:19:21',1),(7,'ELECTRICIDAD',NULL,2,'2017-06-29 06:21:04','2017-06-29 06:21:04',1),(8,'SERVICIO TECNICO DE COMPUTO',NULL,2,'2017-06-29 06:21:04','2017-06-29 06:21:04',1),(9,'ELECTRODOMESTICOS',NULL,2,'2017-06-29 06:21:04','2017-06-29 06:21:04',1),(10,'OTRO',NULL,3,'2017-06-29 06:14:41','2017-06-29 06:14:41',1);
/*!40000 ALTER TABLE `subcategoria_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico` (
  `id_tecnico` int(11) NOT NULL AUTO_INCREMENT,
  `hoja_vida_tecnico` varchar(100) NOT NULL,
  `perfil_tecnico` text NOT NULL,
  `documento_persona` int(11) NOT NULL,
  `id_profesion` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tecnico`),
  KEY `tecnico_persona_idx` (`documento_persona`),
  KEY `tecnico_profesion_idx` (`id_profesion`),
  KEY `tecnico_estado_idx` (`id_estado`),
  CONSTRAINT `tecnico_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tecnico_persona` FOREIGN KEY (`documento_persona`) REFERENCES `persona` (`documento_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tecnico_profesion` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id_profesion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES (11,'recursos/hv_tecnicos/solucion-Renzon.txt','grgergerry',1090404246,3,'2017-07-09 01:18:32','2017-07-09 01:18:32',1),(12,'recursos/hv_tecnicos/cuenta_de_cobro_renzon.docx','ghrgergry',88226044,3,'2017-07-09 01:22:01','2017-07-09 01:22:01',1),(13,'recursos/hv_tecnicos/solucion-Renzon.txt','fegergerge',2,3,'2017-07-11 05:24:51','2017-07-11 05:24:51',1),(14,'recursos/hv_tecnicos/solucion-Renzon.txt','wewefwefewf',3,3,'2017-07-11 05:27:59','2017-07-11 05:27:59',1),(15,'recursos/hv_tecnicos/actualiza_cliente.png','uhfwuehgiue',7000,3,'2017-07-12 01:00:29','2017-07-12 01:00:29',1),(16,'recursos/hv_tecnicos/actualizar_mapa.png','efwergqerg',1111111,3,'2017-07-12 01:17:26','2017-07-12 01:17:26',1),(17,'recursos/hv_tecnicos/renzon_hoja_de_vida.pdf','ghtjth',999,3,'2017-07-14 07:11:22','2017-07-14 07:11:22',1),(18,'recursos/hv_tecnicos/renzon_hoja_de_vida.pdf','Acción.',1090444444,3,'2017-07-21 22:19:07','2017-07-21 22:19:07',1);
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `documento_persona` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `usuario_persona_fk_idx` (`documento_persona`),
  KEY `usuario_rol_fk_idx` (`id_rol`),
  KEY `usuario_estado_fk_idx` (`id_estado`),
  CONSTRAINT `usuario_estado_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_persona_fk` FOREIGN KEY (`documento_persona`) REFERENCES `persona` (`documento_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'servifix'
--

--
-- Dumping routines for database 'servifix'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-20 19:38:40
