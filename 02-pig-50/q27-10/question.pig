-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname, 
--        LOCATE('ia', firstname) 
--    FROM 
--        u;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.csv' USING PigStorage(',') 
    AS (registro_chalalay:INT,
    	nombre_chalalay:CHARARRAY,
    	apellido_chalalay:CHARARRAY,
    	fecha_chalalay:CHARARRAY,
    	color_chalalay:CHARARRAY,
    	numero_chalalay:INT);

nombre = FOREACH data GENERATE nombre_chalalay;
posicion = FOREACH nombre GENERATE INDEXOF($0, 'ia', 0);
DUMP posicion;
STORE posicion INTO 'output';
fs -get output/ .