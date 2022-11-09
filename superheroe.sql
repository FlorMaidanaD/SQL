DROP DATABASE IF EXISTS superheroe;
CREATE DATABASE superheroe CHARACTER SET utf8mb4;
USE superheroe;

CREATE TABLE creador (
  id_creador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL
);
INSERT INTO creador (nombre) VALUES ('Marvel');
INSERT INTO creador (nombre) VALUES ('DCComics');
SELECT * FROM creador;

CREATE TABLE personaje (
  id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre_real VARCHAR(20) NOT NULL,
  personaje VARCHAR(20) NOT NULL,
  inteligencia INT(10) NOT NULL,
  fuerza VARCHAR(10) NOT NULL,
  velocidad INT(11) NOT NULL,
  poder INT(11) NOT NULL,
  aparicion INT(11) NOT NULL,
  ocupacion VARCHAR(30) NULL,
  id_creador INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
);
/*inserto la informacion*/

INSERT INTO personaje VALUES (1, 'Bruce Banner', 'Hulk', 160, '600 mil', 75, 98, 1962, 'Físico nuclear', 1);
INSERT INTO personaje VALUES (2, 'Tony Stark', 'Iron Man', 170, '200 mil', 70, 123, 1963, 'Inventor Industrial', 1);
INSERT INTO personaje VALUES (3, 'Thor Odinson', 'Thor', 145, 'infinita', 100, 235, 1962, 'Rey de Asgard', 1);
INSERT INTO personaje VALUES (4, 'ClarckKent', 'Superman', 165, 'infinita', 120, 182, 1948, 'Reportero', 2);
INSERT INTO personaje VALUES (5, 'Barry Allen', 'Flash', 160, '10 mil', 120, 168, 1956, 'Científico forense', 2);
INSERT INTO personaje VALUES (6, 'Thanos', 'Thanos', 170, 'infinita', 40, 306, 1973, 'Adorador de la muerte', 1);
SELECT * FROM personaje;


#	ACTUALIZAR AÑO a 1938 ////////////////////////////////////////////////////////////////////////////

UPDATE personaje
SET aparicion = 1938
WHERE personaje='Superman';

#	BORRAR PERSONAJE ///////////////////////////////////////////////////////////////////////////////

delete from personaje where id_personaje = 5;

# actividad 6 Ahora veamos cómo ha quedado la tabla “superheroes” que creaste anteriormente. Para ello necesitarás una consulta de tipo SELECT.

#b) Realiza una consulta que devuelva todos los valores de la columna “nombre_real” de la tabla
#superhéroe.

SELECT * FROM personaje;
SELECT nombre_real FROM personaje;
#c) Realiza una consulta que devuelva todos los nombres reales de los personajes cuyo nombre
#empieza con “B”.
SELECT nombre_real FROM personaje WHERE nombre_real LIKE 'B%';

# Actividad 7
#Pongamos a prueba esta nueva cláusula: order by. Seguiremos trabajando con la tabla
#“superhéroe”. Realiza una consulta que devuelva todos los registros ordenados por “inteligencia”.

SELECT * FROM personaje ORDER BY inteligencia ASC;
SELECT * FROM personaje ORDER BY inteligencia DESC;

