CREATE DATABASE  IF NOT EXISTS `inmobiliarias` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inmobiliarias`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inmobiliarias
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

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
  `id_propietario` int(11) DEFAULT NULL,
  `path` varchar(250) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `conyuge` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,1,'path1','hola propietario',0),(2,1,'path2','hola conyuge',1);
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
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_origen` int(11) NOT NULL,
  `id_usuario_destino` int(11) NOT NULL,
  `asunto` varchar(45) DEFAULT NULL,
  `texto` varchar(250) NOT NULL,
  `id_mensaje_respuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
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
  `en_venta` tinyint(1) DEFAULT NULL,
  `en_renta` tinyint(1) DEFAULT NULL,
  `en_renta_temporal` tinyint(1) DEFAULT NULL,
  `precio_venta` decimal(11,2) DEFAULT NULL,
  `precio_renta` decimal(11,2) DEFAULT NULL,
  `tarifa_diaria` decimal(11,2) DEFAULT NULL,
  `tarifa_semanal` decimal(11,2) DEFAULT NULL,
  `tarifa_mensual` decimal(11,2) DEFAULT NULL,
  `id_tipo_propiedad` int(11) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion_privada` varchar(45) DEFAULT NULL,
  `m2_construccion` varchar(45) DEFAULT NULL,
  `m2_terreno` varchar(45) DEFAULT NULL,
  `m2_lote` varchar(45) DEFAULT NULL,
  `num_banos` tinyint(4) DEFAULT NULL,
  `num_medios_banos` tinyint(4) DEFAULT NULL,
  `num_habitaciones` tinyint(4) DEFAULT NULL,
  `num_dormitorios` tinyint(4) DEFAULT NULL,
  `pisos` tinyint(4) DEFAULT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `num_estacionamientos` tinyint(4) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `num_exterior` varchar(45) DEFAULT NULL,
  `num_interior` varchar(45) DEFAULT NULL,
  `esquina` varchar(45) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `etiquetas` varchar(45) DEFAULT NULL,
  `compartir_comision` tinyint(1) DEFAULT NULL,
  `notas_colaboracion` varchar(45) DEFAULT NULL,
  `publicar_precios` tinyint(1) DEFAULT NULL,
  `unidad_medida_terreno` varchar(6) DEFAULT NULL,
  `largo_terreno` varchar(45) DEFAULT NULL,
  `frente_terreno` varchar(45) DEFAULT NULL,
  `antiguedad` varchar(45) DEFAULT NULL,
  `fecha_construccion` varchar(4) DEFAULT NULL,
  `mantenimiento_mensual` varchar(45) DEFAULT NULL,
  `codigo_llave` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `exterior_balcon` tinyint(1) DEFAULT NULL,
  `exterior_cisterna` tinyint(1) DEFAULT NULL,
  `exterior_estacionamiento` tinyint(1) DEFAULT NULL,
  `exterior_facil_estacionarse` tinyint(1) DEFAULT NULL,
  `exterior_garaje` tinyint(1) DEFAULT NULL,
  `exterior_jardin` tinyint(1) DEFAULT NULL,
  `exterior_parrilla` tinyint(1) DEFAULT NULL,
  `exterior_patio` tinyint(1) DEFAULT NULL,
  `exterior_roof` tinyint(1) DEFAULT NULL,
  `exterior_terraza` tinyint(1) DEFAULT NULL,
  `general_acceso_adultos` tinyint(1) DEFAULT NULL,
  `general_acceso_discapacitados` tinyint(1) DEFAULT NULL,
  `general_aire` tinyint(1) DEFAULT NULL,
  `general_amueblado` tinyint(1) DEFAULT NULL,
  `general_bodega` tinyint(1) DEFAULT NULL,
  `general_chimenea` tinyint(1) DEFAULT NULL,
  `general_circuito` tinyint(1) DEFAULT NULL,
  `general_cocina_equipada` tinyint(1) DEFAULT NULL,
  `general_cocina_integral` tinyint(1) DEFAULT NULL,
  `general_cuarto_servicio` tinyint(1) DEFAULT NULL,
  `general_elevador` tinyint(1) DEFAULT NULL,
  `general_fraccionamiento_privado` tinyint(1) DEFAULT NULL,
  `general_planta` tinyint(1) DEFAULT NULL,
  `general_portero` tinyint(1) DEFAULT NULL,
  `general_seguridad_medio` tinyint(1) DEFAULT NULL,
  `general_seguridad_completo` tinyint(1) DEFAULT NULL,
  `recreacion_alberca` tinyint(1) DEFAULT NULL,
  `recreacion_infantil` tinyint(1) DEFAULT NULL,
  `recreacion_tenis` tinyint(1) DEFAULT NULL,
  `recreacion_gimnasio` tinyint(1) DEFAULT NULL,
  `recreacion_jacuzzi` tinyint(1) DEFAULT NULL,
  `recreacion_usos_multiples` tinyint(1) DEFAULT NULL,
  `restricciones_mascotas` tinyint(1) DEFAULT NULL,
  `restricciones_no_mascotas` tinyint(1) DEFAULT NULL,
  `restricciones_fumar` tinyint(1) DEFAULT NULL,
  `restricciones_no_fumar` tinyint(1) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_venta` varchar(45) DEFAULT NULL,
  `tipo_renta` varchar(45) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `id_propietario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_propiedad`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (77,'C0001',NULL,1,1,1,1000000.00,13000.00,NULL,20000.00,NULL,3,'Hermosa y amplia casa','Casa en venta',NULL,'200','200',NULL,2,1,NULL,4,89,'Planta Baja',2,'Av. Querétaro','210',NULL,'Calle Guanajuato','29000',NULL,'Chiapas','Tuxtla Gutiérrez',NULL,NULL,NULL,NULL,NULL,1,'m²','10','20','2','2001','2000','0001','Fraccionamiento La Hacienda',1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,'Precio total',NULL,'2017-08-10',1),(79,'D0001',NULL,1,1,NULL,3000.00,3000.00,NULL,NULL,NULL,6,'Amplio y bonito departamento en el primer cuadro de la ciudad.','Departamento en venta o renta',NULL,'200','200',NULL,2,NULL,NULL,2,4,'4',1,'3ra poniente norte','320','8A','3ra norte poniente','29000',NULL,'Chiapas','Tuxtla Gutierrez',NULL,NULL,NULL,NULL,NULL,1,'m²','10','20','1','1998','500','0002','Centro',1,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,1,'Precio total','Precio total','2017-08-10',3),(80,'',NULL,1,0,0,6000.00,NULL,NULL,NULL,NULL,15,'Lugar increible','Aprovecha Oportunidad!!!',NULL,'','500',NULL,2,1,NULL,5,NULL,NULL,1,'','',NULL,NULL,'',NULL,'Chiapas','San Cristobal de las Casas',NULL,NULL,NULL,NULL,NULL,1,'ha','','','1','','','',NULL,NULL,0,0,0,NULL,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,1,'Precio total',NULL,'2017-08-10',NULL),(82,'C0004',NULL,NULL,NULL,1,NULL,NULL,1000.00,2000.00,3000.00,16,'Se renta casa por día o por mes, ideal para vacacionar, con vista al mar','Se renta casa para vacacionar',NULL,'500',NULL,NULL,2,NULL,NULL,1,NULL,NULL,2,'Malecón','20',NULL,NULL,'30507',NULL,'Chiapas','Puerto Arista',NULL,NULL,NULL,NULL,NULL,1,NULL,'25','20','2',NULL,NULL,'121212','',NULL,1,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2017-08-15',1),(83,NULL,NULL,1,0,0,9000.00,NULL,NULL,NULL,NULL,0,'Ideal para parejas','Casa grande',NULL,NULL,NULL,NULL,1,3,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2017-09-28',1),(84,NULL,NULL,1,NULL,NULL,6000.00,NULL,NULL,NULL,NULL,0,'compra compra compra','Compra de oportunidad!!',NULL,'500','1000',NULL,3,2,NULL,3,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,1,1,1,3,NULL,NULL,'2017-10-09',NULL),(85,NULL,NULL,1,0,0,4440000.00,NULL,NULL,NULL,NULL,3,'Ideal para parejas jóvenes','Fracc. Residencial Hacienda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,'2017-10-14',NULL),(86,NULL,NULL,1,1,0,0.00,454554.00,544545.00,5454.00,545454.00,9,'Descripción','Título',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,'2017-10-14',NULL),(87,NULL,NULL,1,1,1,1000.00,2000.00,3000.00,4000.00,5000.00,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,'2017-10-14',NULL),(88,NULL,NULL,1,NULL,NULL,1000.00,NULL,NULL,NULL,NULL,3,NULL,'Anuncio efectivo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'Por m2',NULL,'2017-10-14',NULL),(89,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,'2017-10-14',NULL),(90,NULL,NULL,1,0,NULL,234.00,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,'2017-10-14',NULL);
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
-- Table structure for table `propiedad_imagen`
--

DROP TABLE IF EXISTS `propiedad_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedad_imagen` (
  `id_propiedad_imagen` int(11) NOT NULL AUTO_INCREMENT,
  `id_propiedad` int(11) NOT NULL,
  `file_path` varchar(150) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `file_ext` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `es_portada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_propiedad_imagen`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_imagen`
