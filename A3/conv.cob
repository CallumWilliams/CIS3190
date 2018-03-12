program-id. conv.

data division.
	working-storage section.
		77 usr-in pic x(30) value space.
		77 str-len pic 99.
		77 ind pic 99.
		77 current-char pic x.
		
procedure division.
	display 'Enter the Roman Numeral to be converted: '.
	accept usr-in.
	unstring usr-in
		delimited by all spaces
		into usr-in count in str-len.
	display str-len.
		
