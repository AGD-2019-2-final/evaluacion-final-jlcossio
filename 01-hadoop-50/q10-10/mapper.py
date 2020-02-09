import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
lineas = sys.stdin.readlines()

for linea in lineas:

	if linea not in [None, ' ', '\n', '\t']:

		columnas = linea.split("\t")

		claves = tokenize(columnas[1])
		valor = columnas[0]

		sys.stdout.write("{},{}\n".format(claves,valor))