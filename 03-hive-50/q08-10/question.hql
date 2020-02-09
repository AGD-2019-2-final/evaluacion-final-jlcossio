-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que para cada valor único de la columna `t0.c2,` 
-- calcule la suma de todos los valores asociados a las claves en la columna 
-- `t0.c6`.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

WITH ct AS (
SELECT c2, val as valor
FROM tbl0
LATERAL VIEW explode(c6) e1 as llave,val 
)
INSERT OVERWRITE LOCAL DIRECTORY '../q08-10/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT c2, sum(valor)
FROM ct
GROUP BY c2;
