import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
lineas = sys.stdin.readlines()

for linea in lineas:

	if linea not in [None, ' ', '\n', '\t']:

		columnas = linea.split("   ")

		letra = columnas[0]
		fecha = columnas[1]
		valor = columnas[2]

		sys.stdout.write("{},{},{}\n".format(letra,fecha,valor))