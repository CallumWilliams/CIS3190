program sieve

implicit none

integer ::  n
integer :: sta
character (len=7) :: input

call getarg(1, input)
read(input, *, iostat=sta) n

call solveSieve(n)
	
contains

subroutine solveSieve(n)
	
	integer, intent(in) :: n
	
	integer, dimension(n-1) :: values
	integer, dimension(4) :: divs
	integer :: i
	integer :: j
	integer :: check
	
	!setup initial values
	do i = 1, n - 1, 1
		
		values(i) = i + 1
		
	end do
	
	!setup dividers
	divs(1) = 2
	divs(2) = 3
	divs(3) = 5
	divs(4) = 7
	
	!start algorithm
	do i = 1, 4, 1
		
		do j = 2, n - 1, 1 !skips 2 and 3
			
			if (values(j) == 0) then
				!ignore, already changed
			else
				
				check = floor(real(values(j)/divs(i)))
				if ((check == 0) .or. (check == 1)) then
					!either is not divisible or is one of our lower primes
				else
					
					!check if value is perfectly divisible
					if (mod(values(j), divs(i)) == 0) then
						
						!remove value
						values(j) = 0
						
					end if
					
				end if
				
			end if
			
		end do
		
	end do
	
	open(unit=9, file='sieve.txt', status='old', action='write')
	
	do i = 1, n - 1, 1
		
		if (values(i) /= 0) then
			!was not removed. Print.
			write(9,*) values(i)
		end if;
		
	end do
	close(9, status='keep')
	
end subroutine solveSieve

end program sieve

