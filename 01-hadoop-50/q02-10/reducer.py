import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximo = 0

    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == curkey:

        	if val > maximo:

        		maximo = val

        else:

            if curkey is not None:

                sys.stdout.write("{}\t{}\n".format(curkey, maximo))

            curkey = key
            maximo = val



    sys.stdout.write("{}\t{}\n".format(curkey, maximo))