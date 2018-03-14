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
		01 parsing.
			05 initial-parse pic 9 value 1.
			05 magnitude pic 9.
		77 eof pic 9 value 1.
		77 err pic 9 value 1.
		77 strlen pic 99.
		77 i pic 9 value 1.
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
		move 1 to i.
		move 1 to initial-parse.
		perform calc-loop until i is greater than strlen.
		display in-line, ' = ', total.
		
		calc-loop.
			move in-line(i:1) to current.
			if current is equal to 'M' or 'm'
				
				perform addM
				
			else if current is equal to 'D' or 'd'
				
				perform addD
					
			else if current is equal to 'C' or 'c'
				
				perform addC
				
			else if current is equal to 'L' or 'l'
				
				perform addL
				
			else if current is equal to 'X' or 'x'
				
				perform addX
				
			else if current is equal to 'V' or 'v'
				
				perform addV
				
			else if current is equal to 'I' or 'i'
				
				perform addI
				
			else
				
				display 'error'.
				
			add 1 to i.
			display total.
		
		addM.
			add 1000 to total.
			
		addD.
			add 500 to total.
			
		addC.
			add 100 to total.
			
		addL.
			add 50 to total.
			
		addX.
			add 10 to total.
			
		addV.
			add 5 to total.
			
		addI.
			add 1 to total.
			
