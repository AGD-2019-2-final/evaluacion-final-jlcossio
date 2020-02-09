-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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
agrupado = GROUP apellidos BY $0;
longitudes = FOREACH agrupado GENERATE $0, SIZE(group);
ordenado = ORDER longitudes BY $1 DESC, $0;
limite = LIMIT ordenado 5;

DUMP limite;
STORE limite INTO 'output';
fs -get output/ .