-- ================================================
-- MODULO 3 - IBM Data Science SQL Course
-- ================================================


/*
Patrones de Cadenas, Ordenamiento y Agrupación en PostgreSQL

Base de datos de recursos humanos (HR) de muestra
Este esquema de base de datos de HR consta de 5 tablas llamadas EMPLOYEES, JOB_HISTORY, JOBS, DEPARTMENTS y LOCATIONS
*/

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            


-- Las importamos 
copy employees FROM 'C:/PROYECTOS/SQL/M3/Employees.csv' WITH (FORMAT csv, HEADER true);
copy job_history FROM 'C:/PROYECTOS/SQL/M3/JobsHistory.csv' WITH (FORMAT csv, HEADER true);
copy jobs FROM 'C:/PROYECTOS/SQL/M3/Jobs.csv' WITH (FORMAT csv, HEADER true);
copy departments FROM 'C:/PROYECTOS/SQL/M3/Departments.csv' WITH (FORMAT csv, HEADER true);
copy locations FROM 'C:/PROYECTOS/SQL/M3/Locations.csv' WITH (FORMAT csv, HEADER true);


SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;
SELECT * FROM departments;
SELECT * FROM locations;


---------------------------------------------------------Patrones de Cadenas-----------------------------------------------------------------------

/*
Supongamos que necesitas recuperar los nombres F_NAME y apellidos L_NAME
de todos los empleados que viven en Elgin, IL.
Puedes usar el operador LIKE para recuperar cadenas que contengan el texto mencionado.

*/

SELECT F_NAME, L_NAME
FROM employees
WHERE address LIKE '%Elgin,IL%';


/*
Identificar a los empleados que nacieron durante los años 70
*/

SELECT * FROM employees;

SELECT f_name, l_name
FROM employees
WHERE  b_date >= '1970-01-01' and b_date <= '1980-01-01';

/*
Recuperemos todos los registros de empleados en el departamento 5 donde el salario esté entre 60000 y 70000
*/

SELECT * FROM employees
WHERE salary BETWEEN 60000 AND 70000 
  AND dep_id = '5';


--------------------------------------------------------------------------Ordenamiento--------------------------------------------------------------

/*
Puedes ordenar las entradas recuperadas en función de uno o más parámetros.
Primero, supón que debes recuperar una lista de empleados ordenada por ID de departamento.
El ordenamiento se realiza utilizando la cláusula ORDER BY en tu consulta SQL.
Por defecto, la cláusula ORDER BY ordena los registros en orden ascendente.
*/

SELECT f_name, l_name, dep_id 
FROM employees
ORDER BY dep_id;

-- En orden descendente --

SELECT f_name, l_name, dep_id 
FROM employees
ORDER BY dep_id DESC, l_name DESC;


------------------------------------------------------------------------------Agrupación---------------------------------------------------------

/*
Para cada ID de departamento, deseamos recuperar el número de empleados en el departamento.
*/

SELECT dep_id, COUNT(*)
FROM employees
GROUP BY dep_id;

/*
Para cada departamento, recupera el número de empleados en el departamento y
el salario promedio de los empleados en el departamento. 
Para esto, puedes usar COUNT(*) para obtener el conteo total de una columna y la función AVG() para calcular los salarios promedio,
y luego usar GROUP BY.
*/

SELECT dep_id, COUNT(*) , AVG(salary)
FROM employees
GROUP BY dep_id

-- Puedes refinar tu salida utilizando etiquetas apropiadas para las columnas de datos recuperados--
SELECT dep_id, COUNT(*) as employee_count, AVG(salary) as avg_salary
FROM employees
GROUP BY dep_id

-- Ordenandolos por promedio de salario y quitando decimales --

SELECT dep_id, COUNT(*) as employee_count, ROUND(AVG(salary), 2) as avg_salary
FROM employees
GROUP BY dep_id
ORDER BY avg_salary;

/*
Recuperar departamentos con menos de 4 empleados
usando HAVING para filtrar resultados agrupados
*/
SELECT dep_id, COUNT(*) as employee_count, ROUND(AVG(salary), 2) as avg_salary
FROM employees
GROUP BY dep_id
HAVING COUNT(*) < 4
ORDER BY avg_salary;


------- EJERCITACION-----------
/*
Recupera la lista de todos los empleados, nombres y apellidos, cuyos nombres comienzan con ‘S’.
*/

SELECT f_name, l_name
FROM employees
WHERE f_name LIKE 'S%';

/*
Organiza todos los registros de la tabla EMPLOYEES en orden ascendente de la fecha de nacimiento.
*/

SELECT * FROM employees
ORDER BY b_date;

