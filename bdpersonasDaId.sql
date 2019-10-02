-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2019 a las 08:51:06
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
  `telefono` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `edad` int(3) NOT NULL,
  `sexo` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idPersona`, `nombre`, `telefono`, `apellido`, `edad`, `sexo`) VALUES
(1, 'Jone', NULL, 'Garcia', 33, 'm'),
(3, 'Elena', NULL, 'Redrado', 41, 'm'),
(4, 'David', NULL, 'Meca', 36, 'h'),
(5, 'Juan', NULL, 'Diego', 44, 'h'),
(6, 'Luisa', NULL, 'Martos', 54, 'm'),
(7, 'Iker', NULL, 'Lasa', 24, 'h'),
(8, 'Luis', NULL, 'Torralba', 45, 'h'),
(9, 'Pablo', NULL, 'Ortega López', 52, 'h'),
(10, 'Susana', NULL, 'Portu Lekuona', 38, 'm');

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
  MODIFY `idPersona` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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


--ACTIVIDADES:--

-- 1) Nombre, apellido y edad de las personas cuyo nombre terminan en A 

SELECT nombre, apellido, edad FROM personas WHERE nombre LIKE '%A'

--2) Todos los datos de los hombres

SELECT * FROM `personas` WHERE sexo = 'h'

--3) Cuántos solteros hay?

SELECT * FROM `personas` WHERE estadoC = 's'

--4) Datos de las personas que tengan en su nombre o en su apellido una 'e'

SELECT * FROM `personas` WHERE nombre LIKE '%e%' OR apellido LIKE '%e%'

-- 5) Media de edad de hombres y mujeres

SELECT AVG(edad) as "Media", sexo FROM `personas` GROUP BY sexo

-- 6) Cuántos nombres empiezan por 'E'?

SELECT count(nombre) as "Total" FROM `personas` WHERE nombre LIKE "E%"

--7) Añade las siguientes personas a la BD 
-- Pablo Ortega López, 52 años, viudo 

INSERT INTO `personas`(`nombre`, `apellido`, `edad`, `estadoC`, `sexo`) 
VALUES ("Pablo","Ortega López", 52, "v", "h")

-- Susana Portu Lekuona, 38 años, casada

INSERT INTO `personas`(`nombre`, `apellido`, `edad`, `estadoC`, `sexo`) 
VALUES ("Susana","Portu Lekuona", 38, "c", "m")

--8) Modifica el nombre de la persona con idPersona igual a 1 a Jone
--y a estado casada

UPDATE `personas` SET nombre = "Jone", estadoC = "c" WHERE idPersona = 1

--9) Borra las personas con menos de 22 años y sus referencias.
DELETE FROM personas_cursos
WHERE idPersona IN(SELECT idPersona from personas where edad < 22)

DELETE FROM personas WHERE edad < 22

--Renombrar una tabla en una base de datos
--10) ALTER TABLE personas RENAME TO new_person

ALTER TABLE personas RENAME TO new_person

--Añadir una columna a la tabla después de una especificada
--11) ALTER TABLE new_person ADD telefono VARCHAR(9) AFTER nombre

ALTER TABLE new_person ADD telefono VARCHAR(9) AFTER nombre

--Borrar una columna de la tabla
--ALTER TABLE new_person DROP estadoC

ALTER TABLE new_person DROP estadoC

--Vuelve a renombrar la tabla de la base de datos
--ALTER TABLE new_person RENAME TO personas 

ALTER TABLE new_person RENAME TO personas