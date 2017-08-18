CREATE DATABASE  IF NOT EXISTS `inmobiliarias` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inmobiliarias`;

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inmobiliarias
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.10-MariaDB

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
-- Table structure for table `caracteristica`
--

DROP TABLE IF EXISTS `caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristica` (
  `id_caracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `id_inmobiliaria` int(11) NOT NULL,
  `id_tipo_caracteristica` int(11) NOT NULL,
  PRIMARY KEY (`id_caracteristica`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica`
--

LOCK TABLES `caracteristica` WRITE;
/*!40000 ALTER TABLE `caracteristica` DISABLE KEYS */;
INSERT INTO `caracteristica` VALUES (1,'Balcón',1,1),(2,'Cisterna',1,1),(3,'Estacionamiento Techado',1,1),(4,'Facilidad Estacionamiento',1,1),(5,'Garaje',1,1),(6,'Jardín',1,1),(7,'Parrilla',1,1),(8,'Patio',1,1),(9,'Roof Garden',1,1),(10,'Terraza',1,1),(11,'Accesibilidad',1,3),(12,'Alberca',1,3),(13,'Mascotas',1,4);
/*!40000 ALTER TABLE `caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `id_propiedad` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_tipo_documento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmobiliaria`
--

DROP TABLE IF EXISTS `inmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmobiliaria` (
  `id_inmobiliaria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `num_asesores` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_inmobiliaria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmobiliaria`
--

LOCK TABLES `inmobiliaria` WRITE;
/*!40000 ALTER TABLE `inmobiliaria` DISABLE KEYS */;
INSERT INTO `inmobiliaria` VALUES (1,'Realty World',2);
/*!40000 ALTER TABLE `inmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedad` (
  `id_propiedad` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) DEFAULT NULL,
  `moneda` varchar(45) DEFAULT NULL,
  `en_venta` varchar(45) DEFAULT NULL,
  `en_renta` varchar(45) DEFAULT NULL,
  `en_renta_temporal` varchar(45) DEFAULT NULL,
  `precio_venta` varchar(45) DEFAULT NULL,
  `precio_renta` varchar(45) DEFAULT NULL,
  `tarifa_diaria` varchar(45) DEFAULT NULL,
  `tarifa_semanal` varchar(45) DEFAULT NULL,
  `tarifa_mensual` varchar(45) DEFAULT NULL,
  `tipo_propiedad` varchar(45) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion_privada` varchar(45) DEFAULT NULL,
  `m2_construccion` varchar(45) DEFAULT NULL,
  `m2_terreno` varchar(45) DEFAULT NULL,
  `m2_lote` varchar(45) DEFAULT NULL,
  `num_banos` varchar(45) DEFAULT NULL,
  `num_medios_banos` varchar(45) DEFAULT NULL,
  `num_habitaciones` varchar(45) DEFAULT NULL,
  `num_dormitorios` varchar(45) DEFAULT NULL,
  `pisos` varchar(45) DEFAULT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `num_estacionamientos` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `num_exterior` varchar(45) DEFAULT NULL,
  `num_interior` varchar(45) DEFAULT NULL,
  `esquina` varchar(45) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `etiquetas` varchar(45) DEFAULT NULL,
  `compartir_comision` varchar(45) DEFAULT NULL,
  `notas_colaboracion` varchar(45) DEFAULT NULL,
  `publicar_precios` tinyint(1) DEFAULT NULL,
  `unidad_medida` varchar(45) DEFAULT NULL,
  `largo_terreno` varchar(45) DEFAULT NULL,
  `frente_terreno` varchar(45) DEFAULT NULL,
  `antiguedad` varchar(45) DEFAULT NULL,
  `fecha_construccion` varchar(45) DEFAULT NULL,
  `mantenimiento_mensual` varchar(45) DEFAULT NULL,
  `codigo_llave` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `exterior_balcon` varchar(45) DEFAULT NULL,
  `exterior_cisterna` varchar(45) DEFAULT NULL,
  `exterior_estacionamiento` varchar(45) DEFAULT NULL,
  `exterior_facil_estacionarse` varchar(45) DEFAULT NULL,
  `exterior_garaje` varchar(45) DEFAULT NULL,
  `exterior_jardin` varchar(45) DEFAULT NULL,
  `exterior_parrilla` varchar(45) DEFAULT NULL,
  `exterior_patio` varchar(45) DEFAULT NULL,
  `exterior_roof` varchar(45) DEFAULT NULL,
  `exterior_terraza` varchar(45) DEFAULT NULL,
  `general_acceso_adultos` varchar(45) DEFAULT NULL,
  `general_acceso_discapacitados` varchar(45) DEFAULT NULL,
  `general_aire` varchar(45) DEFAULT NULL,
  `general_amueblado` varchar(45) DEFAULT NULL,
  `general_bodega` varchar(45) DEFAULT NULL,
  `general_chimenea` varchar(45) DEFAULT NULL,
  `general_circuito` varchar(45) DEFAULT NULL,
  `general_cocina_equipada` varchar(45) DEFAULT NULL,
  `general_cocina_integral` varchar(45) DEFAULT NULL,
  `general_cuarto_servicio` varchar(45) DEFAULT NULL,
  `general_elevador` varchar(45) DEFAULT NULL,
  `general_fraccionamiento_privado` varchar(45) DEFAULT NULL,
  `general_planta` varchar(45) DEFAULT NULL,
  `general_portero` varchar(45) DEFAULT NULL,
  `general_seguridad_medio` varchar(45) DEFAULT NULL,
  `general_seguridad_completo` varchar(45) DEFAULT NULL,
  `recreacion_alberca` varchar(45) DEFAULT NULL,
  `recreacion_infantil` varchar(45) DEFAULT NULL,
  `recreacion_tenis` varchar(45) DEFAULT NULL,
  `recreacion_gimnasio` varchar(45) DEFAULT NULL,
  `recreacion_jacuzzi` varchar(45) DEFAULT NULL,
  `recreacion_usos_multiples` varchar(45) DEFAULT NULL,
  `restricciones_mascotas` varchar(45) DEFAULT NULL,
  `restricciones_no_mascotas` varchar(45) DEFAULT NULL,
  `restricciones_fumar` varchar(45) DEFAULT NULL,
  `restricciones_no_fumar` varchar(45) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_venta` varchar(45) DEFAULT NULL,
  `tipo_renta` varchar(45) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_propiedad`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (77,'C0001',NULL,'1',NULL,NULL,'1000000',NULL,NULL,NULL,NULL,'Edificio','Hermosa y amplia casa','Casa en venta',NULL,'200','200',NULL,'2','1',NULL,'3','1','1','1','Av. Queretaro','210',NULL,'Calle Guanajuato','29000',NULL,'Chiapas','Tuxtla Gutierrez',NULL,NULL,NULL,NULL,NULL,1,'m²','10','20','1','2001','2000','0001','Fraccionamiento La Hacienda','0','0','1','1',NULL,'1',NULL,'1',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,'1',NULL,1,'Precio total',NULL,'2017-08-10'),(79,'D0001',NULL,'1','1',NULL,'1500000','3500',NULL,NULL,NULL,'Departamento','Amplio y bonito departamento en el primer cuadro de la ciudad.','Departamento en venta o renta',NULL,'200','200',NULL,'2',NULL,NULL,'2','4','4','1','3ra poniente norte','320','8A','3ra norte poniente','29000',NULL,'Chiapas','Tuxtla Gutierrez',NULL,NULL,NULL,NULL,NULL,1,'m²','10','20','1','1998','500','0002','Centro','1',NULL,NULL,'1',NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'1',NULL,1,'Precio total','Precio total','2017-08-10'),(80,'R0001',NULL,'1',NULL,NULL,'5320000',NULL,NULL,NULL,NULL,'Rancho','Rancho ubicado a las afueras de San Cristobal','Racho en venta en San Cristobal',NULL,'400','1',NULL,'2','1',NULL,'5',NULL,NULL,'4','Antigua carretera a San Juan Chamula','KM 2',NULL,NULL,'28000',NULL,'Chiapas','San Cristobal de las Casas',NULL,NULL,NULL,NULL,NULL,0,'ha','100','100','1','2000','5000','0003',NULL,NULL,'1','1','1',NULL,'1','1','1',NULL,NULL,'1','1',NULL,NULL,NULL,'1','1','1',NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,'1','1',NULL,NULL,NULL,NULL,'1',NULL,'1',NULL,1,'Precio total',NULL,'2017-08-10'),(82,'C0004',NULL,NULL,NULL,'1',NULL,NULL,'800','3600','6000','Casa','Se renta casa por día o por mes, ideal para vacacionar, con vista al mar','Se renta casa para vacacionar',NULL,'500',NULL,NULL,'2',NULL,NULL,'1',NULL,NULL,'2','Malecón','20',NULL,NULL,'30507',NULL,'Chiapas','Puerto Arista',NULL,NULL,NULL,NULL,NULL,1,NULL,'25','20','2',NULL,NULL,'121212','',NULL,'1',NULL,'1',NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,'1','1',NULL,NULL,NULL,'1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2017-08-15');
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad_caracteristica`
--

DROP TABLE IF EXISTS `propiedad_caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedad_caracteristica` (
  `id_propiedad_caracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `id_propiedad` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL,
  PRIMARY KEY (`id_propiedad_caracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_caracteristica`
--

LOCK TABLES `propiedad_caracteristica` WRITE;
/*!40000 ALTER TABLE `propiedad_caracteristica` DISABLE KEYS */;
/*!40000 ALTER TABLE `propiedad_caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Asesor'),(3,'Recepcion Llamadas');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_caracteristica`
--

DROP TABLE IF EXISTS `tipo_caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_caracteristica` (
  `id_tipo_caracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_caracteristica`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_caracteristica`
--

LOCK TABLES `tipo_caracteristica` WRITE;
/*!40000 ALTER TABLE `tipo_caracteristica` DISABLE KEYS */;
INSERT INTO `tipo_caracteristica` VALUES (1,'Exterior'),(2,'Interior'),(3,'Recreación'),(4,'Restricciones');
/*!40000 ALTER TABLE `tipo_caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_propiedad`
--

DROP TABLE IF EXISTS `tipo_propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_propiedad` (
  `id_tipo_propiedad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_propiedad`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_propiedad`
--

LOCK TABLES `tipo_propiedad` WRITE;
/*!40000 ALTER TABLE `tipo_propiedad` DISABLE KEYS */;
INSERT INTO `tipo_propiedad` VALUES (1,'Bodega comercial'),(2,'Bodega industrial'),(3,'Casa'),(4,'Casa con uso de suelo'),(5,'Casa en condominio'),(6,'Departamento'),(7,'Edificio'),(8,'Huerta'),(9,'Local'),(10,'Local comercial'),(11,'Local en centro comercial'),(12,'Nave industrial'),(13,'Oficina'),(14,'Otro'),(15,'Quinta'),(16,'Rancho'),(17,'Terreno'),(18,'Terreno comercial'),(19,'Villa');
/*!40000 ALTER TABLE `tipo_propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id_inmobiliaria` varchar(45) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `cel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Emilio Sol','sol6902@hotmail.com','hola','',2,NULL),(3,'Ramiro Jimenez','ramiro.arechar@gmail.com','hola','',1,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-16 12:24:25
