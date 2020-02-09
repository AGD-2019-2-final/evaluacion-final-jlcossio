import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

	for line in sys.stdin:

		for word in line.split(","):

			if word in ["credit_history", "critical", "repaid", "delayed", "fully repaid", "fully repaid this bank"]:

				sys.stdout.write("{}\t1\n".format(word))