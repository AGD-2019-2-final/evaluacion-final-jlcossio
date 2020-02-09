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
--        SUBSTRING_INDEX(firstname, 'a', 1)
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

nombre = FOREACH data GENERATE INDEXOF(nombre_chalalay,'a',1);
DUMP nombre;
STORE nombre INTO 'output';
fs -get output/ .