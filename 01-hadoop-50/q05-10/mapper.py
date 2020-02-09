import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

	for line in sys.stdin:

		linea = line.split("\t")

		for recorre in range(len(linea)):

			if len(linea[recorre]) > 5:

				fecha = linea[recorre].split("-")

				for recorre_fecha in range(len(fecha)):

					if recorre_fecha == 1:

						mes = fecha[recorre_fecha]

						sys.stdout.write("{}\n".format(mes))