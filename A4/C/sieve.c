#include <stdio.h>
#include <stdlib.h>

void calculateSieve(int n) {
	
	FILE *fp;
	int divs[4] = {2, 3, 5, 7};//list of primes that will be checked on
	int *value;
	
	value = malloc(sizeof(int) * n - 1);
	
	//setup initial values
	for (int i = 0; i < n - 1; i++) {
		value[i] = i + 2;
	}
	
	//run algorithm
	for (int i = 0; i < 4; i++) {
		
		int d = divs[i];
		for (int j = 2; j < n - 1; j++) {//ignore 2 and 3
			
			if (value[j] == 0) {
				//ignore
			} else {
				
				//check if d divides the value at all to begin with
				int check = (int)(value[j] / d);
				switch (check) {
					case 0://does not divide
					case 1://does divide, but is one of the low primes we are using
						break;
					default:
						//check if it is fully divisible
						if (value[j] % d != 0) {
							//it works (for now). Keep it in array
						} else {
							value[j] = 0;
						}
				}
				
			}
			
		}
		
	}
	
	fp = fopen("output.txt", "w");
	if (!fp) {
		printf("Error opening file file\n");
		exit(0);
	}
	//print out results
	fprintf(fp, "List of primes\n");
	for (int i = 0; i < n - 1; i++) {
		
		if (value[i] == 0) {
			//don't print
		} else {
			fprintf(fp, "%d ", value[i]);
		}
		
	}
	printf("Program complete.\n");
	
}

int main(int argc, char *argv[]) {
	
	int n;
	
	if (argc != 2) {
		printf("Please run as \"./sieve <upper limit>\"\n");
		return 1;
	}
	
	n = atoi(argv[1]);
	calculateSieve(n);
	
	return 0;
	
}
