with Ada.Text_IO; use Ada.Text_IO;

package body stack is
	
	STACK_MAX : Integer := 10;
	type list is array(1..STACK_MAX) of board;
	type board_stack is
		record
			item : list;
			top : natural := 0;
		end record;
	
	st : board_stack;
	
	procedure push(x : in board) is
		
	begin
		
		if st.top = STACK_MAX then
			put_line("error - stack is full");
		else
			st.top := st.top + 1;
			st.item(st.top) := x;
		end if;
		
	end push;
	
	procedure pop(x : out board) is
		
	begin
		
		if st.top = 0 then
			put_line("error - stack is empty");
		else
			x := st.item(st.top);
			st.top := st.top - 1;
		end if;
		
	end pop;
	
	function stack_is_empty return Boolean is
		
	begin
		
		return st.top = 0;
		
	end stack_is_empty;
	
	function stack_top return board is
		
	begin
		
		if st.top = 0 then
			put_line("error - stack is empty");
		end if;
		return st.item(st.top);
		
	end stack_top;
	
	function stack_size return Integer is
	
	begin
		return st.top;
	end stack_size;
	
	procedure reset_stack is
		
	begin
		
		st.top := 0;
		
	end reset_stack;
	
end stack;
