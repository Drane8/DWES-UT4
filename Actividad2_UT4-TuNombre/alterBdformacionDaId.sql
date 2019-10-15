-- Primary key de la tabla cursillos
ALTER TABLE cursillos ADD PRIMARY KEY (CODCUR);

-- Primary key compuesta alumnoscursillos
ALTER TABLE alumnoscursillos ADD PRIMARY KEY (CODAL, CODCUR)

--Primary key de tabla profesores
ALTER TABLE profesores ADD PRIMARY KEY (CODP);

-- Foreign key de tabla cursillso que referencia a profesores
ALTER TABLE cursillos ADD FOREIGN KEY (CODP) REFERENCES profesores(CODP)

--Primary Key de la tabla departamentos
ALTER TABLE departamentos ADD PRIMARY KEY (CODDEP)

--Foreign key de la tabla profesores que referencia a departamentos
ALTER TABLE profesores ADD FOREIGN KEY (CODDEP) REFERENCES departamentos(CODDEP)