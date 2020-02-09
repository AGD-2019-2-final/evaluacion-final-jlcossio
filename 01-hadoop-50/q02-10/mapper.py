import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

	for line in sys.stdin:

		linea = line.split(",")

		for recorre in range(len(linea)):

			if linea[recorre] in ["radio/tv", "education", "furniture", "car (new)", "car (used)", "business", "domestic appliances", "repairs", "others", "retraining"]:

				valor = "{}\t" + str(format(linea[recorre+1])) + "\n"

				sys.stdout.write(valor.format(linea[recorre]))
