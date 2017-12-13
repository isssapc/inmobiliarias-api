CREATE TABLE `tarea` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `texto` varchar(100) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_asignado` int(11) DEFAULT NULL,
  `completada` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `mensaje` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_origen` int(11) NOT NULL,
  `id_usuario_destino` int(11) NOT NULL,
  `asunto` varchar(45) DEFAULT NULL,
  `texto` varchar(250) NOT NULL,
  `id_mensaje_respuesta` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `leido` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;