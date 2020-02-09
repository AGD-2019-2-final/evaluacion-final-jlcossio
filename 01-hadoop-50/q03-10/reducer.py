import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == '__main__':

	lines = sys.stdin.readlines()
	lines.sort(key=lambda x: x[2], reverse=False)

	for line in lines:
		sys.stdout.write("{},{}\n".format(line[0],line[2]))