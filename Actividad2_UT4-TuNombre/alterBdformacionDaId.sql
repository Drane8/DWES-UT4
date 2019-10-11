-- Primary key de la tabla cursillos
ALTER TABLE cursillos ADD PRIMARY KEY (CODCUR);

-- Primary key compuesta alumnoscursillos
ALTER TABLE alumnoscursillos ADD PRIMARY KEY (CODAL, CODCUR)

--
ALTER TABLE profesores ADD PRIMARY KEY (CODP);

-- DA ERROR 
ALTER TABLE cursillos ADD FOREIGN KEY (CODP) REFERENCES
profesores(CODP)