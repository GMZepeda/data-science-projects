# Análisis de acciones con yfinance

Se analizan las acciones de Amazon (AMZN) y Apple (AAPL) utilizando la biblioteca `yfinance`.  
Incluye extracción de datos históricos, dividendos, sector económico y volumen negociado en el primer día.

## Librerías utilizadas

- yfinance  
- pandas

## Contenido del notebook

- Creación de objetos Ticker (`AMZN` y `AAPL`)
- Obtención del historial completo (`period='max'`)
- Consulta de dividendos (`.dividends`)
- Identificación del sector (`.info['sector']`)
- Acceso al volumen del primer día (`.iloc[0]['Volume']`)
