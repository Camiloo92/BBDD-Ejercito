-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2024 a las 04:24:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias`
--

CREATE TABLE `compañias` (
  `id_compañia` int(5) NOT NULL,
  `actividad_compañia` varchar(20) NOT NULL,
  `nombre` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias_cuarteles`
--

CREATE TABLE `compañias_cuarteles` (
  `Compañiascodigo_compañia` int(5) NOT NULL,
  `Cuartelescodigo_cuartel` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `id_cuartel` int(5) NOT NULL,
  `primer_nombre_cuartel` varchar(10) NOT NULL,
  `segundo_nombre_cuartel` varchar(255) DEFAULT NULL,
  `ubicaciónid_ubicacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpos`
--

CREATE TABLE `cuerpos` (
  `id_cuerpos` int(5) NOT NULL,
  `denominacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicios` int(5) NOT NULL,
  `actividad_servicios` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `id_soldado` int(5) NOT NULL,
  `primer_nombre` varchar(11) DEFAULT NULL,
  `segundo_nombre` varchar(11) DEFAULT NULL,
  `primer_apellido` varchar(11) DEFAULT NULL,
  `segundo_apellido` varchar(11) DEFAULT NULL,
  `grado` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldados`
--

CREATE TABLE `soldados` (
  `id` int(5) NOT NULL,
  `primer_nombre` varchar(255) NOT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellid` varchar(255) NOT NULL,
  `grado` varchar(255) NOT NULL,
  `id_compañia_compañia` int(5) NOT NULL,
  `id_cuerpos_cuerpos` int(5) NOT NULL,
  `id_cuartel_cuartel` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldados_servicios`
--

CREATE TABLE `soldados_servicios` (
  `id_soldado` int(5) NOT NULL,
  `id_servicios_servicios` int(5) NOT NULL,
  `fecha_realizacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicación`
--

CREATE TABLE `ubicación` (
  `id_ubicacion` int(10) NOT NULL,
  `departamento` varchar(10) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `localidad` varchar(10) NOT NULL,
  `direccion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañias`
--
ALTER TABLE `compañias`
  ADD PRIMARY KEY (`id_compañia`);

--
-- Indices de la tabla `compañias_cuarteles`
--
ALTER TABLE `compañias_cuarteles`
  ADD PRIMARY KEY (`Compañiascodigo_compañia`,`Cuartelescodigo_cuartel`),
  ADD KEY `FKCompañias_662948` (`Cuartelescodigo_cuartel`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`id_cuartel`),
  ADD KEY `FKCuarteles316966` (`ubicaciónid_ubicacion`);

--
-- Indices de la tabla `cuerpos`
--
ALTER TABLE `cuerpos`
  ADD PRIMARY KEY (`id_cuerpos`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`id_soldado`);

--
-- Indices de la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSoldados924950` (`id_compañia_compañia`),
  ADD KEY `FKSoldados584788` (`id_cuerpos_cuerpos`),
  ADD KEY `FKSoldados86511` (`id_cuartel_cuartel`);

--
-- Indices de la tabla `soldados_servicios`
--
ALTER TABLE `soldados_servicios`
  ADD PRIMARY KEY (`id_soldado`,`id_servicios_servicios`),
  ADD KEY `FKSoldados_S319846` (`id_servicios_servicios`);

--
-- Indices de la tabla `ubicación`
--
ALTER TABLE `ubicación`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañias`
--
ALTER TABLE `compañias`
  MODIFY `id_compañia` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `id_cuartel` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpos`
--
ALTER TABLE `cuerpos`
  MODIFY `id_cuerpos` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicios` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `id_soldado` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldados`
--
ALTER TABLE `soldados`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicación`
--
ALTER TABLE `ubicación`
  MODIFY `id_ubicacion` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compañias_cuarteles`
--
ALTER TABLE `compañias_cuarteles`
  ADD CONSTRAINT `FKCompañias1` FOREIGN KEY (`Compañiascodigo_compañia`) REFERENCES `compañias` (`id_compañia`),
  ADD CONSTRAINT `FKCompañias2` FOREIGN KEY (`Cuartelescodigo_cuartel`) REFERENCES `cuarteles` (`id_cuartel`);

--
-- Filtros para la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD CONSTRAINT `FKCuarteles1` FOREIGN KEY (`ubicaciónid_ubicacion`) REFERENCES `ubicación` (`id_ubicacion`);

--
-- Filtros para la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD CONSTRAINT `FKSoldados1` FOREIGN KEY (`id_cuerpos_cuerpos`) REFERENCES `cuerpos` (`id_cuerpos`),
  ADD CONSTRAINT `FKSoldados2` FOREIGN KEY (`id_cuartel_cuartel`) REFERENCES `cuarteles` (`id_cuartel`),
  ADD CONSTRAINT `FKSoldados3` FOREIGN KEY (`id_compañia_compañia`) REFERENCES `compañias` (`id_compañia`);

--
-- Filtros para la tabla `soldados_servicios`
--
ALTER TABLE `soldados_servicios`
  ADD CONSTRAINT `FKSoldados4` FOREIGN KEY (`id_servicios_servicios`) REFERENCES `servicios` (`id_servicios`),
  ADD CONSTRAINT `FKSoldados5` FOREIGN KEY (`id_soldado`) REFERENCES `soldados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
