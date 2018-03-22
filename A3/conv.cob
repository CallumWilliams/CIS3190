program-id. conv.

environment division.
	input-output section.
		file-control.
			select standard-output assign to display.

data division.
	file section.
		fd standard-output.
			01 stdout pic x(80).
	working-storage section.
		01 result.
			02 convertedValues pic 9999 occurs 30 times.
			02 total pic 999999.
		01 error-mess.
			02 filler pic x(22) value ' illegal roman numeral'.
		01 indexing.
			02 counter pic 9 value 1.
			02 count_next pic 9.
		01 parsing.
			02 err pic 9 value 0.
			02 strlen pic 99.
			02 current pic x.
	linkage section.
		77 in-line pic x(80).
		
procedure division using in-line.
	
	unstring in-line
		delimited by spaces
		into in-line count in strlen.
	move 0 to err.
	move 0 to total.
	move 1 to counter.
	perform setup-values until counter is greater than strlen or err = 1.
	
	move 1 to counter.
	move 2 to count_next.
	if err is equal to 1
		write stdout from error-mess after advancing 1 line
	else
		perform calc-loop until counter is greater than strlen.
	
	display total.
	
	stop run.
	
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
			move 1 to err.
			
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
		
