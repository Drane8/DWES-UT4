-- Primary key de la tabla cursillos
ALTER TABLE cursillos ADD PRIMARY KEY (CODCUR);

-- Primary key compuesta alumnoscursillos
ALTER TABLE alumnoscursillos ADD PRIMARY KEY (CODAL, CODCUR)