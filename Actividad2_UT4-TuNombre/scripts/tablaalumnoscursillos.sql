--
-- Estructura de tabla para la tabla `alumnoscursillos`
--

CREATE TABLE IF NOT EXISTS `alumnoscursillos` (
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
