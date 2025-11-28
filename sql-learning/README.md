# SQL Learning: Databases and SQL for Data Science with Python (IBM)

Este repositorio documenta el progreso en los Módulos 1 al 4 del curso, enfocándose en PostgreSQL, MySQL y la integración de bases de datos con Python, además de proyectos de aplicación práctica.

## Estructura del Repositorio

### [Módulo 1](./modulo-1.sql)
Introducción a comandos de definición y manipulación.
* DDL y DML.
* Sentencias: SELECT, COUNT, DISTINCT, LIMIT.

### [Módulo 2](./modulo-2.sql)
Modificación y gestión de estructuras y datos.
* Sentencias: ALTER, INSERT, UPDATE, DELETE, TRUNCATE.

### [Módulo 3](./modulo-3.sql)
Refinamiento de búsquedas y trabajo con múltiples tablas.
* Operadores: LIKE, ORDER BY, GROUP BY.
* Funciones de agregación y de fecha.
* Subconsultas, selecciones anidadas y JOIN implícito.

### [Módulo 4.1](./modulo-4.1.ipynb)
Acceso a bases de datos con Python.
* Creación y conexión a SQLite.
* Operaciones CRUD.
* Integración con Pandas DataFrames.

### [Módulo 4.2](./modulo-4.2.ipynb)
SQL avanzado en entorno Jupyter.
* Uso de SQL Magic (%sql y %%sql).
* Conversión de resultados a DataFrames.
* Visualización con Matplotlib y Seaborn.

---

## Proyectos de Análisis

### [Análisis Socioeconómico de Chicago](./analisis_socioeconomico_chicago.ipynb)
Proyecto de análisis exploratorio de indicadores reales de Chicago.
* Carga de CSV a SQLite.
* Consultas SQL para análisis de datos.
* Visualización de correlaciones.

### [Análisis de la EPH (Argentina) - 2° Trimestre 2025](./EPH_2025_T2.ipynb)
Proyecto de procesamiento y análisis de la Encuesta Permanente de Hogares (INDEC), enfocado en el **Aglomerado Viedma - Carmen de Patagones**.
* **Tecnologías:** Python, Pandas, SQLite3, SQL Magic (`%sql`).
* **ETL:** Carga de datasets `.xlsx` (Hogar e Individual) y transformación a base de datos relacional SQLite.
* **Análisis SQL:**
  * Estimación poblacional y de hogares mediante ponderadores (`PONDERA`, `PONDIH`).
  * Segmentación de régimen de tenencia de vivienda (propietarios vs. inquilinos).
  * Análisis de distribución de ingresos y estimación de pobreza según CBT.
 
#### Datos de la EPH
Los archivos originales **NO** se incluyen en este repositorio.  
Pueden descargarse desde el sitio oficial del INDEC:

https://www.indec.gob.ar/indec/web/Institucional-Indec-BasesDeDatos



