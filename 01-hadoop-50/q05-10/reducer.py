import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

	curkey = None
	conteo = 1

	with sys.stdin as f:
		lines = f.read().splitlines() 

	#lines = sys.stdin.readlines()

	for line in lines:

		if line == curkey:

			conteo += 1

		else:

			if curkey is not None:

				sys.stdout.write("{}\t{}\n".format(curkey,conteo))

			curkey = line
			conteo = 1

	sys.stdout.write("{}\t{}\n".format(curkey,conteo))
