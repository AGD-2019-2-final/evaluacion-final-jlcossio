-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
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

apellidos = FOREACH data GENERATE apellido_chalalay;
primera_letra = FOREACH apellidos GENERATE $0, SUBSTRING($0, 0, 1);

--letras = LOAD ('d', 'e', 'f', 'g', 'h', 'i', 'j', 'k') USING --PigStorage(',')
--AS (letra_chalalay:CHARARRAY);

filtro = FILTER primera_letra BY $1 >= 'D' AND $1 <= 'K';
fin = FOREACH filtro GENERATE $0;

DUMP fin;
STORE fin INTO 'output';
fs -get output/ .

