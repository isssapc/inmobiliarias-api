CREATE TABLE `prospecto_seguimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prospecto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `mensaje` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
