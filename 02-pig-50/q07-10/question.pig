-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra_chalalay:CHARARRAY, 
        array_chalalay:BAG{t2:TUPLE(c2:CHARARRAY)},
        diccionario_chalalay:MAP[]);

desagregado = FOREACH data GENERATE letra_chalalay, COUNT(array_chalalay), SIZE(diccionario_chalalay);
ordenado = ORDER desagregado BY $0, $1, $2;
DUMP ordenado;
STORE ordenado INTO 'output';
fs -get output/ .