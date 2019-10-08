--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
  `CODDEP` varchar(2) NOT NULL,
  `NOMDEP` varchar(35) NOT NULL,
  `PLANTA` int(11) NOT NULL,
  `PRESUPUESTO` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`CODDEP`, `NOMDEP`, `PLANTA`, `PRESUPUESTO`) VALUES
('D1', 'INFORMÁTICA', 1, '20000.00'),
('D2', 'ADMINISTRATIVO', 2, '10000.00');

-- --------------------------------------------------------