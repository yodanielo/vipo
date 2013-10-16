-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2013 a las 06:49:17
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
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE IF NOT EXISTS `caja` (
  `idCaja` int(11) NOT NULL,
  `FechaApertura` datetime DEFAULT NULL,
  `FechaCierre` datetime DEFAULT NULL,
  `IdCajero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCaja`),
  KEY `fk_IdCajero` (`IdCajero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `comprobante_pago`
--

CREATE TABLE IF NOT EXISTS `comprobante_pago` (
  `idComprobante_Pago` int(11) NOT NULL,
  `Caja_idCaja` int(11) NOT NULL,
  `IdPagador` int(11) DEFAULT NULL,
  `IdCabecera_reserva` int(11) DEFAULT NULL,
  `Total` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`idComprobante_Pago`),
  KEY `fk_Comprobante_Pago_Caja1` (`Caja_idCaja`),
  KEY `fk_IdPagador` (`IdPagador`),
  KEY `fk_IdCabecera_reserva` (`IdCabecera_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_comprobante`
--

CREATE TABLE IF NOT EXISTS `detalle_comprobante` (
  `idDetalle_Comprobante` int(11) NOT NULL,
  `Comprobante_Pago_idComprobante_Pago` int(11) NOT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `IdReserva` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(10,4) DEFAULT NULL,
  `subtotal` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`idDetalle_Comprobante`),
  KEY `fk_Detalle_Comprobante_Comprobante_Pago1` (`Comprobante_Pago_idComprobante_Pago`),
  KEY `fk_IdReserva` (`IdReserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pago`
--

CREATE TABLE IF NOT EXISTS `detalle_pago` (
  `idDetalle_Pago` int(11) NOT NULL,
  `Comprobante_Pago_idComprobante_Pago` int(11) NOT NULL,
  `TipoPago` int(11) DEFAULT NULL COMMENT 'viene de "variable"\n',
  `MontoTotal` decimal(10,4) DEFAULT NULL,
  `FechaPago` datetime DEFAULT NULL,
  PRIMARY KEY (`idDetalle_Pago`),
  KEY `fk_Detalle_Pago_Comprobante_Pago1` (`Comprobante_Pago_idComprobante_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='aun faltan campos, segun el tipo de pago que se elija';

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
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_asignado`
--

CREATE TABLE IF NOT EXISTS `rol_asignado` (
  `idRol_Asignado` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  `UsuarioAplicacion_IdUsuarioAplicacion` int(11) NOT NULL,
  PRIMARY KEY (`idRol_Asignado`),
  KEY `fk_Rol_Asignado_Rol1` (`Rol_idRol`),
  KEY `fk_Rol_Asignado_UsuarioAplicacion1` (`UsuarioAplicacion_IdUsuarioAplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Filtros para la tabla `cabecera_reserva`
--
ALTER TABLE `cabecera_reserva`
  ADD CONSTRAINT `FK_RESERVANTE` FOREIGN KEY (`IdReservante`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `fk_IdCajero` FOREIGN KEY (`IdCajero`) REFERENCES `usuarioaplicacion` (`IdUsuarioAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprobante_pago`
--
ALTER TABLE `comprobante_pago`
  ADD CONSTRAINT `fk_Comprobante_Pago_Caja1` FOREIGN KEY (`Caja_idCaja`) REFERENCES `caja` (`idCaja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IdPagador` FOREIGN KEY (`IdPagador`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IdCabecera_reserva` FOREIGN KEY (`IdCabecera_reserva`) REFERENCES `cabecera_reserva` (`idCabecera_Reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_comprobante`
--
ALTER TABLE `detalle_comprobante`
  ADD CONSTRAINT `fk_Detalle_Comprobante_Comprobante_Pago1` FOREIGN KEY (`Comprobante_Pago_idComprobante_Pago`) REFERENCES `comprobante_pago` (`idComprobante_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IdReserva` FOREIGN KEY (`IdReserva`) REFERENCES `reserva_habitacion` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  ADD CONSTRAINT `fk_Detalle_Pago_Comprobante_Pago1` FOREIGN KEY (`Comprobante_Pago_idComprobante_Pago`) REFERENCES `comprobante_pago` (`idComprobante_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_Idpersona` FOREIGN KEY (`idOcupante`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ocupante_Reserva_Habitacion1` FOREIGN KEY (`Reserva_Habitacion_idReserva`) REFERENCES `reserva_habitacion` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Filtros para la tabla `rol_asignado`
--
ALTER TABLE `rol_asignado`
  ADD CONSTRAINT `fk_Rol_Asignado_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Rol_Asignado_UsuarioAplicacion1` FOREIGN KEY (`UsuarioAplicacion_IdUsuarioAplicacion`) REFERENCES `usuarioaplicacion` (`IdUsuarioAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