/*
Agrupa los registros en función de los IDs de departamento y filtra aquellos que tengan un salario promedio mayor o igual a 60000. 
Muestra el ID de departamento y el salario promedio.
*/

SELECT dep_id, COUNT(*) as employees_count, AVG(salary) as avg_salary
FROM employees
GROUP BY dep_id
HAVING AVG(salary) >= 60000;


/*
Para el problema anterior, ordena los resultados de cada grupo en orden descendente de salario promedio.
*/

SELECT dep_id, COUNT(*) as employees_count, AVG(salary) as avg_salary
FROM employees
GROUP BY dep_id
HAVING AVG(salary) >= 60000
ORDER BY avg_salary DESC;





------------------------------------------------------------------Funciones integradas--------------------------------------------------
DROP TABLE IF EXISTS petrescue;

CREATE TABLE petrescue (
    id INTEGER PRIMARY KEY,
    animal VARCHAR(20),
    quantity INTEGER,
    rescue_cost NUMERIC(6,2),
    rescuedate DATE
);

INSERT INTO petrescue (id, animal, quantity, rescue_cost, rescuedate) VALUES
    (1, 'Cat', 9, 450.09, '2018-05-29'),
    (2, 'Dog', 3, 666.66, '2018-06-01'),
    (3, 'Dog', 1, 100.00, '2018-06-04'),
    (4, 'Parrot', 2, 50.00, '2018-06-04'),
    (5, 'Dog', 1, 75.75, '2018-06-10'),
    (6, 'Hamster', 6, 60.60, '2018-06-11'),
    (7, 'Cat', 1, 44.44, '2018-06-11'),
    (8, 'Goldfish', 24, 48.48, '2018-06-14'),
    (9, 'Dog', 2, 222.22, '2018-06-15');


SELECT * FROM petrescue;

/*
1. Escribe una consulta que calcule el costo total de todos los rescates de animales en la tabla PETRESCUE.
*/

SELECT SUM(rescue_cost) FROM petrescue;

SELECT SUM(rescue_cost) as sum_of_cost FROM petrescue;

/*
2. Escribe una consulta que muestre la cantidad máxima de animales rescatados (de cualquier tipo).
*/

SELECT MAX(quantity) FROM petrescue;
SELECT MAX(quantity) as max_quantity FROM petrescue;


-- CANTIDAD MINIMA
SELECT MIN(quantity) as min_quantity FROM petrescue;

/*
3. Escribe una consulta que muestre el costo promedio de los animales rescatados.
*/

SELECT AVG(rescue_cost) FROM petrescue;



-------------------------------------------------------------Funciones Escalares y Funciones de Cadena-----------------------------------------

/*
1. Escribe una consulta que muestre el costo integral redondeado de cada rescate.
*/

SELECT ROUND(rescue_cost) FROM petrescue;

-- En caso de que la pregunta fuera redondear el valor a 2 decimales, la consulta cambiaría a:

SELECT ROUND(rescue_cost, 2) FROM petrescue;


/*
2. Escribe una consulta que muestre la longitud de cada nombre de animal.
*/

SELECT LENGTH(animal) FROM petrescue;


/*
3. Escribe una consulta que muestre el nombre del animal en cada rescate en mayúsculas.
*/

SELECT UPPER(animal) FROM petrescue;

-- En minuscula

SELECT LOWER(animal) FROM petrescue;


-----------------------------------------------------------Funciones de Fecha----------------------------------------------------------

/*
1. Escribe una consulta que muestre la fecha de rescate.
*/

SELECT EXTRACT(DAY FROM rescuedate) as rescue_day
FROM petrescue;

-- Usando DATE_PART

SELECT DATE_PART('day', rescuedate) AS rescue_day
FROM petrescue;

-- Pidiendo el mes

SELECT EXTRACT(MONTH FROM rescuedate) as rescue_month
FROM petrescue;

-- Pidiendo el año

SELECT EXTRACT(YEAR FROM rescuedate) as rescue_year
FROM petrescue;

/*
2. Los animales rescatados deben ver al veterinario dentro de los tres días posteriores a su llegada.
Escribe una consulta que muestre el tercer día de cada rescate.
*/

SELECT rescuedate,
       (rescuedate + INTERVAL '3 days')::date AS vet_visit_date
FROM petrescue;

-- Si la pregunta era añadir 2 meses a la fecha, la consulta cambiaría a:

SELECT rescuedate,
       (rescuedate + INTERVAL '2 months')::date AS next_check_date
FROM petrescue;

