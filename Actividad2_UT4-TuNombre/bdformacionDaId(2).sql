-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2019 a las 14:03:51
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdformaciondaid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `CODAL` varchar(2) NOT NULL,
  `NOMAL` varchar(25) DEFAULT NULL,
  `DIRAL` varchar(25) DEFAULT NULL,
  `POB` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`CODAL`, `NOMAL`, `DIRAL`, `POB`) VALUES
('A1', 'Iker Lasa', 'C/La Ermita s/n', 'ATARRABIA'),
('A2', 'Ane Aranburu', 'Avda. Central 5', 'BARAÑAIN'),
('A3', 'Amalia Naya', 'C/Magdalena s/n', 'PAMPLONA'),
('A4', 'Jon Naya', 'C/Magdalena s/n', 'PAMPLONA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnoscursillos`
--

CREATE TABLE `alumnoscursillos` (
  `CODAL` varchar(2) NOT NULL DEFAULT '',
  `CODCUR` varchar(2) NOT NULL DEFAULT '',
  `NOTA` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnoscursillos`
--

INSERT INTO `alumnoscursillos` (`CODAL`, `CODCUR`, `NOTA`) VALUES
('A1', 'C1', '9.0'),
('A2', 'C2', '8.0'),
('A3', 'C1', '9.0'),
('A3', 'C2', '9.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursillos`
--

CREATE TABLE `cursillos` (
  `CODCUR` varchar(2) NOT NULL,
  `NOMCUR` varchar(25) NOT NULL,
  `NUMHORAS` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `CODP` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursillos`
--

INSERT INTO `cursillos` (`CODCUR`, `NOMCUR`, `NUMHORAS`, `FECHA`, `CODP`) VALUES
('C1', 'SO', 300, '2016-04-24', 'P1'),
('C2', 'HW', 150, '2016-03-21', 'P3'),
('C3', 'HTML', 200, '2015-11-12', 'P1'),
('C4', 'CONTABILIDAD', 200, '2015-12-12', 'P2'),
('C5', 'FOL', 200, '2015-12-12', 'P2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `CODDEP` varchar(2) NOT NULL,
  `NOMDEP` varchar(35) NOT NULL,
  `PLANTA` int(11) NOT NULL,
  `PRESUPUESTO` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`CODDEP`, `NOMDEP`, `PLANTA`, `PRESUPUESTO`) VALUES
('D1', 'INFORMÁTICA', 1, '20000.00'),
('D2', 'ADMINISTRATIVO', 2, '10000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `CODP` varchar(2) NOT NULL,
  `NOMP` varchar(25) NOT NULL,
  `NIVEL` varchar(1) NOT NULL,
  `FECCONTRATO` date NOT NULL,
  `SALARIO` decimal(6,2) DEFAULT NULL,
  `CODDEP` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`CODP`, `NOMP`, `NIVEL`, `FECCONTRATO`, `SALARIO`, `CODDEP`) VALUES
('P1', 'Patricia Pérez', 'A', '2008-10-05', '1500.00', 'D1'),
('P2', 'Paula Puerta', 'B', '2016-03-19', '1300.00', 'D2'),
('P3', 'Roman Leitio', 'A', '2015-03-19', '1700.00', 'D1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`CODAL`);

--
-- Indices de la tabla `alumnoscursillos`
--
ALTER TABLE `alumnoscursillos`
  ADD PRIMARY KEY (`CODAL`,`CODCUR`),
  ADD KEY `CODCUR` (`CODCUR`);

--
-- Indices de la tabla `cursillos`
--
ALTER TABLE `cursillos`
  ADD PRIMARY KEY (`CODCUR`),
  ADD KEY `CODP` (`CODP`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`CODDEP`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`CODP`),
  ADD KEY `CODDEP` (`CODDEP`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnoscursillos`
--
ALTER TABLE `alumnoscursillos`
  ADD CONSTRAINT `alumnoscursillos_ibfk_1` FOREIGN KEY (`CODAL`) REFERENCES `alumnos` (`CODAL`),
  ADD CONSTRAINT `alumnoscursillos_ibfk_2` FOREIGN KEY (`CODCUR`) REFERENCES `cursillos` (`CODCUR`);

--
-- Filtros para la tabla `cursillos`
--
ALTER TABLE `cursillos`
  ADD CONSTRAINT `cursillos_ibfk_1` FOREIGN KEY (`CODP`) REFERENCES `profesores` (`CODP`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`CODDEP`) REFERENCES `departamentos` (`CODDEP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
