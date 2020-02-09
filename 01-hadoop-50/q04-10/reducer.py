import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

	lines = sys.stdin.readlines()

	for line in lines:
		if line[3] not in ['1', '4', 1, 4, None, ' ', '\n', '\t']:
			#print(line[0])
			sys.stdout.write("{},{}{}\n".format(line[0],line[2],line[3]))
		else:
			#print("nada")
			sys.stdout.write("{},{}{}".format(line[0],line[2],line[3]))
