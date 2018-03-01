import sys

if len(sys.argv) < 2:
	print("Please run as \"./sieve <upper-limit>\"\n")
else:
	#start algorithm
	n = int(sys.argv[1])
	divs = list(xrange(4))
	#setup divs
	divs[0] = 2
	divs[1] = 3
	divs[2] = 5
	divs[3] = 7
	value = list(xrange(n))
	for i in range(n-1):
		value[i] = i + 2
	
	#begin main loop
	for d in divs:
		for i in range(len(value)):
			if (value[i] != 0):#isn't already empty
				check = int(value[i] / d)
				if (check != 0 and check != 1):
					#is divisible and isn't one of our lower primes
					if (value[i] % d == 0):
						value[i] = 0 #erase value if it is divisible
	
	successList = list()
	#print successful primes
	for val in value:
		if (val != 0):
			successList.append(val)

	print(successList)
