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
		77 counter pic 99.
		77 prev pic 9999.
		77 d pic 9999.
		01 error-mess.
			02 filler pic x(22) value ' illegal roman numeral'.
		01 parsing.
			02 current pic x.
			02 done pic 9.
	linkage section.
		77 strlen pic 99.
		77 total pic 999999.
		77 err pic 9.
		01 in-line.
			02 i pic x(1) occurs 30 times.
		
procedure division using in-line, strlen, err, total.
	
	move 0 to err.
	move 0 to done.
	move 0 to total.
	move 1001 to prev.
	
	move 0 to total.
	move 1 to counter.
	
	perform calc-loop until counter is greater than strlen or err = 1 or done = 1.
	
	if err is equal to 1
		write stdout from error-mess after advancing 1 line
	
	stop run.
	
	calc-loop.
		
		move in-line(counter:1) to current.
		if current is equal to 'M' or 'm'
			move 1000 to d
			
		else if current is equal to 'D' or 'd'
			move 500 to d
			
		else if current is equal to 'C' or 'c'
			move 100 to d
			
		else if current is equal to 'L' or 'l'
			move 50 to d
			
		else if current is equal to 'X' or 'x'	
			move 10 to d
			
		else if current is equal to 'V' or 'v'
			move 5 to d
			
		else if current is equal to 'I' or 'i'
			move 1 to d
			
		else if current is equal to ' '
			move 1 to done
			
		else
			move 1 to err.
		
		if err is not equal to 1 and done is not equal to 1
			add d to total
			if d is greater than prev
				compute total = total - 2 * prev.
		
		move d to prev.
		add 1 to counter.
		
