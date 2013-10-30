-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2013 a las 05:42:45
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

DROP TABLE IF EXISTS `acceso`;
CREATE TABLE `acceso` (
  `IdAcceso` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `Ip` varchar(12) DEFAULT NULL,
  `usaProxy` bit(1) DEFAULT NULL,
  `UsuarioAplicacion_IdUsuarioAplicacion` int(11) NOT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAcceso`),
  KEY `fk_Acceso_UsuarioAplicacion1` (`UsuarioAplicacion_IdUsuarioAplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

DROP TABLE IF EXISTS `aplicacion`;
CREATE TABLE `aplicacion` (
  `IdAplicacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacionregistrada`
--

DROP TABLE IF EXISTS `aplicacionregistrada`;
CREATE TABLE `aplicacionregistrada` (
  `IdAplicacionRegistrada` int(11) NOT NULL AUTO_INCREMENT,
  `Aplicacion_IdAplicacion` int(11) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `Usuario_IdPersona` int(11) NOT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAplicacionRegistrada`),
  KEY `fk_persona_has_Aplicacion_Aplicacion1` (`Aplicacion_IdAplicacion`),
  KEY `fk_AplicacionRegistrada_Usuario1` (`Usuario_IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabecerareserva`
--

DROP TABLE IF EXISTS `cabecerareserva`;
CREATE TABLE `cabecerareserva` (
  `idCabecera_Reserva` int(11) NOT NULL AUTO_INCREMENT,
  `IdReservante` int(11) DEFAULT NULL,
  `fechaReserva` datetime DEFAULT NULL,
  `IdAplicacionregistrada` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCabecera_Reserva`),
  KEY `FK_RESERVANTE` (`IdReservante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

DROP TABLE IF EXISTS `caja`;
CREATE TABLE `caja` (
  `idCaja` int(11) NOT NULL,
  `FechaApertura` datetime DEFAULT NULL,
  `FechaCierre` datetime DEFAULT NULL,
  `IdCajero` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCaja`),
  KEY `fk_IdCajero` (`IdCajero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE `clasificacion` (
  `idClasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `icono` varchar(45) DEFAULT NULL,
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientetemporada`
--

DROP TABLE IF EXISTS `clientetemporada`;
CREATE TABLE `clientetemporada` (
  `IdCliente_temporada` int(11) NOT NULL AUTO_INCREMENT,
  `temporada_Idtemporada` int(11) NOT NULL,
  `persona_IdPersona` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCliente_temporada`),
  KEY `fk_Cliente_temporada_temporada1` (`temporada_Idtemporada`),
  KEY `fk_persona_IdPersona` (`persona_IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantepago`
--

DROP TABLE IF EXISTS `comprobantepago`;
CREATE TABLE `comprobantepago` (
  `idComprobante_Pago` int(11) NOT NULL,
  `Caja_idCaja` int(11) NOT NULL,
  `IdPagador` int(11) DEFAULT NULL,
  `IdCabecera_reserva` int(11) DEFAULT NULL,
  `Total` decimal(10,4) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComprobante_Pago`),
  KEY `fk_Comprobante_Pago_Caja1` (`Caja_idCaja`),
  KEY `fk_IdPagador` (`IdPagador`),
  KEY `fk_IdCabecera_reserva` (`IdCabecera_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecomprobante`
--

DROP TABLE IF EXISTS `detallecomprobante`;
CREATE TABLE `detallecomprobante` (
  `idDetalle_Comprobante` int(11) NOT NULL,
  `Comprobante_Pago_idComprobante_Pago` int(11) NOT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `IdReserva` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(10,4) DEFAULT NULL,
  `subtotal` decimal(10,4) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDetalle_Comprobante`),
  KEY `fk_Detalle_Comprobante_Comprobante_Pago1` (`Comprobante_Pago_idComprobante_Pago`),
  KEY `fk_IdReserva` (`IdReserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepago`
--

DROP TABLE IF EXISTS `detallepago`;
CREATE TABLE `detallepago` (
  `idDetalle_Pago` int(11) NOT NULL,
  `Comprobante_Pago_idComprobante_Pago` int(11) NOT NULL,
  `TipoPago` int(11) DEFAULT NULL COMMENT 'viene de "variable"\n',
  `MontoTotal` decimal(10,4) DEFAULT NULL,
  `FechaPago` datetime DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDetalle_Pago`),
  KEY `fk_Detalle_Pago_Comprobante_Pago1` (`Comprobante_Pago_idComprobante_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='aun faltan campos, segun el tipo de pago que se elija';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
CREATE TABLE `habitacion` (
  `idHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Piso` int(11) DEFAULT NULL,
  `IdClasificacion` int(11) DEFAULT NULL,
  `IdEstadoHouseKeeping` int(11) DEFAULT NULL COMMENT 'el estado actual de la habitacion\n',
  `Seleccionable` bit(1) DEFAULT b'1' COMMENT 'por ejemplo si está en mtto o está como para alquilar',
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  `precio_standard` decimal(10,4) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHabitacion`),
  KEY `fk_Habitacion_Clasificacion1` (`IdClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `housekeeping`
--

DROP TABLE IF EXISTS `housekeeping`;
CREATE TABLE `housekeeping` (
  `idHouseKeeping` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `FechaHoraInicio` datetime DEFAULT NULL,
  `FechaHoraFin` datetime DEFAULT NULL,
  `Estado1` int(11) DEFAULT NULL,
  `Estado2` int(11) DEFAULT NULL,
  `UsuarioAsignado` int(11) DEFAULT NULL,
  `IdAplicacionregistrada` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHouseKeeping`),
  KEY `fk_HouseKeeping_Habitacion1` (`Habitacion_idHabitacion`),
  KEY `fk_usuarioAsignado` (`UsuarioAsignado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupante`
--

DROP TABLE IF EXISTS `ocupante`;
CREATE TABLE `ocupante` (
  `idOcupante` int(11) NOT NULL AUTO_INCREMENT,
  `Reserva_Habitacion_idReserva` int(11) NOT NULL,
  `Persona_IdPersona` int(11) DEFAULT NULL,
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOcupante`),
  KEY `fk_Ocupante_Reserva_Habitacion1` (`Reserva_Habitacion_idReserva`),
  KEY `fk_Ocupante_persona1` (`Persona_IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
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
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`),
  KEY `fk_persona_Usuario1` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(255) DEFAULT NULL,
  `precio_unitario` decimal(10,4) DEFAULT NULL,
  `IdAplicacionregistrada` int(11) DEFAULT NULL,
  `vendible` bit(1) DEFAULT NULL COMMENT '0 = insumo\n1 = producto',
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocombinacion`
--

DROP TABLE IF EXISTS `productocombinacion`;
CREATE TABLE `productocombinacion` (
  `idproducto_combinacion` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto_salida` int(11) DEFAULT NULL,
  `cantidad_salida` varchar(45) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproducto_combinacion`),
  KEY `fk_producto_combinacion_Producto1` (`idproducto_salida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocombinaciondetalle`
--

DROP TABLE IF EXISTS `productocombinaciondetalle`;
CREATE TABLE `productocombinaciondetalle` (
  `Idproducto_combinacion_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `producto_combinacion_idproducto_combinacion` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `cantidad_entrada` varchar(45) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idproducto_combinacion_detalle`),
  KEY `fk_producto_combinacion_detalle_producto_combinacion1` (`producto_combinacion_idproducto_combinacion`),
  KEY `fk_producto_combinacion_detalle_Producto1` (`Producto_idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservahabitacion`
--

DROP TABLE IF EXISTS `reservahabitacion`;
CREATE TABLE `reservahabitacion` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `FechaHoraInicioReserva` datetime DEFAULT NULL,
  `FechaHoraFinReserva` datetime DEFAULT NULL,
  `Comentarios` text,
  `FechaHoraToma` datetime DEFAULT NULL,
  `FechaHoraAbandono` datetime DEFAULT NULL,
  `EstadoReserva` int(11) DEFAULT NULL,
  `Cabecera_Reserva_idCabecera_Reserva` int(11) NOT NULL,
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `fk_Reserva_Habitacion1` (`Habitacion_idHabitacion`),
  KEY `fk_Reserva_Habitacion_Cabecera_Reserva1` (`Cabecera_Reserva_idCabecera_Reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolasignado`
--

DROP TABLE IF EXISTS `rolasignado`;
CREATE TABLE `rolasignado` (
  `idRol_Asignado` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  `UsuarioAplicacion_IdUsuarioAplicacion` int(11) NOT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRol_Asignado`),
  KEY `fk_Rol_Asignado_Rol1` (`Rol_idRol`),
  KEY `fk_Rol_Asignado_UsuarioAplicacion1` (`UsuarioAplicacion_IdUsuarioAplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `idstock` int(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_caducidad` datetime DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`idstock`),
  KEY `fk_stock_Producto1` (`Producto_idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporada`
--

DROP TABLE IF EXISTS `temporada`;
CREATE TABLE `temporada` (
  `Idtemporada` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `vigencia_desde` datetime DEFAULT NULL,
  `vigencia_hasta` datetime DEFAULT NULL,
  `IdAplicacionregistrada` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idtemporada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadahabitacion`
--

DROP TABLE IF EXISTS `temporadahabitacion`;
CREATE TABLE `temporadahabitacion` (
  `Idtemporada_Habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `temporada_Idtemporada` int(11) NOT NULL,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `precio` decimal(10,4) DEFAULT NULL,
  `minimo_horas` varchar(45) DEFAULT NULL,
  `maximo_horas` varchar(45) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idtemporada_Habitacion`),
  KEY `fk_temporada_has_Habitacion_temporada1` (`temporada_Idtemporada`),
  KEY `fk_temporada_has_Habitacion_Habitacion1` (`Habitacion_idHabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `NombreUsuario` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(256) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioaplicacion`
--

DROP TABLE IF EXISTS `usuarioaplicacion`;
CREATE TABLE `usuarioaplicacion` (
  `IdUsuarioAplicacion` int(11) NOT NULL AUTO_INCREMENT,
  `AplicacionRegistrada_IdAplicacionRegistrada` int(11) NOT NULL,
  `Usuario_IdPersona` int(11) NOT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdUsuarioAplicacion`),
  KEY `fk_UsuarioAplicacion_Usuario1` (`Usuario_IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variableapp`
--

DROP TABLE IF EXISTS `variableapp`;
CREATE TABLE `variableapp` (
  `IdVariableApp` int(11) NOT NULL AUTO_INCREMENT,
  `Agrupador` varchar(45) DEFAULT NULL,
  `Valor` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `IdAplicacionRegistrada` int(11) DEFAULT NULL,
  `user_inserted` int(11) DEFAULT NULL,
  `date_inserted` datetime DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `estadoregistro` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdVariableApp`)
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
  ADD CONSTRAINT `fk_AplicacionRegistrada_Usuario1` FOREIGN KEY (`Usuario_IdPersona`) REFERENCES `usuario` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_has_Aplicacion_Aplicacion1` FOREIGN KEY (`Aplicacion_IdAplicacion`) REFERENCES `aplicacion` (`IdAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cabecerareserva`
--
ALTER TABLE `cabecerareserva`
  ADD CONSTRAINT `FK_RESERVANTE` FOREIGN KEY (`IdReservante`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `fk_IdCajero` FOREIGN KEY (`IdCajero`) REFERENCES `usuarioaplicacion` (`IdUsuarioAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientetemporada`
--
ALTER TABLE `clientetemporada`
  ADD CONSTRAINT `fk_Cliente_temporada_temporada1` FOREIGN KEY (`temporada_Idtemporada`) REFERENCES `temporada` (`Idtemporada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_IdPersona` FOREIGN KEY (`persona_IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprobantepago`
--
ALTER TABLE `comprobantepago`
  ADD CONSTRAINT `fk_Comprobante_Pago_Caja1` FOREIGN KEY (`Caja_idCaja`) REFERENCES `caja` (`idCaja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IdCabecera_reserva` FOREIGN KEY (`IdCabecera_reserva`) REFERENCES `cabecerareserva` (`idCabecera_Reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IdPagador` FOREIGN KEY (`IdPagador`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallecomprobante`
--
ALTER TABLE `detallecomprobante`
  ADD CONSTRAINT `fk_Detalle_Comprobante_Comprobante_Pago1` FOREIGN KEY (`Comprobante_Pago_idComprobante_Pago`) REFERENCES `comprobantepago` (`idComprobante_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IdReserva` FOREIGN KEY (`IdReserva`) REFERENCES `reservahabitacion` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallepago`
--
ALTER TABLE `detallepago`
  ADD CONSTRAINT `fk_Detalle_Pago_Comprobante_Pago1` FOREIGN KEY (`Comprobante_Pago_idComprobante_Pago`) REFERENCES `comprobantepago` (`idComprobante_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_Ocupante_persona1` FOREIGN KEY (`Persona_IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ocupante_Reserva_Habitacion1` FOREIGN KEY (`Reserva_Habitacion_idReserva`) REFERENCES `reservahabitacion` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_Usuario1` FOREIGN KEY (`IdPersona`) REFERENCES `usuario` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productocombinacion`
--
ALTER TABLE `productocombinacion`
  ADD CONSTRAINT `fk_producto_combinacion_Producto1` FOREIGN KEY (`idproducto_salida`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productocombinaciondetalle`
--
ALTER TABLE `productocombinaciondetalle`
  ADD CONSTRAINT `fk_producto_combinacion_detalle_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_combinacion_detalle_producto_combinacion1` FOREIGN KEY (`producto_combinacion_idproducto_combinacion`) REFERENCES `productocombinacion` (`idproducto_combinacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reservahabitacion`
--
ALTER TABLE `reservahabitacion`
  ADD CONSTRAINT `fk_Reserva_Habitacion1` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Habitacion_Cabecera_Reserva1` FOREIGN KEY (`Cabecera_Reserva_idCabecera_Reserva`) REFERENCES `cabecerareserva` (`idCabecera_Reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rolasignado`
--
ALTER TABLE `rolasignado`
  ADD CONSTRAINT `fk_Rol_Asignado_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Rol_Asignado_UsuarioAplicacion1` FOREIGN KEY (`UsuarioAplicacion_IdUsuarioAplicacion`) REFERENCES `usuarioaplicacion` (`IdUsuarioAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `temporadahabitacion`
--
ALTER TABLE `temporadahabitacion`
  ADD CONSTRAINT `fk_temporada_has_Habitacion_Habitacion1` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_temporada_has_Habitacion_temporada1` FOREIGN KEY (`temporada_Idtemporada`) REFERENCES `temporada` (`Idtemporada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioaplicacion`
--
ALTER TABLE `usuarioaplicacion`
  ADD CONSTRAINT `fk_UsuarioAplicacion_Usuario1` FOREIGN KEY (`Usuario_IdPersona`) REFERENCES `usuario` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
