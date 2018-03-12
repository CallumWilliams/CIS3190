program-id. conv.

environment division.

data division.
	working-storage section.
		01 current pic XX.

procedure division.
	move 't' to current
	display 'Variable |', current, '|'.
