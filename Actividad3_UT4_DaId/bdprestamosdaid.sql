-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2019 a las 14:01:50
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
-- Base de datos: `bdprestamosdaid`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `numPrestamosDaId` (IN `fechaInicio` DATE, IN `fechaFin` DATE)  BEGIN
SELECT count(*) as "Total prestamos"
    	FROM prestamos
   	WHERE fecha BETWEEN fechaInicio AND fechaFin;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `numPrestamosDaId_Salida` (IN `fechaInicio` DATE, IN `fechaFin` DATE, OUT `total` INT)  BEGIN
	SELECT count(*) as "Total prestamos" 
    FROM prestamos
   	WHERE fecha BETWEEN fechaInicio AND fechaFin 
    INTO total;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prestamosFechaDaId` (IN `fechaInicio` DATE, IN `fechaFin` DATE)  BEGIN
	SELECT * 
    FROM prestamos
    WHERE fecha BETWEEN fechaInicio AND fechaFin;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fechaMesDaId` (`vfecha` DATE) RETURNS VARCHAR(20) CHARSET utf8 COLLATE utf8_unicode_ci BEGIN
DECLARE salida varchar(20);
SET salida =  CASE month(vfecha)
  when 1 then 'Enero'
  when 2 then 'Febrero'
  when 3 then 'Marzo'
  when 4 then 'Abril'
  when 5 then 'Mayo'
  when 6 then 'Junio'
  when 7 then 'Julio'
  when 8 then 'Agosto'
  when 9 then 'Septiembre'
  when 10 then 'Octubre'
  when 11 then 'Noviembre'
  when 12 then 'Diciembre'
  else "No es correcto" end ;
RETURN concat(salida, " del ", year(vfecha));
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carnets`
--

CREATE TABLE `carnets` (
  `IdCarnet` tinyint(4) NOT NULL,
  `DNI` int(11) NOT NULL,
  `FechaCont` date NOT NULL,
  `Oficina` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `carnets`
--

INSERT INTO `carnets` (`IdCarnet`, `DNI`, `FechaCont`, `Oficina`, `Tipo`) VALUES
(1, 16325102, '2008-04-10', 'Central', 'Super'),
(2, 26325102, '2008-05-20', 'Central', 'Super'),
(3, 36325102, '2008-03-11', 'Central', 'Extra'),
(4, 46325102, '2008-03-21', 'Biblosa', 'Super'),
(5, 56325102, '2008-02-20', 'Promocion', 'Normal'),
(6, 66325102, '2008-04-20', 'Promocion', 'Super'),
(7, 76325102, '2008-03-01', 'Central', 'Expulsado'),
(8, 86325102, '2008-04-30', 'Biblosa', 'Extra'),
(9, 96325102, '2010-05-31', 'Central', 'Extra'),
(10, 10156329, '2010-03-22', 'Producción', 'Corriente'),
(11, 11156329, '2010-03-02', 'Telefono', 'Normal'),
(12, 12156329, '2010-03-12', 'Telefono', 'Extra'),
(13, 13156329, '2010-04-01', 'Biblosa', 'Expulsado'),
(14, 14156329, '2010-04-21', 'Biblosa', 'Normal'),
(15, 15156329, '2010-05-21', 'Central', 'Corriente'),
(16, 16156329, '2010-05-21', 'Central', 'Super'),
(17, 17156329, '2010-05-31', 'Biblosa', 'Corriente'),
(18, 18156329, '2010-02-20', 'Producción', 'Extra'),
(19, 19156329, '2008-04-10', 'Biblosa', 'Super'),
(20, 20256314, '2010-05-21', 'Biblosa', 'Normal'),
(21, 21256314, '2008-05-20', 'Central', 'Expulsado'),
(22, 22256314, '2008-03-21', 'Central', 'Corriente'),
(23, 23256314, '2010-05-01', 'Telefono', 'Extra'),
(24, 24256314, '2010-05-31', 'Telefono', 'Corriente'),
(25, 25256314, '2008-02-10', 'Biblosa', 'Normal'),
(26, 26256314, '2008-02-10', 'Biblosa', 'Super'),
(27, 27256314, '2010-03-12', 'Biblosa', 'Super'),
(28, 28256314, '2010-03-22', 'Biblosa', 'Corriente'),
(29, 29256314, '2008-03-01', 'Telefono', 'Extra'),
(30, 30256314, '2008-02-10', 'Central', 'Super'),
(31, 31256314, '2010-05-11', 'Biblosa', 'Extra'),
(32, 32256314, '2010-05-11', 'Biblosa', 'Normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `Isbn` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `Titulo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Autor` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tema` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`Isbn`, `Titulo`, `Autor`, `Tema`) VALUES
('8424094002683', 'La maté por que era Mía', 'Mariano Cortico', 'Historia'),
('8424094003683', 'El resplandor rojo', 'Pedro Pedralbes', 'Geografía'),
('8424094004683', 'Monte lejano', 'Jose Mandamas', 'Geografía'),
('8424094005683', 'Pino rojo', 'Diego Anton', 'Geología'),
('8424094014683', 'El último grito', 'Esteban Mayor', 'Novela'),
('8424094024683', 'Rie si puedes', 'Nolose Puede', 'Historia'),
('8424094034683', 'Toma tomate', 'Kohito Kaxi', 'Teatro'),
('8424094044683', 'Malo o peor', 'Colon Casiano', NULL),
('8424094054683', 'Esta no es buena', 'Paris Madrid', 'Novela'),
('8424094064683', 'Allí si que están', 'Geografía', ''),
('8424094074683', 'Esto no es ', 'Tio Sam', 'Historia'),
('8424094104683', 'La maté por que era Mía', 'Alfredo Hachicoria', 'Novela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `IdFicha` int(11) NOT NULL,
  `IdCarnet` tinyint(4) NOT NULL,
  `Fecha` date NOT NULL,
  `Isbn` char(13) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`IdFicha`, `IdCarnet`, `Fecha`, `Isbn`) VALUES
