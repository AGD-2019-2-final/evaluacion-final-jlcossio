-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra_chalalay:CHARARRAY, 
        fecha_chalalay:CHARARRAY, 
        numero_chalalay:CHARARRAY);

grupo = GROUP data BY letra_chalalay;
desagregado = FOREACH grupo GENERATE FLATTEN(group), COUNT($1);
DUMP desagregado;
STORE desagregado INTO 'output';
fs -get output/ .