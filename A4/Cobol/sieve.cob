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
			
procedure division.
	display prompt-msg.
	accept N.
	move 1 to counter.
	
	perform initialize-values until counter is equal to N.
	
	move 1 to counter.
	
	perform print-values until counter is equal to N.
	
	initialize-values.
		move counter to val(counter).
		add 1 to val(counter).
		add 1 to counter.
		
	print-values.
		if val(counter) is not equal to 0
			display val(counter).
		add 1 to counter.
	
