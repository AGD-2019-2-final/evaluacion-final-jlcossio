-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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

diccionario = FOREACH data GENERATE diccionario_chalalay;
desagregado = FOREACH diccionario GENERATE FLATTEN(diccionario_chalalay);
agrupado = GROUP desagregado BY $0;
desagregado = FOREACH agrupado GENERATE FLATTEN(group), COUNT($1);


DUMP desagregado;
STORE desagregado INTO 'output';
fs -get output/ .