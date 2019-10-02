-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2018 a las 12:56:46
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdpersonas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idCurso` int(3) NOT NULL,
  `nombreCurso` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `horas` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `nombreCurso`, `horas`) VALUES
(1, 'XHTML y CSS', 45),
(2, 'PHP y MySQL', 60),
(3, 'Desarrollo de aplicaciones con Android', 100),
(4, 'Seguridad en PHP', 75),
(5, 'Joomla 1.6', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(3) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `edad` int(3) NOT NULL,
  `estadoC` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idPersona`, `nombre`, `apellido`, `edad`, `estadoC`, `sexo`) VALUES
(1, 'Ana', 'Garcia', 33, 's', 'm'),
(2, 'Aberto', 'Ruiz', 21, 's', 'h'),
(3, 'Elena', 'Redrado', 41, 'c', 'm'),
(4, 'David', 'Meca', 36, 's', 'h'),
(5, 'Juan', 'Diego', 44, 'd', 'h'),
(6, 'Luisa', 'Martos', 54, 'd', 'm'),
(7, 'Iker', 'Lasa', 24, 'c', 'h'),
(8, 'Luis', 'Torralba', 45, 'c', 'h');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_cursos`
--

CREATE TABLE `personas_cursos` (
  `idPersona` int(3) NOT NULL,
  `idCurso` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `personas_cursos`
--

INSERT INTO `personas_cursos` (`idPersona`, `idCurso`) VALUES
(2, 3),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(5, 1),
(6, 1),
(6, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `personas_cursos`
--
ALTER TABLE `personas_cursos`
  ADD PRIMARY KEY (`idPersona`,`idCurso`),
  ADD KEY `idCurso` (`idCurso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personas_cursos`
--
ALTER TABLE `personas_cursos`
  ADD CONSTRAINT `personas_cursos_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personas_cursos_ibfk_2` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
