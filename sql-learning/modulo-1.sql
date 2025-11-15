-- ================================================
-- MODULO 1 - IBM Data Science SQL Course
-- ================================================

/*
Tipos de Sentencias SQL:

Esencial para data science: DDL y DML. Los otros son para administradores.

1. DDL (Data Definition Language) Define la estructura.

   - CREATE: crear tablas, bases de datos
   - ALTER: modificar estructura
   - DROP: eliminar tablas/bases de datos
   - TRUNCATE: Elimina todos los registros al instante, no usa WHERE.
  

2. DML (Data Manipulation Language) Manipula el contenido.

   - SELECT: consultar datos
   - INSERT: agregar datos
   - UPDATE: modificar datos
   - DELETE: eliminar datos
  

3. DCL (Data Control Language) Control de acceso

   - GRANT: otorga permisos
   - REVOKE: quita permisos
 

4. TCL (Transaction Control Language) Gestiona transacciones

   - COMMIT: confirma cambios
   - ROLLBACK: deshace cambios
   - SAVEPOINT: punto de guardado

*/


-- Creamos la Base de Datos
CREATE TABLE FilmLocations (
  index INT,
  Title TEXT,
  Release_Year INT,
  Locations TEXT,
  Fun_Facts TEXT,
  Production_Company TEXT,
  Distributor TEXT,
  Director TEXT,
  Writer TEXT,
  Actor_1 TEXT,
  Actor_2 TEXT,
  Actor_3 TEXT
);

-- La importamos 
COPY FilmLocations FROM 'C:/PROYECTOS/SQL/FilmLocations.csv' WITH (FORMAT csv, HEADER true);

-- Exploracion de la Base de Datos
SELECT * FROM FilmLocations;

-- Descripciones de los atributos de la tabla

/*

FilmLocations(
Title:              titles of the films, 
Release_Year:        time of public release of the films, 
Locations:          locations of San Francisco where the films were shot, 
Fun_Facts:           funny facts about the filming locations, 
Production_Company:  companies who produced the films, 
Distributor:        companies who distributed the films, 
Director:           people who directed the films, 
Writer:             people who wrote the films, 
Actor_1:             person 1 who acted in the films, 
Actor_2:             person 2 who acted in the films, 
Actor_3:             person 3 who acted in the films

)
*/

-- Recuperamos los nombres de la peliculas y nombres del director y escritor
SELECT Title, Director, Writer FROM FilmLocations;

-- Nombre, ubicacion y año de estreno. Pero restringido solo los registros de peliculas de 2001 en adelante
SELECT title, locations, release_year FROM FilmLocations WHERE release_year >= 2001;

-- Datos curiosos (FunFacts) y lugar de filmacion de todas las peliculas
SELECT fun_facts, locations FROM FilmLocations;

-- Nombres, ubicacion y años de estreno, estrenadas en el siglo XX incluidas en el 2000.
SELECT * FROM FilmLocations;
SELECT title, locations, release_year FROM FilmLocations WHERE release_year <= 2000;

-- Nombres, nombre de la productora (Production_Company), ubicacion, año de estreno de las peliculas que no fueron escritas por James Cameron.
SELECT * FROM FilmLocations;
SELECT title, production_company, locations, release_year FROM FilmLocations WHERE  writer <> 'James Cameron'

------------------------USO DE LA DECLARACION COUNT---------------------------------- 

-- Contar el numero de registros o filas de la base de datos
SELECT COUNT (*) FROM FilmLocations;

-- Contar el numero de registros no NULL de ubicaciones de las peliculas
SELECT COUNT (locations) FROM FilmLocations;

-- Contar el numero de registros no NULL de ubicaciones de las peliculas, pero de las peliculas escritas por cierto escritor
SELECT COUNT (locations) FROM FilmLocations WHERE writer='James Cameron';

------------------------USO DE LA DECLARACION DISTINCT---------------------------------

-- Recuperar los titulos de todas las peliculas sin los duplicados
SELECT DISTINCT (title) FROM FilmLocations;

-- Filtrar peliculas de cierta productora, ver los años en que salieron y contar solo años unicos de estreno.
SELECT COUNT (DISTINCT release_year) FROM FilmLocations WHERE Production_Company ='Warner Bros. Pictures';

------------------------USO DE LA DECLARACION LIMIT--------------------------------------

-- Recuperar solo los primeros 25 registros
SELECT * FROM FilmLocations LIMIT 25;

-- EJERCITACION COUNT--

-- Recuperar 15 filas, comenzando desde la numero 11
SELECT * FROM FilmLocations LIMIT 25 OFFSET 10

-- Contar las peliculas dirigidas por Woody Allen
SELECT COUNT (title) FROM FilmLocations WHERE director='Woody Allen'

-- Contar las ubicaciones de peliculas dirigidas por Woody Allen
SELECT COUNT (locations) FROM FilmLocations WHERE director='Woody Allen'

-- Recupera el número de películas filmadas en Russian Hill.
SELECT COUNT (DISTINCT title) FROM FilmLocations WHERE locations = 'Russian Hill'

-- Obtener la cantidad de películas estrenadas antes de 1950.
SELECT COUNT (Title) FROM FilmLocations WHERE Release_Year < 1950;
-- Esta es mas conveniente. La primera cuenta si Title no tiene Null. Esta cuenta todas las filas
SELECT COUNT(*) FROM FilmLocations WHERE Release_Year<1950;

-- EJERCITACION DISTINCT--