/*
De manera similar, podemos recuperar una fecha anterior a la dada en la columna
por un número determinado de días utilizando la resta de un intervalo.
Al modificar el mismo ejemplo, la siguiente consulta proporcionaría la fecha
3 días antes del rescate.
*/

SELECT rescuedate,
       (rescuedate - INTERVAL '3 days')::date AS three_days_before
FROM petrescue;

/*
3. Escribe una consulta que muestre la duración del tiempo que los animales han sido rescatados,
es decir, la diferencia entre la fecha actual y la fecha de rescate.
La diferencia se devuelve en días.
Si queremos expresarla en formato de fecha (YYYY-MM-DD),
podemos sumar esa diferencia a la fecha base '0001-01-01'.
*/

-- Diferencia en días:
SELECT CURRENT_DATE - rescuedate AS days_rescued
FROM petrescue;


------------------------------------EJERCITACION---------------------------------------
/*
1. Escribe una consulta que muestre el costo promedio de rescatar un solo perro.
Ten en cuenta que el costo por perro no sería el mismo en diferentes casos.
*/

SELECT AVG(rescue_cost / quantity)
FROM petrescue
WHERE animal = 'Dog';


/*
2. Escribe una consulta que muestre el nombre del animal en cada rescate en mayúsculas sin duplicaciones.
*/

SELECT * FROM petrescue;

SELECT DISTINCT UPPER(animal)
FROM petrescue;

/*
3. Escribe una consulta que muestre todas las columnas de la tabla PETRESCUE donde el(los) animal(es) rescatado(s) son gatos.
Usa cat en minúsculas en la
 consulta.
*/

SELECT animal
FROM petrescue
WHERE LOWER(animal)= 'cat'

/*
4. Escribe una consulta que muestre el número de rescates en el 5to mes
*/

SELECT COUNT(*) AS rescues_in_may
FROM petrescue
WHERE EXTRACT(MONTH FROM rescuedate) = 5;

/*
5. Se supone que el refugio de rescate debe encontrar buenos hogares para todos los animales dentro de un año desde su rescate.
Escribe una consulta que muestre el ID y la fecha objetivo.
*/

SELECT id,
       rescuedate,
       (rescuedate + INTERVAL '1 year')::date AS target_date
FROM petrescue;




-------------------------------------------------------------------Subconsultas y selecciones anidadas----------------------------------------

/* Objetivos

Escribir consultas SQL que demuestren la necesidad de usar subconsultas
Componer subconsultas en la cláusula where
Construir expresiones de columna (por ejemplo, subconsulta en lugar de una columna)
Escribir expresiones de tabla (por ejemplo, subconsulta en lugar de una tabla)
*/
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS job_history;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;



CREATE TABLE employees (
    emp_id CHAR(9) NOT NULL,
    f_name VARCHAR(15) NOT NULL,
    l_name VARCHAR(15) NOT NULL,
    ssn CHAR(9),
    b_date DATE,
    sex CHAR(1),
    address VARCHAR(30),
    job_id CHAR(9),
    salary DECIMAL(10,2),
    manager_id CHAR(9),
    dep_id CHAR(9) NOT NULL,
    PRIMARY KEY (emp_id)
);

CREATE TABLE job_history (
    empl_id CHAR(9) NOT NULL,
    start_date DATE,
    jobs_id CHAR(9) NOT NULL,
    dept_id CHAR(9),
    PRIMARY KEY (empl_id, jobs_id)
);

CREATE TABLE jobs (
    job_ident CHAR(9) NOT NULL,
    job_title VARCHAR(30),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    PRIMARY KEY (job_ident)
);

CREATE TABLE departments (
    dept_id_dep CHAR(9) NOT NULL,
    dep_name VARCHAR(15),
    manager_id CHAR(9),
    loc_id CHAR(9),
    PRIMARY KEY (dept_id_dep)
);

CREATE TABLE locations (
    loct_id CHAR(9) NOT NULL,
    dep_id_loc CHAR(9) NOT NULL,
    PRIMARY KEY (loct_id, dep_id_loc)
);

COPY employees FROM 'C:/PROYECTOS/SQL/M3/Employees.csv' WITH (FORMAT csv, HEADER true);
COPY job_history FROM 'C:/PROYECTOS/SQL/M3/JobsHistory.csv' WITH (FORMAT csv, HEADER true);
COPY jobs FROM 'C:/PROYECTOS/SQL/M3/Jobs.csv' WITH (FORMAT csv, HEADER true);
COPY departments FROM 'C:/PROYECTOS/SQL/M3/Departments.csv' WITH (FORMAT csv, HEADER true);
COPY locations FROM 'C:/PROYECTOS/SQL/M3/Locations.csv' WITH (FORMAT csv, HEADER true);


SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;
SELECT * FROM departments;
SELECT * FROM locations;

-- registros de empleados cuyo salario es inferior al salario promedio

SELECT * 
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- recupere todos los registros de empleados con EMP_ID, SALARY y el salario máximo como MAX_SALARY en cada fila.

SELECT emp_id, salary, (SELECT MAX(salary) FROM employees) AS max_salary
FROM employees

-- extraer los nombres y apellidos del empleado más antiguo

SELECT f_name, l_name 
FROM employees
WHERE b_date = (SELECT MIN(b_date) FROM employees);


-- crear tablas derivadas, que luego se pueden usar para consultar información específica. 
-- salario promedio de los 5 principales ganadores de la empresa.

SELECT AVG(salary)
FROM (SELECT salary
		FROM employees
		ORDER BY salary DESC
		LIMIT 5) AS salary_table;


-- Escribe una consulta para encontrar el salario promedio de los cinco empleados con menor salario.

SELECT AVG(salary)
FROM (SELECT salary
		FROM employees
		ORDER BY salary
		LIMIT 5) AS salary_table;

-- Escribe una consulta para encontrar los registros de empleados mayores que la edad promedio de todos los empleados.

SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, b_date)) > (
	SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, b_date)))
	FROM employees
);

-- Desde la tabla Job_History, muestra la lista de IDs de empleados, años de servicio y promedio de años de servicio para todas las entradas.
SELECT 
    empl_id,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date)) AS years_of_service,
    (
        SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date)))
        FROM job_history
    ) AS avg_years_of_service
FROM job_history;


--------------------------------------------------------------------------Trabajar con múltiples tablas------------------------------------------

/*Objetivos
Escribir consultas SQL que accedan a más de una tabla
Componer consultas que accedan a múltiples tablas utilizando una declaración anidada en la cláusula WHERE
Construir consultas con múltiples tablas en la cláusula FROM
Escribir consultas de unión implícita con criterios de unión especificados en la cláusula WHERE
Especificar alias para los nombres de las tablas y calificar los nombres de las columnas con alias de tabla
*/


-- Recuperar solo los registros de EMPLEADOS correspondientes a trabajos en la tabla JOBS.
SELECT *
FROM employees
WHERE job_id IN (SELECT job_id FROM jobs)


-- Recuperar información de JOB para empleados que ganan más de $70,000.

SELECT 
    job_title, 
    min_salary, 
    max_salary, 
    job_ident
FROM jobs
WHERE job_ident IN (
    SELECT job_id 
    FROM employees 
    WHERE salary > 70000
);

-- Con JOIN
SELECT 
    j.job_title,
    j.min_salary,
    j.max_salary,
    j.job_ident
FROM jobs j
JOIN employees e 
    ON j.job_ident = e.job_id
WHERE e.salary > 70000;

-- Recuperar solo los registros de EMPLEADOS correspondientes a trabajos en la tabla JOBS.

SELECT *
FROM employees
JOIN jobs 
    ON employees.job_id = jobs.job_ident;

-- recupera solo el ID de empleado, el nombre y el título del trabajo.

SELECT 
    e.emp_id,
    e.f_name,
    e.l_name,
    j.job_title
FROM employees e
JOIN jobs j 
    ON e.job_id = j.job_ident;

-- especifica los nombres de columna completamente calificados con alias en la cláusula SELECT.

SELECT 
    e.emp_id AS employee_id,
    e.f_name AS first_name,
    e.l_name AS last_name,
    j.job_title AS job_title
FROM employees AS e
JOIN jobs AS j 
    ON e.job_id = j.job_ident;

-- Recupera solo la lista de empleados cuyo CARGO es Jr. Designer.
SELECT *
FROM employees
WHERE job_id IN (
    SELECT job_ident
    FROM jobs
    WHERE job_title = 'Jr. Designer'
);

-- Usando Uniones Implícitas
SELECT *
FROM employees e, jobs j
WHERE e.job_id = j.job_ident 
  AND j.job_title = 'Jr. Designer';


-- Recuperar información de JOB y una lista de empleados cuyo año de nacimiento es posterior a 1976.
-- Usando subconsultas
SELECT job_title, min_salary, max_salary, job_ident
FROM jobs
WHERE job_ident IN (
    SELECT job_id
    FROM employees
    WHERE EXTRACT(YEAR FROM b_date) > 1976
);

-- Usando union implicita
SELECT j.job_title, j.min_salary, j.max_salary, j.job_ident
FROM jobs j, employees e
WHERE e.job_id = j.job_ident
  AND EXTRACT(YEAR FROM e.b_date) > 1976;
