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
		77 eof pic 9 value 1.
		77 err pic 9 value 1.
		77 strlen pic 99.
		77 i pic 9 value 1.
		77 total pic 999.
		
procedure division.
	display 'Enter the Roman Numeral to be converted: '.
	
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
		move 1 to i.
		perform calc-loop until i is greater than strlen.
		
		calc-loop.
			display in-line(i:1).
			add 1 to i.