--Obtener los nombres de todas las películas únicas estrenadas desde el siglo 21 en adelante, con sus años.
SELECT DISTINCT Title, release_year FROM FilmLocations WHERE release_year >= 2000;

-- Obtener los nombres de los directores y sus películas únicas grabadas en City Hall.
SELECT DISTINCT Title, Director FROM FilmLocations WHERE locations = 'City Hall';

-- Contar cuántos distribuidores diferentes trabajaron con películas de Clint Eastwood.
SELECT COUNT (DISTINCT Distributor) FROM FilmLocations WHERE actor_1 = 'Clint Eastwood';

-- EJERCITACION LIMIT--

--Obtener los nombres de las primeras 50 películas diferentes.
SELECT DISTINCT title FROM FilmLocations LIMIT 50;

--Obtener los nombres de las primeras 10 películas estrenadas en 2015.
SELECT DISTINCT title FROM FilmLocations WHERE release_year = 2015 LIMIT 10;

--Obtener los nombres de las 3 películas siguientes después de las primeras 5 películas estrenadas en 2015.
SELECT DISTINCT title FROM FilmLocations WHERE release_year = 2015 LIMIT 3 OFFSET 5;


--------------------------------------- NUEVA TABLA ---------------------------------------------

CREATE TABLE Instructor (
  index INT,
  ins_id TEXT,
  lastname INT,
  firstname TEXT,
  city TEXT,
  country TEXT
 
);


-- CORRIJO EL TIPO DE DATO DE lastname y ins_id
ALTER TABLE Instructor ALTER COLUMN lastname TYPE TEXT;
ALTER TABLE Instructor ALTER COLUMN ins_id TYPE INT USING ins_id::integer;

-- ELIMINO LA COLUMNA index
ALTER TABLE Instructor DROP COLUMN index;

SELECT * FROM Instructor;

-- CARGO LOS DATOS BASE PARA COMENZAR LA PRACTICA

INSERT INTO Instructor (ins_id, lastname, firstname, city, country)
VALUES 
(1,	'Ahuja',	'Rav',	'Toronto',	'CA'),
(2,'Chong','Raul','Toronto','CA'),
(3,'Vasudevan','Hima','Chicago','US');

SELECT * FROM Instructor;

/*

Descripciones de los atributos de columna de la tabla Instructor:

Instructor (
    ins_id:     número de identificación único de los instructores,    
    lastname:   apellido de los instructores,
    firstname:  nombre de los instructores,
    city:       nombre de las ciudades donde se encuentran los instructores,
    country:    código de país de dos letras de los países donde se encuentran los instructores
)

*/



--------------------INSERT----------------------------

--INSERT: se utiliza para insertar nuevas filas en una tabla. 
INSERT INTO table_name (column1, column2, ... )
VALUES (value1, value2, ... )
;

-- EJERCITACION
--Insertar un nuevo registro de instructor con id 4 para Sandip Saha que vive en Edmonton, CA en la tabla "Instructor".

INSERT INTO Instructor (ins_id, lastname, firstname, city, country)
VALUES
(4,'Sandip','Saha','Edmonton','CA');

SELECT * FROM Instructor;

/*
Insertar dos nuevos registros de instructor en la tabla "Instructor".
Primer registro con id 5 para John Doe que vive en Sydney, AU.
Segundo registro con id 6 para Jane Doe que vive en Dhaka, BD.
*/

INSERT INTO Instructor (ins_id, lastname, firstname, city, country)
VALUES
(5,'Johs','Doe','Sydney','AU'),
(6,'Jane','Doe','Dhaka','BD');

SELECT * FROM Instructor;

/*
Inserta:
- id 7, Antonio Cangiano, Vancouver, CA
- id 8, Steve Ryan, Barlby, GB
- id 9, Ramesh Sannareddy, Hyderabad, IN
*/

INSERT INTO Instructor (ins_id, lastname, firstname, city, country)
VALUES
(7,'Antonio','Cangiano','Vancouver','CA'),
(8,'Steve', 'Ryan','Barlby','GB'),
(9,'Ramesh','Sannareddy','Hyderabad','IN');


SELECT * FROM Instructor;

--------------------UPDATE----------------------------

--UPDATE: se usa para actualizar los datos en filas existentes de la tabla. 
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condicion
;


/*

Actualizar la ciudad de Sandip a Toronto.
Actualizar la ciudad y el país de Doe con id 5 a Dubái y AE respectivamente.
Actualiza la ciudad del registro del instructor a Markham cuyo id es 1.
Actualiza la ciudad y el país de Jane con id 6 a Dhaka y BD respectivamente.

*/


UPDATE Instructor SET city = 'Toronto' WHERE lastname = 'Sandip';
UPDATE Instructor SET city = 'Dubái', country = 'AE' WHERE ins_id = 5;
UPDATE Instructor SET city = 'Markham' WHERE ins_id = 1;
UPDATE Instructor SET city = 'Dhaka', country = 'BD' WHERE ins_id = 6;

SELECT * FROM Instructor ORDER by ins_id;

--------------------DELETE-----------------------------

--DELETE: se utiliza para eliminar filas de una tabla.
DELETE FROM table_name
WHERE condicion
;

/*

Eliminar el registro del instructor Doe cuyo id es 6.
Elimina el registro del instructor Johs.

*/

DELETE FROM Instructor
WHERE ins_id IN (5,6)

SELECT * FROM Instructor ORDER BY ins_id