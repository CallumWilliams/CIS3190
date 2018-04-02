program-id. sieve.

environment division.
	input-output section.
		file-control.
			select standard-input assign to keyboard.
			select standard-output assign to "sieve.txt".
		
data division.
	file section.
		fd standard-input.
			01 stdin pic x(8).
		fd standard-output.
			01 stdout pic x(7).
	working-storage section.
		77 N pic 999999.
		77 counter pic 999999.
		77 value-tmp pic 999999.
		01 sieve-array.
			02 val pic 999999 occurs 1 to 999999 times depending on N.
		01 prompt-msg.
			02 filler pic x(36) value is 'Please enter the size of the sieve: '.
		01 sieve.
			02 sieve-div pic 9 occurs 4 times.
			02 sieve-ind pic 9.
			02 check pic 999999.
			02 rem pic 9.
			
procedure division.
	display prompt-msg.
	accept N.
	move 1 to counter.
	
	perform initialize-values until counter is equal to N.
	
	move 2 to sieve-div(1).
	move 3 to sieve-div(2).
	move 5 to sieve-div(3).
	move 7 to sieve-div(4).
	move 3 to counter.
	perform perform-sieve until counter is equal to N.
	
	move 1 to counter.
	open output standard-output.
	perform print-values until counter is equal to N.
	close standard-output.
	
	stop run.
	
	initialize-values.
		move counter to val(counter).
		add 1 to val(counter).
		add 1 to counter.
	
	perform-sieve.
		move 1 to sieve-ind.
		perform apply-sieve until sieve-ind is greater than 4.
		add 1 to counter.
	
	apply-sieve.
		divide val(counter) by sieve-div(sieve-ind) giving check remainder rem.
		if check is not equal to 0 or 1
			if rem is equal to 0
				move 0 to val(counter)
				move 4 to sieve-ind. 
		add 1 to sieve-ind.
		
	print-values.
		if val(counter) is not equal to 0
			write stdout from val(counter) after advancing 1 line.
		add 1 to counter.
	
