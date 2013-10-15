-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2013 a las 07:19:47
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `vipodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE IF NOT EXISTS `acceso` (
  `IdAcceso` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `Ip` varchar(12) DEFAULT NULL,
  `usaProxy` bit(1) DEFAULT NULL,
  `UsuarioAplicacion_IdUsuarioAplicacion` int(11) NOT NULL,
  PRIMARY KEY (`IdAcceso`),
  KEY `fk_Acceso_UsuarioAplicacion1` (`UsuarioAplicacion_IdUsuarioAplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE IF NOT EXISTS `aplicacion` (
  `IdAplicacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdAplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacionregistrada`
--

CREATE TABLE IF NOT EXISTS `aplicacionregistrada` (
  `IdAplicacionRegistrada` int(11) NOT NULL AUTO_INCREMENT,
  `Aplicacion_IdAplicacion` int(11) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `Usuario_IdPersona` int(11) NOT NULL,
  PRIMARY KEY (`IdAplicacionRegistrada`),
  KEY `fk_persona_has_Aplicacion_Aplicacion1` (`Aplicacion_IdAplicacion`),
  KEY `fk_AplicacionRegistrada_Usuario1` (`Usuario_IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabecera_reserva`
--

CREATE TABLE IF NOT EXISTS `cabecera_reserva` (
  `idCabecera_Reserva` int(11) NOT NULL AUTO_INCREMENT,
  `IdReservante` int(11) DEFAULT NULL,
  `fechaReserva` datetime DEFAULT NULL,
  PRIMARY KEY (`idCabecera_Reserva`),
  KEY `FK_RESERVANTE` (`IdReservante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE IF NOT EXISTS `clasificacion` (
  `idClasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `icono` varchar(45) DEFAULT NULL,
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE IF NOT EXISTS `habitacion` (
  `idHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Piso` int(11) DEFAULT NULL,
  `IdClasificacion` int(11) DEFAULT NULL,
  `IdEstadoHouseKeeping` int(11) DEFAULT NULL COMMENT 'el estado actual de la habitacion\n',
  `Seleccionable` bit(1) DEFAULT b'1' COMMENT 'por ejemplo si está en mtto o está como para alquilar',
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHabitacion`),
  KEY `fk_Habitacion_Clasificacion1` (`IdClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `housekeeping`
--

CREATE TABLE IF NOT EXISTS `housekeeping` (
  `idHouseKeeping` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `FechaHoraInicio` datetime DEFAULT NULL,
  `FechaHoraFin` datetime DEFAULT NULL,
  `Estado1` int(11) DEFAULT NULL,
  `Estado2` int(11) DEFAULT NULL,
  `UsuarioAsignado` int(11) DEFAULT NULL,
  `IdAplicacionregistrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHouseKeeping`),
  KEY `fk_HouseKeeping_Habitacion1` (`Habitacion_idHabitacion`),
  KEY `fk_usuarioAsignado` (`UsuarioAsignado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupante`
--

CREATE TABLE IF NOT EXISTS `ocupante` (
  `idOcupante` int(11) NOT NULL AUTO_INCREMENT,
  `Reserva_Habitacion_idReserva` int(11) NOT NULL,
  `Persona_IdPersona` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOcupante`),
  KEY `fk_Ocupante_Reserva_Habitacion1` (`Reserva_Habitacion_idReserva`),
  KEY `fk_Idpersona` (`idOcupante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `IdPersona` int(11) NOT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono1` varchar(45) DEFAULT NULL,
  `Telefono2` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(256) DEFAULT NULL,
  `idAplicacionregistrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`),
  KEY `fk_persona_Usuario1` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_habitacion`
--

CREATE TABLE IF NOT EXISTS `reserva_habitacion` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `FechaHoraInicioReserva` datetime DEFAULT NULL,
  `FechaHoraFinReserva` datetime DEFAULT NULL,
  `Comentarios` text,
  `FechaHoraToma` datetime DEFAULT NULL,
  `FechaHoraAbandono` datetime DEFAULT NULL,
  `EstadoReserva` int(11) DEFAULT NULL,
  `Cabecera_Reserva_idCabecera_Reserva` int(11) NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `fk_Reserva_Habitacion1` (`Habitacion_idHabitacion`),
  KEY `fk_Reserva_Habitacion_Cabecera_Reserva1` (`Cabecera_Reserva_idCabecera_Reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `NombreUsuario` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioaplicacion`
--

CREATE TABLE IF NOT EXISTS `usuarioaplicacion` (
  `IdUsuarioAplicacion` int(11) NOT NULL AUTO_INCREMENT,
  `AplicacionRegistrada_IdAplicacionRegistrada` int(11) NOT NULL,
  `Usuario_IdPersona` int(11) NOT NULL,
  PRIMARY KEY (`IdUsuarioAplicacion`),
  KEY `fk_UsuarioAplicacion_AplicacionRegistrada1` (`AplicacionRegistrada_IdAplicacionRegistrada`),
  KEY `fk_UsuarioAplicacion_Usuario1` (`Usuario_IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variableapp`
--

CREATE TABLE IF NOT EXISTS `variableapp` (
  `IdVariableApp` int(11) NOT NULL AUTO_INCREMENT,
  `Agrupador` varchar(45) DEFAULT NULL,
  `Valor` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdVariableApp`),
  KEY `fk_idaplicacionregistrada` (`IdAplicacionRegistrada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `fk_Acceso_UsuarioAplicacion1` FOREIGN KEY (`UsuarioAplicacion_IdUsuarioAplicacion`) REFERENCES `usuarioaplicacion` (`IdUsuarioAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `aplicacionregistrada`
--
ALTER TABLE `aplicacionregistrada`
  ADD CONSTRAINT `fk_persona_has_Aplicacion_Aplicacion1` FOREIGN KEY (`Aplicacion_IdAplicacion`) REFERENCES `aplicacion` (`IdAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AplicacionRegistrada_Usuario1` FOREIGN KEY (`Usuario_IdPersona`) REFERENCES `usuario` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cabecera_reserva`
--
ALTER TABLE `cabecera_reserva`
  ADD CONSTRAINT `FK_RESERVANTE` FOREIGN KEY (`IdReservante`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `fk_Habitacion_Clasificacion1` FOREIGN KEY (`IdClasificacion`) REFERENCES `clasificacion` (`idClasificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `housekeeping`
--
ALTER TABLE `housekeeping`
  ADD CONSTRAINT `fk_HouseKeeping_Habitacion1` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioAsignado` FOREIGN KEY (`UsuarioAsignado`) REFERENCES `usuarioaplicacion` (`IdUsuarioAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ocupante`
--
ALTER TABLE `ocupante`
  ADD CONSTRAINT `fk_Ocupante_Reserva_Habitacion1` FOREIGN KEY (`Reserva_Habitacion_idReserva`) REFERENCES `reserva_habitacion` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Idpersona` FOREIGN KEY (`idOcupante`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_Usuario1` FOREIGN KEY (`IdPersona`) REFERENCES `usuario` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva_habitacion`
--
ALTER TABLE `reserva_habitacion`
  ADD CONSTRAINT `fk_Reserva_Habitacion1` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Habitacion_Cabecera_Reserva1` FOREIGN KEY (`Cabecera_Reserva_idCabecera_Reserva`) REFERENCES `cabecera_reserva` (`idCabecera_Reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioaplicacion`
--
ALTER TABLE `usuarioaplicacion`
  ADD CONSTRAINT `fk_UsuarioAplicacion_AplicacionRegistrada1` FOREIGN KEY (`AplicacionRegistrada_IdAplicacionRegistrada`) REFERENCES `aplicacionregistrada` (`IdAplicacionRegistrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UsuarioAplicacion_Usuario1` FOREIGN KEY (`Usuario_IdPersona`) REFERENCES `usuario` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `variableapp`
--
ALTER TABLE `variableapp`
  ADD CONSTRAINT `fk_idaplicacionregistrada` FOREIGN KEY (`IdAplicacionRegistrada`) REFERENCES `aplicacionregistrada` (`IdAplicacionRegistrada`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
