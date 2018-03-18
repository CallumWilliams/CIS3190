program-id. conv.

environment division.
	input-output section.
		file-control.
			select stdin assign to "input.txt" organization is line sequential.
			select stdout assign to display.

data division.
	file section.
		fd stdin.
			01 in-line pic x(30).
	working-storage section.
		01 array.
			05 convertedValues pic 9999 occurs 30 times.
		77 eof pic 9 value 1.
		77 err pic 9 value 1.
		77 strlen pic 99.
		77 counter pic 9 value 1.
		77 count_next pic 9.
		77 total pic 999999.
		77 current pic x.
		
procedure division.
	
	open input stdin.
	
	perform readLine until eof = 0.
	
	close stdin.
	
	stop run.
	
	readLine.
		read stdin into in-line at end move zero to eof.
		
		move 1 to err.
		if eof is not equal to zero
			perform calculateValue.
	
	calculateValue.
		unstring in-line
			delimited by spaces
			into in-line count in strlen.
		move 0 to total.
		move 1 to counter.
		perform setup-values until counter is greater than strlen.
		
		move 1 to counter.
		move 2 to count_next;
		perform calc-loop until counter is greater than strlen.
		
		display total.
		
		setup-values.
			
			move in-line(counter:1) to current.
			if current is equal to 'M' or 'm'
				move 1000 to convertedValues(counter)
				
			else if current is equal to 'D' or 'd'
				move 500 to convertedValues(counter)
				
			else if current is equal to 'C' or 'c'
				move 100 to convertedValues(counter)
				
			else if current is equal to 'L' or 'l'
				move 50 to convertedValues(counter)
				
			else if current is equal to 'X' or 'x'	
				move 10 to convertedValues(counter)
				
			else if current is equal to 'V' or 'v'
				move 5 to convertedValues(counter)
				
			else if current is equal to 'I' or 'i'
				move 1 to convertedValues(counter)
				
			else
				display 'error'.
				
			add 1 to counter.
		
		calc-loop.
			
			if counter is less than strlen
				if convertedValues(counter) is less than convertedValues(count_next)
					subtract convertedValues(counter) from total
				else
					add convertedValues(counter) to total
			else
				add convertedValues(counter) to total.
			
			add 1 to counter.
			add 1 to count_next.
			
