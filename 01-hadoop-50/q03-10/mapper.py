import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

	for line in sys.stdin:

		linea = line.split(",")

		for recorre in range(len(linea)):

			if linea[recorre] in ["a", "b", "c", "d", "e", "f"]:

				valor = "{}," + str(format(linea[recorre+1]))

				sys.stdout.write(valor.format(linea[recorre]))