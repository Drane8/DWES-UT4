--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE IF NOT EXISTS `alumnos` (
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
