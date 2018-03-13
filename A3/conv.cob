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
		77 sum pic 999.
		
procedure division.
	display 'Enter the Roman Numeral to be converted: '.
	
	open input stdin.
	
	perform readLine until eof = 0.
	
	close stdin.
	
	stop run.
	
	readLine.
		read stdin into in-line at end move zero to eof.
		
		if eof is not equal to zero
			display in-line.
	
	calculateValue.
		move 0 to sum.
