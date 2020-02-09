import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
import itertools
import operator
from collections import defaultdict

if __name__ == '__main__':

	lines = sys.stdin.readlines()
	lista = list()
	for line in lines:
		if line not in ["", " ", None, "\t", "\n"]:
			elemento = line.split("\t")
			lista.append(elemento[0])

	lista2 = list()
	for recorre in lista:
		elemento2 = recorre.split(",")
		lista2.append(elemento2)

	lista2.sort(key=lambda x: int(x[2]), reverse=False)

	contador = 0

	for itera in lista2:
		if contador <= 5:
			contador += 1
			sys.stdout.write("{}\t{}\t{}\n".format(itera[0],itera[1],itera[2]))