--

LOCK TABLES `propiedad_imagen` WRITE;
/*!40000 ALTER TABLE `propiedad_imagen` DISABLE KEYS */;
INSERT INTO `propiedad_imagen` VALUES (46,77,'http://localhost:8080/inmobiliaria/api/upload/propiedades/77/','bg4','1507140552','.jpg',NULL,0),(47,77,'http://localhost:8080/inmobiliaria/api/upload/propiedades/77/','bg5',NULL,'.jpg',NULL,0),(48,79,'http://localhost:8080/inmobiliaria/api/upload/propiedades/79/','bg7',NULL,'.jpg',NULL,1),(49,79,'http://localhost:8080/inmobiliaria/api/upload/propiedades/79/','bg8',NULL,'.jpg',NULL,0),(59,80,'http://localhost:8080/inmobiliaria/api/upload/propiedades/80/','horizontal2',NULL,'.jpg',NULL,1),(61,80,'http://localhost:8080/inmobiliaria/api/upload/propiedades/80/','vertical',NULL,'.jpg',NULL,0),(62,77,'http://localhost:8080/inmobiliaria/api/upload/propiedades/77/','horizontal',NULL,'.jpg',NULL,1);
/*!40000 ALTER TABLE `propiedad_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propietario` (
  `id_propietario` int(11) NOT NULL AUTO_INCREMENT,
  `persona_moral` tinyint(1) DEFAULT '0',
  `nombre` varchar(45) DEFAULT NULL,
  `nacionalidad_persona_fisica` varchar(45) DEFAULT NULL,
  `lugar_nacimiento_persona_fisica` varchar(45) DEFAULT NULL,
  `fecha_nacimiento_persona_fisica` date DEFAULT NULL,
  `pais_nacimiento_persona_fisica` varchar(45) DEFAULT NULL,
  `lugar_residencia_persona_fisica` varchar(45) DEFAULT NULL,
  `domicilio_persona_fisica` varchar(100) DEFAULT NULL,
  `cp_persona_fisica` varchar(45) DEFAULT NULL,
  `ciudad_persona_fisica` varchar(45) DEFAULT NULL,
  `telefono_persona_fisica` varchar(45) DEFAULT NULL,
  `celular_persona_fisica` varchar(45) DEFAULT NULL,
  `email_persona_fisica` varchar(45) DEFAULT NULL,
  `identificacion_oficial_persona_fisica` varchar(45) DEFAULT NULL,
  `num_identificacion_persona_fisica` varchar(45) DEFAULT NULL,
  `rfc_persona_fisica` varchar(45) DEFAULT NULL,
  `curp_persona_fisica` varchar(45) DEFAULT NULL,
  `estado_civil_persona_fisica` tinyint(4) DEFAULT NULL,
  `regimen_conyugal_persona_fisica` tinyint(4) DEFAULT NULL,
  `df_calle_persona_fisica` varchar(100) DEFAULT NULL,
  `df_num_interior_persona_fisica` varchar(45) DEFAULT NULL,
  `df_num_exterior_persona_fisica` varchar(45) DEFAULT NULL,
  `df_cp_persona_fisica` varchar(45) DEFAULT NULL,
  `df_localidad_persona_fisica` varchar(45) DEFAULT NULL,
  `df_municipio_persona_fisica` varchar(45) DEFAULT NULL,
  `df_estado_persona_fisica` varchar(45) DEFAULT NULL,
  `df_colonia_persona_fisica` varchar(45) DEFAULT NULL,
  `nacionalidad_persona_moral` varchar(45) DEFAULT NULL,
  `fecha_constitucion_persona_moral` date DEFAULT NULL,
  `actividad_persona_moral` varchar(45) DEFAULT NULL,
  `telefono_persona_moral` varchar(45) DEFAULT NULL,
  `email_persona_moral` varchar(45) DEFAULT NULL,
  `rfc_persona_moral` varchar(45) DEFAULT NULL,
  `apoderado_legal_persona_moral` varchar(45) DEFAULT NULL,
  `instrumento_publico_persona_moral` varchar(45) DEFAULT NULL,
  `poderes_representante_persona_moral` varchar(45) DEFAULT NULL,
  `df_calle_persona_moral` varchar(100) DEFAULT NULL,
  `df_num_interior_persona_moral` varchar(45) DEFAULT NULL,
  `df_num_exterior_persona_moral` varchar(45) DEFAULT NULL,
  `df_cp_persona_moral` varchar(45) DEFAULT NULL,
  `df_localidad_persona_moral` varchar(45) DEFAULT NULL,
  `df_municipio_persona_moral` varchar(45) DEFAULT NULL,
  `df_estado_persona_moral` varchar(45) DEFAULT NULL,
  `df_colonia_persona_moral` varchar(45) DEFAULT NULL,
  `profesion_laboral` varchar(45) DEFAULT NULL,
  `ocupacion_laboral` varchar(45) DEFAULT NULL,
  `empresa_laboral` varchar(45) DEFAULT NULL,
  `puesto_laboral` varchar(45) DEFAULT NULL,
  `jefe_inmediato_laboral` varchar(45) DEFAULT NULL,
  `giro_empresa_laboral` varchar(45) DEFAULT NULL,
  `domicilio_empresa_laboral` varchar(100) DEFAULT NULL,
  `cp_laboral` varchar(45) DEFAULT NULL,
  `ciudad_laboral` varchar(45) DEFAULT NULL,
  `telefono_laboral` varchar(45) DEFAULT NULL,
  `nombre_conyuge` varchar(45) DEFAULT NULL,
  `nacionalidad_conyuge` varchar(45) DEFAULT NULL,
  `lugar_nacimiento_conyuge` varchar(45) DEFAULT NULL,
  `fecha_nacimiento_conyuge` date DEFAULT NULL,
  `pais_nacimiento_conyuge` varchar(45) DEFAULT NULL,
  `lugar_residencia_conyuge` varchar(45) DEFAULT NULL,
  `domicilio_conyuge` varchar(100) DEFAULT NULL,
  `cp_conyuge` varchar(45) DEFAULT NULL,
  `ciudad_conyuge` varchar(45) DEFAULT NULL,
  `telefono_conyuge` varchar(45) DEFAULT NULL,
  `celular_conyuge` varchar(45) DEFAULT NULL,
  `email_conyuge` varchar(45) DEFAULT NULL,
  `identificacion_oficial_conyuge` varchar(45) DEFAULT NULL,
  `rfc_conyuge` varchar(45) DEFAULT NULL,
  `curp_conyuge` varchar(45) DEFAULT NULL,
  `df_calle_conyuge` varchar(100) DEFAULT NULL,
  `df_num_interior_conyuge` varchar(45) DEFAULT NULL,
  `df_num_exterior_conyuge` varchar(45) DEFAULT NULL,
  `df_cp_conyuge` varchar(45) DEFAULT NULL,
  `df_localidad_conyuge` varchar(45) DEFAULT NULL,
  `df_municipio_conyuge` varchar(45) DEFAULT NULL,
  `df_estado_conyuge` varchar(45) DEFAULT NULL,
  `df_colonia_conyuge` varchar(45) DEFAULT NULL,
  `nombre_apoderado` varchar(45) DEFAULT NULL,
  `nacionalidad_apoderado` varchar(45) DEFAULT NULL,
  `lugar_nacimiento_apoderado` varchar(45) DEFAULT NULL,
  `fecha_nacimiento_apoderado` date DEFAULT NULL,
  `pais_nacimiento_apoderado` varchar(45) DEFAULT NULL,
  `lugar_residencia_apoderado` varchar(45) DEFAULT NULL,
  `domicilio_apoderado` varchar(100) DEFAULT NULL,
  `cp_apoderado` varchar(45) DEFAULT NULL,
  `ciudad_apoderado` varchar(45) DEFAULT NULL,
  `telefono_apoderado` varchar(45) DEFAULT NULL,
  `celular_apoderado` varchar(45) DEFAULT NULL,
  `email_apoderado` varchar(45) DEFAULT NULL,
  `identificacion_oficial_apoderado` varchar(45) DEFAULT NULL,
  `num_identificacion_apoderado` varchar(45) DEFAULT NULL,
  `rfc_apoderado` varchar(45) DEFAULT NULL,
  `curp_apoderado` varchar(45) DEFAULT NULL,
  `alerta_activada` tinyint(1) DEFAULT '0',
  `mensaje_alerta` varchar(200) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES (1,0,'Ramiro Jiménez','Mexicana','México DF','2017-10-21',NULL,NULL,NULL,NULL,NULL,'(333)444-4444','(333)333-3333','ramiro.arechar@gmail.com',NULL,NULL,'jiar-800502-2p2',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ingeniero',NULL,'isssa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(2,0,'Rafael',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rafael@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(3,0,'Ramon','Mexicana','Tuxtla',NULL,NULL,NULL,'Terán',NULL,NULL,NULL,NULL,'ramon@gmail.com',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(4,0,'JZ Desarrollos',NULL,NULL,'2017-10-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecto`
--

DROP TABLE IF EXISTS `prospecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecto` (
  `id_prospecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `fuente_contacto` varchar(100) DEFAULT NULL,
  `tel_oficina` varchar(45) DEFAULT NULL,
  `tel_casa` varchar(45) DEFAULT NULL,
  `tel_celular` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `domicilio` varchar(250) DEFAULT NULL,
  `id_asesor` int(11) DEFAULT NULL,
  `interes` varchar(100) DEFAULT NULL,
  `nota` varchar(100) DEFAULT NULL,
  `seguimiento` varchar(100) DEFAULT NULL,
  `interes_tipo_operacion` varchar(45) DEFAULT NULL,
  `interes_tipo_propiedad` varchar(45) DEFAULT NULL,
  `interes_precio_min` varchar(45) DEFAULT NULL,
  `interes_precio_max` varchar(45) DEFAULT NULL,
  `interes_num_dormitorios` varchar(45) DEFAULT NULL,
  `interes_num_banos` varchar(45) DEFAULT NULL,
  `interes_m2_construccion` varchar(45) DEFAULT NULL,
  `interes_m2_terreno` varchar(45) DEFAULT NULL,
  `interes_zona` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_prospecto`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecto`
--

LOCK TABLES `prospecto` WRITE;
/*!40000 ALTER TABLE `prospecto` DISABLE KEYS */;
INSERT INTO `prospecto` VALUES (3,'ramiro','ingeniero','jz','administrador','publicidad','9999','6666','00000','ramiro.arechar@gmail.com','Av. Oaxaca #20 residencial HAcienda',4,'uno, dos, tres','notasssss','seguimiento 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'prospecto 1',NULL,NULL,NULL,'Facebook',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','Casa',NULL,NULL,'3','3',NULL,NULL,NULL),(16,'prospecto 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','Casa',NULL,NULL,'3','3',NULL,NULL,NULL),(17,'',NULL,NULL,NULL,NULL,'(4__)___-____',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'',NULL,NULL,NULL,NULL,'(44_)___-____',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'',NULL,NULL,NULL,NULL,'(445)___-____',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'',NULL,NULL,NULL,NULL,'(445)54_-____',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'',NULL,NULL,NULL,NULL,'(445)544-5___',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'',NULL,NULL,NULL,NULL,'(445)544-554_',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `prospecto` ENABLE KEYS */;
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
  `email` varchar(60) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id_inmobiliaria` varchar(45) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `cel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Emilio Sol','sol6902@hotmail.com','hola','',2,NULL),(3,'Ramiro Jimenez','ramiro.arechar@gmail.com','hola','',1,NULL),(5,'Lionel Messi','messi@barcelona.com','hola','',1,NULL);
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

-- Dump completed on 2017-10-25 11:30:55
