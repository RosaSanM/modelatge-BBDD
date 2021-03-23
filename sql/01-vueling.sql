-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2021 a las 12:00:43
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vueling`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avions`
--

CREATE TABLE `avions` (
  `id_avio` int(11) NOT NULL,
  `capacitat` int(250) NOT NULL,
  `model` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `avions`
--

INSERT INTO `avions` (`id_avio`, `capacitat`, `model`) VALUES
(1, 150, '54dsd'),
(2, 200, '454ff'),
(3, 150, '54dsd'),
(4, 200, '454ff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seients`
--

CREATE TABLE `seients` (
  `id_seient` int(11) NOT NULL,
  `id_avio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seients`
--

INSERT INTO `seients` (`id_seient`, `id_avio`) VALUES
(1, 1),
(2, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`id_avio`);

--
-- Indices de la tabla `seients`
--
ALTER TABLE `seients`
  ADD PRIMARY KEY (`id_seient`),
  ADD KEY `id_avio` (`id_avio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avions`
--
ALTER TABLE `avions`
  MODIFY `id_avio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `seients`
--
ALTER TABLE `seients`
  MODIFY `id_seient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `seients`
--
ALTER TABLE `seients`
  ADD CONSTRAINT `seients_ibfk_1` FOREIGN KEY (`id_avio`) REFERENCES `avions` (`id_avio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
