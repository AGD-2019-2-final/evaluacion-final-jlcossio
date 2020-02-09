-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra_chalalay:CHARARRAY, 
        fecha_chalalay:CHARARRAY, 
        numero_chalalay:INT);

ordenado = ORDER data BY numero_chalalay;
minimos = LIMIT ordenado 5;
solo_numero = FOREACH minimos GENERATE numero_chalalay;
DUMP solo_numero;
STORE solo_numero INTO 'output';
fs -get output/ .