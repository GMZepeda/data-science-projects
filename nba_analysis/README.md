# Análisis de Partidos de los Golden State Warriors vs Toronto Raptors

Este proyecto es parte de mi práctica en el uso de APIs en Python, en particular la **NBA API**, junto con `pandas` y `matplotlib`. El objetivo fue analizar el rendimiento de los **Golden State Warriors** frente a los **Toronto Raptors**.

## Qué se realizó

- Se obtuvo el ID del equipo Warriors mediante la API oficial de la NBA.
- Se consultaron todos los partidos y se filtraron aquellos jugados contra Toronto.
- Se separaron los partidos en condición de **local** y **visitante**.
- Se analizaron las diferencias de puntos (`PLUS_MINUS`) y los promedios de puntos anotados.
- Se realizaron visualizaciones para evaluar si jugar de local influye en el rendimiento.

## Nota sobre el acceso a la API

La API de la NBA puede presentar restricciones de acceso debido a políticas de la liga y limitaciones técnicas. Por esta razón, se incluye un archivo `Golden_State.pkl` que contiene los datos procesados necesarios para el análisis, permitiendo la ejecución del proyecto sin depender de la disponibilidad de la API.

## Librerías utilizadas

- `nba_api`
- `pandas`
- `matplotlib`
- `requests`

## Visualizaciones incluidas

1. Diferencia de puntos por fecha de partido.
2. Comparación de puntos promedio como local y como visitante.

---

Este análisis forma parte de mi proceso de formación en Ciencia de Datos. El código está documentado con fines educativos.



