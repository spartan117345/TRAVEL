-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-05-2026 a las 14:41:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `TRAVEL`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `costo` int(50) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `categoria` varchar(10) NOT NULL,
  `reseñas` varchar(50) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_establecimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nombre_admin` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `correo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atraccion`
--

CREATE TABLE `atraccion` (
  `id_atraccion` int(11) NOT NULL,
  `resenia` varchar(100) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `categoria` int(10) NOT NULL,
  `precio` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(15) NOT NULL,
  `nombre_ciudad` varchar(20) NOT NULL,
  `reseñas` varchar(60) NOT NULL,
  `tamaño` varchar(11) NOT NULL,
  `clima` varchar(11) NOT NULL,
  `historia` varchar(200) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `id_turista` int(11) NOT NULL,
  `id_atraccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `id_establecimiento` int(11) NOT NULL,
  `trasporte` varchar(20) NOT NULL,
  `hotel` varchar(20) NOT NULL,
  `restaurante` varchar(50) NOT NULL,
  `recuerdos` varchar(50) NOT NULL,
  `reseñas` varchar(70) NOT NULL,
  `costos` varchar(50) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turista`
--

CREATE TABLE `turista` (
  `id_turista` int(11) NOT NULL,
  `password` varchar(11) NOT NULL,
  `nombre_usuario` varchar(15) NOT NULL,
  `apellidos_usuario` varchar(20) NOT NULL,
  `cuenta_google` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `presupuesto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `id_ciudad` (`id_ciudad`,`id_establecimiento`),
  ADD KEY `id_establecimiento` (`id_establecimiento`);

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `atraccion`
--
ALTER TABLE `atraccion`
  ADD PRIMARY KEY (`id_atraccion`),
  ADD UNIQUE KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD UNIQUE KEY `id_atraccion` (`id_atraccion`),
  ADD KEY `id_usuario` (`id_turista`);

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`id_establecimiento`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `turista`
--
ALTER TABLE `turista`
  ADD PRIMARY KEY (`id_turista`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `actividad_ibfk_2` FOREIGN KEY (`id_establecimiento`) REFERENCES `establecimiento` (`id_establecimiento`);

--
-- Filtros para la tabla `atraccion`
--
ALTER TABLE `atraccion`
  ADD CONSTRAINT `atraccion_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_turista`) REFERENCES `turista` (`id_turista`),
  ADD CONSTRAINT `ciudad_ibfk_2` FOREIGN KEY (`id_atraccion`) REFERENCES `atraccion` (`id_atraccion`);

--
-- Filtros para la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD CONSTRAINT `establecimiento_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
