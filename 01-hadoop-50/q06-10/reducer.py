import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
import itertools
import operator
from collections import defaultdict

if __name__ == '__main__':

	curkey = None
	maximo = -10000
	minimo = 10000

	with sys.stdin as f:
		lines = f.read().splitlines()

	h_p = list()

	for recorre in lines:
		if recorre not in [None, ' ', '\n', '\t', '']:
			h_p.append(recorre.split("\t"))

	diccionario = {}

	for elemento in h_p:
		if elemento[0] not in diccionario:
			diccionario[elemento[0]] = []
		diccionario[elemento[0]].append(elemento[1:])

	for llave in diccionario:
		diccionario[llave] = [[max(i)+ "\t" + min(i)] for i in zip(*diccionario[llave])]

	final = []
	for k, v in diccionario.items():
		#print(v[0][0])
		final.append(k+"\t"+v[0][0])

	for resultado in final:
		sys.stdout.write("{}\n".format(resultado))