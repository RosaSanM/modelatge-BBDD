-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2021 a las 12:07:03
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
-- Base de datos: `cul_dampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `brand_name` varchar(20) NOT NULL,
  `graduation_left` decimal(4,2) NOT NULL,
  `graduation_right` decimal(4,2) NOT NULL,
  `frame` enum('flotant','pasta','metàl.lica','') NOT NULL,
  `color_frame` varchar(20) NOT NULL,
  `color_glass_right` varchar(20) NOT NULL,
  `color_glass_left` varchar(20) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `brand_name`, `graduation_left`, `graduation_right`, `frame`, `color_frame`, `color_glass_right`, `color_glass_left`, `price`, `provider_id`) VALUES
(4, 'gafas chachi', '2.20', '0.99', 'pasta', 'red', 'transparwent', 'transparebnt', '320.20', 1),
(5, 'gafas mel', '0.99', '0.99', 'metàl.lica', 'black', 'no', 'no', '30.00', 2),
(6, 'brand gafas', '0.10', '0.10', 'pasta', 'blue', 'no', 'no', '15.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `adress` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `recomandation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `name`, `adress`, `phone`, `mail`, `date`, `recomandation`) VALUES
(1, 'pepi', 'calle coimnbra', '455454-44', 'mail@mail.com', '2021-03-23 11:20:03', NULL),
(2, 'mari antonia', 'calle roger de flor 2', '23-2323', 'hola@mail.com', '2021-03-23 11:20:03', 'su prima'),
(3, 'mari antoñi', 'plaza reial', '1213', 'mail@mail.com', '2021-03-23 11:20:40', 'un amigo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `id_buyer`
--

CREATE TABLE `id_buyer` (
  `id_buyer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `id_buyer`
--

INSERT INTO `id_buyer` (`id_buyer`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id_provider` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `street_number` int(11) NOT NULL,
  `flat_floor` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `nif` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id_provider`, `name`, `street`, `street_number`, `flat_floor`, `country`, `postcode`, `phone`, `fax`, `nif`) VALUES
(1, 'proveedor de gafas', 'calle industria', 1, '2', 'spain', '232323x', '455454-44', '', '2113r'),
(2, 'fabrica de gafas', 'street one', 2, '3', 'germany', '23f23fd2', '23-2323', '432434', '324345t'),
(3, 'super gafas', 'street sant cugat', 4, '4', 'spain', '2323', '2243242', '22324', '24234234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

CREATE TABLE `sale` (
  `id_sale` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `total_price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sale`
--

INSERT INTO `sale` (`id_sale`, `date`, `client_id`, `buyer_id`, `total_price`) VALUES
(3, '2021-03-23 10:50:11', 2, 1, '30.50'),
(4, '2021-03-23 10:50:55', 3, 1, '100.60'),
(5, '2021-03-23 10:50:55', 1, 1, '300.00'),
(6, '2021-03-23 10:50:55', 2, 2, '200.30'),
(7, '2021-03-23 10:50:55', 3, 1, '30.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_detail`
--

CREATE TABLE `sale_detail` (
  `id_sale_detail` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `quatity` int(11) NOT NULL,
  `total_price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sale_detail`
--

INSERT INTO `sale_detail` (`id_sale_detail`, `sale_id`, `brand_id`, `quatity`, `total_price`) VALUES
(1, 3, 6, 1, '30.50'),
(2, 4, 5, 3, '150.99'),
(3, 5, 6, 1, '300.99');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `id_buyer`
--
ALTER TABLE `id_buyer`
  ADD PRIMARY KEY (`id_buyer`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id_provider`);

--
-- Indices de la tabla `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id_sale`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indices de la tabla `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD PRIMARY KEY (`id_sale_detail`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `id_buyer`
--
ALTER TABLE `id_buyer`
  MODIFY `id_buyer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `id_provider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sale`
--
ALTER TABLE `sale`
  MODIFY `id_sale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sale_detail`
--
ALTER TABLE `sale_detail`
  MODIFY `id_sale_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id_provider`);

--
-- Filtros para la tabla `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `id_buyer` (`id_buyer`),
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`);

--
-- Filtros para la tabla `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD CONSTRAINT `sale_detail_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id_sale`),
  ADD CONSTRAINT `sale_detail_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id_brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
