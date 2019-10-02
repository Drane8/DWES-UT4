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

