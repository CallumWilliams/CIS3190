program-id. romannumerals.

environment division.
	input-output section.
		file-control.
			select standard-input assign to "input.txt" organization is line sequential.
			select standard-output assign to display.

data division.
	file section.
		fd standard-input.
			01 stdin pic x(80).
		fd standard-output.
			01 stdout pic x(80).
	working-storage section.
		77 N pic s99.
		77 temp pic s9(8).
		77 ret pic s9.
		01 array-area.
			02 r pic x(1) occurs 30 times.
		01 input-area.
			02 in-r pic x(1).
			02 filler pic x(79).
		01 title-line.
			02 filler pic x(11) value spaces.
			02 filler pic x(24) value 'Roman Number Equivalents'.
		01 underline-1.
			02 filler pic x(45) value '---------------------------------------------'.
		01 col-heads.
			02 filler pic x(9) value spaces.
			02 filler pic x(12) value 'Roman Number'.
			02 filler pic x(13) value spaces.
			02 filler pic x(11) value 'Dec. Equiv.'.
		01 underline-2.
			02 filler pic x(45) value ' ------------------------------   -----------'.
		01 print-line.
			02 filler pic x value space.
			02 out-r pic x(30).
			02 filler pic x(3) value spaces.
			02 out-eq pic z(9).
		01 parsing.
			02 eof pic 9.

procedure division.
	
	open input standard-input, output standard-output.
	
	write stdout from title-line after advancing 0 lines.
	write stdout from underline-1 after advancing 1 line.
	write stdout from col-heads after advancing 1 line.
	write stdout from underline-2 after advancing 1 line.
	
	move 1 to N.
	move 1 to eof.
	move spaces to array-area.
	
	perform readLine until eof = 0.
	
	close standard-input.
	
	stop run.
	
	readLine.
		read standard-input into input-area at end move zero to eof.
		
		if eof is not equal to zero
			call "conv" using input-area.
		move 1 to N.
		move 1 to eof.
		move spaces to input-area.
