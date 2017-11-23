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
INSERT INTO `caracteristica` VALUES (1,'BalcÃ³n',1,1),(2,'Cisterna',1,1),(3,'Estacionamiento Techado',1,1),(4,'Facilidad Estacionamiento',1,1),(5,'Garaje',1,1),(6,'JardÃ­n',1,1),(7,'Parrilla',1,1),(8,'Patio',1,1),(9,'Roof Garden',1,1),(10,'Terraza',1,1),(11,'Accesibilidad',1,3),(12,'Alberca',1,3),(13,'Mascotas',1,4);
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
  `clave` varchar(12) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (77,'C0001',NULL,0,0,1,1000000.00,13000.00,NULL,20000.00,NULL,3,'Hermosa y amplia casa','Casa en venta',NULL,'200','200',NULL,2,1,NULL,4,89,'Planta Baja',2,'Av. QuerÃ©taro','210',NULL,'Calle Guanajuato','29000',NULL,'Chiapas','Tuxtla GutiÃ©rrez',NULL,NULL,NULL,NULL,NULL,1,'mÂ²','10','20','2','2001','2000','0001','Fraccionamiento La Hacienda',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'Precio total','Precio total','2017-08-10',1),(79,'D0001',NULL,1,1,NULL,3000.00,3000.00,NULL,NULL,NULL,6,'Amplio y bonito departamento en el primer cuadro de la ciudad.','Departamento en venta o renta',NULL,'200','200',NULL,2,NULL,NULL,2,4,'4',1,'3ra poniente norte','320','8A','3ra norte poniente','29000',NULL,'Chiapas','Tuxtla Gutierrez',NULL,NULL,NULL,NULL,NULL,1,'mÂ²','10','20','1','1998','500','0002','Centro',1,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,1,'Precio total','Precio total','2017-08-10',3),(80,'',NULL,1,0,0,6000.00,NULL,NULL,NULL,NULL,15,'Lugar increible','Aprovecha Oportunidad!!!',NULL,'','500',NULL,2,1,NULL,5,NULL,NULL,1,'','',NULL,NULL,'',NULL,'Chiapas','San Cristobal de las Casas',NULL,NULL,NULL,NULL,NULL,1,'ha','','','1','','','',NULL,NULL,0,0,0,NULL,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,0,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,1,'Precio total',NULL,'2017-08-10',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_imagen`
--

LOCK TABLES `propiedad_imagen` WRITE;
/*!40000 ALTER TABLE `propiedad_imagen` DISABLE KEYS */;
INSERT INTO `propiedad_imagen` VALUES (48,79,'http://localhost:8080/inmobiliaria/api/upload/propiedades/79/','bg7',NULL,'.jpg',NULL,1),(49,79,'http://localhost:8080/inmobiliaria/api/upload/propiedades/79/','bg8',NULL,'.jpg',NULL,0),(59,80,'http://localhost:8080/inmobiliaria/api/upload/propiedades/80/','horizontal2',NULL,'.jpg',NULL,1),(61,80,'http://localhost:8080/inmobiliaria/api/upload/propiedades/80/','vertical',NULL,'.jpg',NULL,0),(63,77,'http://localhost:8080/inmobiliaria/api/upload/propiedades/77/','vertical',NULL,'.jpg',NULL,0),(64,77,'http://localhost:8080/inmobiliaria/api/upload/propiedades/77/','horizontal',NULL,'.jpg',NULL,1);
/*!40000 ALTER TABLE `propiedad_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad_seguimiento`
--

DROP TABLE IF EXISTS `propiedad_seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedad_seguimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_propiedad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `mensaje` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_seguimiento`
--

LOCK TABLES `propiedad_seguimiento` WRITE;
/*!40000 ALTER TABLE `propiedad_seguimiento` DISABLE KEYS */;
INSERT INTO `propiedad_seguimiento` VALUES (12,77,3,'2017-10-25 18:28:55','hola'),(13,77,3,'2017-10-25 18:29:57','segundo'),(14,77,3,'2017-10-25 18:30:48','tercero'),(15,77,3,'2017-10-25 18:31:59','cuarto'),(16,77,3,'2017-10-25 18:34:22','quinto'),(17,79,3,'2017-10-25 18:47:58','hola mundo!!'),(18,77,3,'2017-11-21 19:17:39','otro '),(19,77,3,'2017-11-21 19:17:53','hola y adios'),(20,77,3,'2017-11-21 19:18:05','hasta la vista'),(21,77,3,'2017-11-21 19:18:13','baby'),(22,77,3,'2017-11-21 19:20:58','un renglÃ³n,\ndos\ntres\ncuatro'),(23,77,3,'2017-11-21 19:21:57','uno');
/*!40000 ALTER TABLE `propiedad_seguimiento` ENABLE KEYS */;
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
INSERT INTO `propietario` VALUES (1,0,'Ramiro JimÃ©nez','Mexicana','MÃ©xico DF','2017-10-21',NULL,NULL,NULL,NULL,NULL,'(333)444-4444','(333)333-3333','ramiro.arechar@gmail.com',NULL,NULL,'jiar-800502-2p2',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ingeniero',NULL,'isssa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(2,0,'Rafael',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rafael@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(3,0,'Ramon','Mexicana','Tuxtla',NULL,NULL,NULL,'TerÃ¡n',NULL,NULL,NULL,NULL,'ramon@gmail.com',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(4,0,'JZ Desarrollos',NULL,NULL,'2017-10-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecto`
--

LOCK TABLES `prospecto` WRITE;
/*!40000 ALTER TABLE `prospecto` DISABLE KEYS */;
INSERT INTO `prospecto` VALUES (3,'Ramiro JimÃ©nez ArÃ©char','ingeniero','jz','administrador','Facebook','9999','6666','00000','ramiro.arechar@gmail.com','Av. Oaxaca #20 residencial Hacienda',4,'uno, dos, tres','notasssss',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'prospecto 1',NULL,NULL,NULL,'Facebook',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','Casa',NULL,NULL,'3','3',NULL,NULL,NULL),(16,'prospecto 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','Casa',NULL,NULL,'3','3',NULL,NULL,NULL),(23,'Prospecto Mayor','MÃ©dico Cirujano',NULL,NULL,'Anuncios',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'Futbolista','pumas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `prospecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecto_seguimiento`
--

DROP TABLE IF EXISTS `prospecto_seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecto_seguimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prospecto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `mensaje` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecto_seguimiento`
--

LOCK TABLES `prospecto_seguimiento` WRITE;
/*!40000 ALTER TABLE `prospecto_seguimiento` DISABLE KEYS */;
INSERT INTO `prospecto_seguimiento` VALUES (1,3,3,'2017-11-21 19:12:24','hola mundo !!!'),(2,3,3,'2017-11-21 19:13:47','mas seguimiento'),(3,3,3,'2017-11-21 19:14:21','Seguimiento mÃ¡s largo que ocupe mas de dos filas para ver cÃ³mo se ve en el componente.\nA ver si respeta los saltos de lÃ­nea.');
/*!40000 ALTER TABLE `prospecto_seguimiento` ENABLE KEYS */;
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
INSERT INTO `tipo_caracteristica` VALUES (1,'Exterior'),(2,'Interior'),(3,'RecreaciÃ³n'),(4,'Restricciones');
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

-- Dump completed on 2017-11-23 14:05:20
