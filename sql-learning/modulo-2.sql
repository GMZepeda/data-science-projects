-- ================================================
-- MODULO 2 - IBM Data Science SQL Course
-- ================================================

----------CREAR, ALTERAR, TRUNCAR, ELIMINAR---------------

/*

Objetivos:

- Crear una base de datos.
- Crear una nueva tabla en una base de datos.
- Agregar, eliminar o modificar columnas en una tabla existente.
- Eliminar todas las filas de una tabla existente sin eliminar la tabla en sí.
- Eliminar una tabla existente en una base de datos.

*/

------------------------------------------------------CREATE TABLE --------------------------------------------------------------
CREATE TABLE PETSALE (
        ID INTEGER NOT NULL,
        PET CHAR(20),
        SALEPRICE DECIMAL(6,2),
        PROFIT DECIMAL(6,2),
        SALEDATE DATE
        );

CREATE TABLE PET (
        ID INT NOT NULL,
        ANIMAL VARCHAR(20),
        QUANTITY INT
        );




-------------------------------------------------------- INSERT INTO ---------------------------------------------------------
INSERT INTO PETSALE VALUES
        (1,'Cat',450.09,100.47,'2018-05-29'),
        (2,'Dog',666.66,150.76,'2018-06-01'),
        (3,'Parrot',50.00,8.9,'2018-06-04'),
        (4,'Hamster',60.60,12,'2018-06-11'),
        (5,'Goldfish',48.48,3.5,'2018-06-14');

INSERT INTO PET VALUES
        (1,'Cat',3),
        (2,'Dog',4),
        (3,'Hamster',2);

SELECT * FROM PETSALE;
SELECT * FROM PET;

----------------------------------------------------------------- ALTER TABLE ---------------------------------------------------

-------- ADD COLUM ----------
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;

SELECT * FROM PETSALE;

--------- UPDATE (MODIFICAR LOS VALORES DE UNA O MAS FILAS) ------------
UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;

SELECT * FROM PETSALE;

----------- DROP COLUM ---------
ALTER TABLE PETSALE
DROP COLUMN PROFIT;

SELECT * FROM PETSALE;

----------- MODIFICAR UNA COLUMNA -------------
ALTER TABLE PETSALE
ALTER COLUMN PET TYPE TEXT;
SELECT * FROM PETSALE;

------------ RENOMBRAR UNA COLUMNA --------------
ALTER TABLE PETSALE
RENAME COLUMN PET TO animal;

SELECT * FROM PETSALE;

----------------- DROP (ELIMINAR UNA TABLA EXISTENTE)----------------
DROP TABLE PET;
SELECT * FROM PET;

------ PRACTICA ------

/*

1) Crea una nueva tabla en la base de datos llamada Toys
con los atributos ID (entero), Variedad (cadena de longitud variable) y Cantidad (entero).
Asegúrate de que el ID no sea Nulo.

*/

CREATE TABLE Toys (
ID INT NOT NULL,
Variedad TEXT,
CANTIDAD INT
);

SELECT * FROM Toys;

/*
2) Agrega las entradas mencionadas a la tabla utilizando la instrucción INSERT:

ID	Variedad	Cantidad
1	Juguete masticable	20
2	Pelotas	50
3	Tazones	30
4	Cama plegable	40

*/

INSERT INTO Toys VALUES
(1, 'Juguete masticable', 20),
(2,'Pelota',50),
(3,'Tazones',30),
(4,'Cama plegable',40);

SELECT * FROM Toys;

/*
3) Eliminar todos los registros
*/

TRUNCATE TABLE Toys;

SELECT * FROM Toys;

/*
4) Modificar cantidad a float
*/

ALTER TABLE Toys
ALTER COLUMN cantidad TYPE DOUBLE PRECISION;

SELECT * FROM Toys;

/*
5) Eliminar la tabla Toys
*/

DROP TABLE Toys;
SELECT * FROM Toys;