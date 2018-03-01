with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure QueensR is
	
	--global variable (for counting number of valid boards)
	successCount : Integer := 1;
	
	--establish "board" as a type of 2D array 
	type board is array(1..8, 1..8) of character;
	
	--resets file
	procedure setupFile is
		
		file : file_Type;
		
	begin
		
		create(file, out_file, "queensR.txt");
		close(file);
		
	end setupFile;
	
	--saves contents of b to file
	procedure saveBoardToFile(b : board) is
		
		file : file_Type;
		
	begin
		
		open(file, append_file, "queensR.txt");
		
		if is_open(file) then
			
			put_line(file, "Valid Config");
			for i in 1..8 loop
				
				for j in 1..8 loop
					
					put(file, b(i,j));
					
				end loop;
				put_line(file, "");
				
			end loop;
			
			close(file);
			
		end if;
		
	end saveBoardToFile;
	
	--setup an empty board
	function setupBoard return board is
		
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
	procedure displayBoard(b : board) is
		
	begin
		
		new_line;
		put("Board Output "); put(successCount); new_line;
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
	function isValidPlacement(b : board; r : integer; c : integer) return Boolean is
		
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
	
	--function called to solve the 8 queens problem (recursively)
	procedure solve8Queens(b : board; row : integer) is
		
		bTmp : board;
		
	begin
		
		if row = 9 then
			
			--We've reached the a state where the board is full.
			displayBoard(b);
			saveBoardToFile(b);
			
		else
			
			bTmp := b;
			--loop through the current row and check if certain piece
			--placements are valid
			for i in 1..8 loop
				
				if isValidPlacement(b, row, i) then
					
					bTmp(row,i) := 'Q';
					solve8Queens(bTmp, row + 1);
					--after running through all combinations from 
					--solve8Queens(), set this piece back to empty and
					--move onto the next one
					bTmp(row,i) := '.';
					
				end if;
				
			end loop;
			
		end if;
		
	end solve8Queens;
	
	b : board;
	
begin
	
	setupFile;
	b := setupBoard;
	--run algorithm
	solve8Queens(b, 1);
	
end QueensR;
