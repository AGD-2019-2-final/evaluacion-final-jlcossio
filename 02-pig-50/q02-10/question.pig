-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 

data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra_chalalay:CHARARRAY, 
        fecha_chalalay:CHARARRAY, 
        numero_chalalay:INT);

ordenado = ORDER data BY letra_chalalay, numero_chalalay;
redundante = FOREACH ordenado GENERATE letra_chalalay, fecha_chalalay, numero_chalalay;
DUMP redundante;
STORE redundante INTO 'output';
fs -get output/ .
