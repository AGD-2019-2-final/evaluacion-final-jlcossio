-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra_chalalay:CHARARRAY, 
        array_chalalay:CHARARRAY, 
        diccionario_chalalay:CHARARRAY);

desagregado = FOREACH data GENERATE FLATTEN(TOKENIZE(array_chalalay));
grupo = GROUP desagregado BY $0;
contar = FOREACH grupo GENERATE FLATTEN(group), COUNT($1);
machete = LIMIT contar 7;
DUMP machete;
STORE machete INTO 'output';
fs -get output/ .