with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with stack; use stack;

procedure QueensNR is
	
	successCount : Integer := 1;
	
	--setup an empty board
	function setupBoard return stack.board is
		
		b : board;
		
	begin
		
		for i in 1..8 loop
			for j in 1..8 loop
				b(i,j) := '.';
			end loop;
		end loop;
		return b;
		
	end setupBoard;
	
	--display contents of board.
	procedure displayBoard(b : stack.board) is
		
	begin
		
		new_line;
		put_line("Board Output");
		successCount := successCount + 1;
		for i in 1..8 loop
			for j in 1..8 loop
				put(b(i,j));
			end loop;
			new_line;
		end loop;
		
	end displayBoard;
	
	--checks cell (r, c) of board to see if it is a valid place for a piece
	--does so by checking the vertical row, then each of the four diagonals
	--(i.e. upper-left, upper-right, lower-left, and lower-right)
	function isValidPlacement(b : stack.board; r : integer; c : integer) return Boolean is
		
		rTmp : integer;
		cTmp : integer;
		
	begin
		
		--check column c
		
		for i in 1..8 loop
			
			if b(i,c) = 'Q' then
				
				return false;
				
			end if;
			
		end loop;
		
		--check upper-left diagonal
			
		rTmp := r;
		cTmp := c;
		
		--loop until we are no longer on the board
		while (rTmp /= 0 or cTmp /= 0) loop
			
			if b(rTmp, cTmp) = 'Q' then
				
				--moving to the upper left, a queen was found. Return false
				return false;
				
			end if;
			
			--continue to next cell
			rTmp := rTmp - 1;
			cTmp := cTmp - 1;
			exit when (rTmp = 0 or cTmp = 0);
			
		end loop;
		
		--check upper-right diagonal
		
		rTmp := r;
		cTmp := c;
		
		--loop until we are no longer on the board
		while (rTmp /= 0 or cTmp /= 9) loop
			
			if b(rTmp, cTmp) = 'Q' then
				
				--moving to the upper right, a queen was found. Return false
				return false;
				
			end if;
			
			--continue to next cell
			rTmp := rTmp - 1;
			cTmp := cTmp + 1;
			exit when (rTmp = 0 or cTmp = 9);
			
		end loop;
		
		--check lower-left diagonal
		
		rTmp := r;
		cTmp := c;
		
		--loop until we are no longer on the board
		while (rTmp /= 9 or cTmp /= 0) loop
			
			if b(rTmp, cTmp) = 'Q' then
				
				--moving to the lower left, a queen was found. Return false
				return false;
				
			end if;
			
			--continue to next cell
			rTmp := rTmp + 1;
			cTmp := cTmp - 1;
			exit when (rTmp = 9 or cTmp = 0);
			
		end loop;
		
		--check lower-right diagonal
		
		rTmp := r;
		cTmp := c;
		
		--loop until we are no longer on the board
		while (rTmp /= 9 or cTmp /= 9) loop
			
			if b(rTmp, cTmp) = 'Q' then
				
				--moving to the lower right, a queen was found. Return false
				return false;
				
			end if;
			
			--continue to next cell
			rTmp := rTmp + 1;
			cTmp := cTmp + 1;
			exit when (rTmp = 9 or cTmp = 9);
			
		end loop;
		
		return true;
		
	end isValidPlacement;
	
	--function called to solve the 8 queens problem (non-recursively)
	procedure solve8Queens is
		
		b : stack.board;
		row : Integer;
		col : array(1..8) of Integer;
		found_place : Boolean;
		i : Integer;--can't use a conventional for loop because we need to backtrack to col(row)
		
	begin
		
		row := 1;--starting point for board
		i := 1;
		for i in 1..8 loop
			col(i) := 1;
		end loop;
		
		--initial setup for board
		b := setupBoard;
		
		Main_Loop: loop
			
			found_place := false;
			
			--find a spot to put the queen
			Mid_Loop: loop
				
				exit Mid_Loop when i = 9;--in case we don't find a place
				if isValidPlacement(b, row, i) then
					
					--we found a valid placement, leave the loop
					col(row) := i;--keep track of column on current row
					found_place := true;
				
				end if;
				
				exit Mid_Loop when found_place;
				
				i := i + 1;
				
			end loop Mid_Loop;
			
			--check found_place value
			if found_place then
				
				--progress
				b(row, col(row)) := 'Q';
				push(b);
				row := row + 1;
				i := 1;
				
			else
				
				--revert
				exit Main_Loop when stack_is_empty;--terminate main loop
				pop(b);
				--undo queen on previous row
				row := row - 1;
				b(row, col(row)) := '.';
				i := col(row) + 1;
				
			end if;
			
			--check if we are done
			if stack_size = 8 then
				
				displayBoard(b);
				--we are done with this config. Revert.
				pop(b);
				row := row - 1;
				b(row, col(row)) := '.';
				i := col(row) + 1;
				
			end if;
			
		end loop Main_Loop;
		
	end solve8Queens;
	
begin
	
	solve8Queens;
	
end QueensNR;
