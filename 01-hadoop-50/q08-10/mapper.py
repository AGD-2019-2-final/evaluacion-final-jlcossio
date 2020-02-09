import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

	lineas = sys.stdin.readlines()

	for linea in lineas:

		if linea not in [None, ' ', '\n', '\t']:

			columnas = linea.split("   ")

			letra = columnas[0]
			valor = columnas[2]

			sys.stdout.write("{}\t{}\n".format(letra,valor))