(1, 8, '2012-04-20', '8424094054683'),
(2, 28, '2012-03-21', '8424094034683'),
(3, 9, '2012-03-21', '8424094004683'),
(4, 17, '2012-04-10', '8424094004683'),
(5, 23, '2012-02-10', '8424094005683'),
(6, 4, '2012-02-10', '8424094004683'),
(7, 17, '2012-03-01', '8424094034683'),
(8, 4, '2012-05-20', '8424094074683'),
(9, 6, '2012-05-20', '8424094034683'),
(10, 28, '2012-03-11', '8424094024683'),
(11, 17, '2012-03-21', '8424094034683'),
(12, 4, '2012-02-20', '8424094074683'),
(13, 1, '2012-04-30', '8424094005683'),
(14, 4, '2012-03-01', '8424094074683'),
(15, 25, '2012-03-11', '8424094014683'),
(16, 32, '2012-02-20', '8424094004683'),
(17, 24, '2012-05-30', '8424094014683'),
(18, 29, '2012-04-10', '8424094005683'),
(21, 26, '2012-04-30', '8424094005683'),
(22, 22, '2012-04-10', '8424094002683'),
(23, 23, '2012-05-10', '8424094104683'),
(24, 26, '2012-03-31', '8424094014683'),
(25, 14, '2012-02-10', '8424094034683'),
(26, 8, '2012-05-30', '8424094014683'),
(27, 22, '2012-03-21', '8424094034683'),
(28, 16, '2012-05-20', '8424094034683'),
(29, 20, '2012-03-01', '8424094005683'),
(30, 10, '2012-03-11', '8424094014683'),
(31, 27, '2012-03-11', '8424094034683'),
(32, 15, '2012-05-30', '8424094014683'),
(33, 8, '2012-04-20', '8424094014683'),
(34, 28, '2012-03-21', '8424094024683'),
(35, 9, '2012-03-21', '8424094004683'),
(36, 17, '2012-04-10', '8424094004683'),
(37, 23, '2012-02-10', '8424094004683'),
(38, 4, '2012-02-10', '8424094004683'),
(39, 17, '2012-03-01', '8424094004683'),
(40, 4, '2012-05-20', '8424094014683'),
(41, 6, '2012-05-20', '8424094004683'),
(42, 28, '2012-03-11', '8424094024683'),
(43, 17, '2012-03-21', '8424094074683'),
(44, 4, '2012-02-20', '8424094004683'),
(45, 1, '2012-04-30', '8424094014683'),
(46, 4, '2012-03-01', '8424094054683'),
(47, 25, '2012-03-11', '8424094024683'),
(48, 32, '2012-02-20', '8424094074683'),
(49, 24, '2012-05-30', '8424094004683'),
(50, 29, '2012-04-10', '8424094014683'),
(53, 26, '2012-04-30', '8424094002683'),
(54, 22, '2012-04-10', '8424094002683'),
(55, 23, '2012-05-10', '8424094004683'),
(56, 26, '2012-03-31', '8424094002683'),
(57, 14, '2012-02-10', '8424094024683'),
(58, 8, '2012-05-30', '8424094005683'),
(59, 22, '2012-03-21', '8424094002683'),
(60, 16, '2012-05-20', '8424094074683'),
(61, 20, '2012-03-01', '8424094005683'),
(62, 10, '2012-03-11', '8424094024683'),
(63, 27, '2012-03-11', '8424094024683'),
(64, 15, '2012-05-30', '8424094014683'),
(65, 4, '2012-05-20', '8424094024683'),
(66, 6, '2012-05-20', '8424094024683'),
(67, 28, '2012-03-11', '8424094034683'),
(68, 17, '2012-03-21', '8424094054683'),
(69, 4, '2012-02-20', '8424094004683'),
(70, 1, '2012-04-30', '8424094024683'),
(71, 4, '2012-03-01', '8424094104683'),
(72, 32, '2012-02-20', '8424094054683');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `FechaNac` date DEFAULT NULL,
  `CalleNo` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Localidad` varchar(60) COLLATE utf8_unicode_ci DEFAULT 'Pamplona',
  `Provincia` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'Navarra',
  `Telefono` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`DNI`, `Nombre`, `Apellidos`, `FechaNac`, `CalleNo`, `Localidad`, `Provincia`, `Telefono`) VALUES
(10156329, 'Rogelia', 'Zarra García', '1986-11-21', 'Mayor ,19', 'Pamplona', 'Navarra', '918726159'),
(11156329, 'Marta', 'Giokoetxea Esbort', '1989-04-01', 'Milagro,5', 'Donostia', 'Navarra', '975513003'),
(12156329, 'Marta', 'Mendia García', '1960-08-05', 'Corta,18', 'Estella', 'Navarra', '932273126'),
(13156329, 'Antonio', 'Tortola Garzon', '1986-06-11', 'Gral Malo,1', 'Buñuel', 'Navarra', '907905633'),
(14156329, 'Ohiana', 'Garzon Mendia', '1967-10-23', 'Corta,6', 'Madrid', 'Navarra', '981089531'),
(15156329, 'Marta', 'Gomez Tortola', '1982-05-07', 'Nagusia,1', 'Pamplona', 'Navarra', '960054145'),
(16156329, 'Antonio', 'Tortola Giroto', '1966-10-31', 'Larga,11', 'Madrid', 'Navarra', '974167308'),
(16325102, 'Zigor', 'Tortola Esbort', '1974-03-16', 'Encartaciones,18', 'Pamplona', 'Navarra', '945675608'),
(17156329, 'Antonio', 'Giroto Tortola', '1987-08-10', 'Pez,14', 'Pamplona', 'Navarra', '916753682'),
(18156329, 'Eufrasio', 'Zarra Mantua', '1961-03-18', 'Encartaciones,15', 'Pamplona', 'Navarra', ''),
(19156329, 'Ander', 'Gomez Garzon', '1978-06-25', 'Encartaciones,18', 'Pamplona', 'Navarra', '952153150'),
(20256314, 'Zigor', 'Esbort Giokoetxea', '1970-05-24', 'Larga,22', 'Madrid', 'Madrid', '940492806'),
(21256314, 'Ander', 'García García', '1985-05-13', 'Larga,12', 'Logroño', 'Navarra', '918793202'),
(22256314, 'Ohier', 'Giokoetxea Tortola', '1989-01-25', 'Gral Malo,7', 'Pamplona', 'Navarra', '923370807'),
(23256314, 'Eufrasio', 'Esbort Tortola', '1966-02-02', 'Zapatería,10', 'Pamplona', 'Navarra', '962130349'),
(24256314, 'Felisa', 'Garzon Garzon', '1973-09-12', 'Milagro,13', 'Pamplona', 'Navarra', '901070821'),
(25256314, 'Marta', 'Tortola Giokoetxea', '1988-11-23', 'Nagusia,13', 'Tudela', 'Navarra', '901324458'),
(26256314, 'Ohier', 'Giroto Gomez', '1967-10-06', 'Corta,9', 'Donostia', 'Navarra', '908121413'),
(26325102, 'Marisa', 'Tortola Giokoetxea', '1978-08-15', 'Pez,19', 'Buñuel', 'Navarra', '977068464'),
(27256314, 'Felisa', 'Zarra Mendia', '1990-01-29', 'Zapatería,14', 'Estella', 'Navarra', '984261500'),
(28256314, 'Antonio', 'Zarra Tortola', '1967-12-03', 'Milagro,0', 'Pamplona', 'Navarra', '926319336'),
(29256314, 'Ohiana', 'Giokoetxea Giokoetxea', '1961-10-24', 'Gral Malo,5', 'Donostia', 'Navarra', '903193349'),
(30256314, 'Ander', 'Mendia Zarra', '1990-06-26', 'Milagro,1', 'Buñuel', 'Navarra', '935256568'),
(31256314, 'Antonio', 'Gomez García', '1965-02-17', 'Pez,2', 'Logroño', 'Logroño', '952208509'),
(32256314, 'Felisa', 'Zarra Zarra', '1967-08-05', 'Larga,6', 'Buñuel', 'Navarra', '926853546'),
(36325102, 'Ohier', 'Giokoetxea Mendia', '1986-08-31', 'Encartaciones,16', 'Pamplona', 'Navarra', '969090854'),
(46325102, 'Ohiana', 'Mendia Mantua', '1993-01-30', 'Gral Malo,12', 'Pamplona', 'Navarra', '975922128'),
(56325102, 'Zigor', 'García Giokoetxea', '1983-05-22', 'Libertad,6', 'Logroño', 'Logroño', '921477720'),
(66325102, 'Zigor', 'Mantua Giokoetxea', '1989-11-15', 'Libertad,9', 'Pamplona', 'Navarra', '936662432'),
(76325102, 'Antonio', 'García Giokoetxea', '1976-04-09', 'Larga,16', 'Buñuel', 'Navarra', '904847447'),
(86325102, 'Zigor', 'Giokoetxea Mantua', '1965-11-19', 'Pez,15', 'Pamplona', 'Navarra', '953829111'),
(96325102, 'Felisa', 'García Giroto', '1959-07-14', 'Milagro,18', 'Donostia', 'Gipuzkoa', '920865984');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_resumendaid`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_resumendaid` (
`MES CONTRATACION` varchar(20)
,`NUMERO` tinyint(4)
,`NOMBRE` varchar(92)
,`TELEFONO` varchar(10)
,`LIBROS` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_resumendaid`
--
DROP TABLE IF EXISTS `vista_resumendaid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_resumendaid`  AS  select `fechaMesDaId`(`c`.`FechaCont`) AS `MES CONTRATACION`,`c`.`IdCarnet` AS `NUMERO`,concat(`s`.`Apellidos`,', ',`s`.`Nombre`) AS `NOMBRE`,`s`.`Telefono` AS `TELEFONO`,count(`p`.`IdFicha`) AS `LIBROS` from ((`carnets` `c` join `prestamos` `p` on((`c`.`IdCarnet` = `p`.`IdCarnet`))) join `socios` `s` on((`s`.`DNI` = `c`.`DNI`))) group by `p`.`IdCarnet`,month(`p`.`Fecha`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carnets`
--
ALTER TABLE `carnets`
  ADD PRIMARY KEY (`IdCarnet`),
  ADD KEY `FkCon` (`DNI`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`Isbn`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`IdFicha`),
  ADD KEY `Fk_HorasP` (`Isbn`),
  ADD KEY `Fk_horasz` (`IdCarnet`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carnets`
--
ALTER TABLE `carnets`
  MODIFY `IdCarnet` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `IdFicha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carnets`
--
ALTER TABLE `carnets`
  ADD CONSTRAINT `FkCon` FOREIGN KEY (`DNI`) REFERENCES `socios` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `Fk_HorasP` FOREIGN KEY (`Isbn`) REFERENCES `libros` (`Isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_horasz` FOREIGN KEY (`IdCarnet`) REFERENCES `carnets` (`IdCarnet`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
