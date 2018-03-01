package stack is
	
	type board is array(1..8, 1..8) of character;
	procedure push(x : in board);
	procedure pop(x : out board);
	function stack_is_empty return Boolean;
	function stack_top return board;
	function stack_size return Integer; 
	procedure reset_stack;
	
end stack;
