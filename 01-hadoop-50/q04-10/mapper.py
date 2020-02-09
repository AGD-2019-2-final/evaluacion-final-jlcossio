import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

	data = [('A',12), ('B',10), ('C',4), ('D',1), ('E',13)]

	for tupla in data:
		sys.stdout.write("{},{}\n".format(tupla[0],tupla[1]))