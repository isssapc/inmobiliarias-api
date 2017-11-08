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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08 11:39:34
