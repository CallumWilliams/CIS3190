with ada.Text_IO; use Ada.Text_IO;
with ada.strings.unbounded; use Ada.Strings.Unbounded;
with ada.integer_text_io; use Ada.integer_text_io;
with ada.Command_Line; use Ada.Command_Line;

procedure sieve is
	
	procedure startAlgorithm(j : integer) is
		
		val : array(1..j-1) of integer;
		div : array(1..4) of integer := (2, 3, 5, 7);
		check : integer;
		remainder : integer;
		file : file_Type;
		
	begin
		
		--initialize values
		for i in 1..j-1 loop
			
			val(i) := i + 1;
			
		end loop;
		
		--apply algorithm
		for d in 1..4 loop
			
			for i in 3..j-1 loop
				
				if val(i) /= 0 then
					
					check := val(i) / div(d);
					if check /= 0 or check /= 1 then
						
						remainder := val(i) rem div(d);
						if remainder = 0 then
							val(i) := 0;
						end if;
						
					end if;
					
				end if;
				
			end loop;
			
		end loop;
		
		create(file, out_file, "sieve.txt");
		close(file);
		create(file, append_file, "sieve.txt");
		--print values
		if is_open(file) then
			
			for i in 1..j-1 loop
			
			if val(i) /= 0 then
				put(file, val(i)); put(file, " ");
			end if;
			
		end loop;
			
		end if;
		
		close(file);
		
	end startAlgorithm;
	
	n : integer;
	
begin
	
	n := Integer'Value(argument(1));
	
	startAlgorithm(n);
	
end sieve;
