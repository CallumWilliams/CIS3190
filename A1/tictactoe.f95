program tictactoe

!	Developed by Callum Williams
!	For CIS*3190 - Software For Legacy Systems
!	Winter 2018

implicit none

call playTicTacToe()

contains

subroutine playTicTacToe()
	
	character(len=9) :: b = '         ' !blank board
	integer :: gameState = 1
	integer :: playerMove;
	integer :: compMove;
	integer :: moveCount = 0;
	
	write(*,*) 'TicTacToe'
	write(*,*) '---------'
	write(*,*) ' 1 | 2 | 3 '
	write(*,*) '---|---|---'
	write(*,*) ' 4 | 5 | 6 '
	write(*,*) '---|---|---'
	write(*,*) ' 7 | 8 | 9 '
	write(*,*)
	
	do
		
		playerMove = getMove(b)
		b(playerMove:playerMove) = 'X'
		moveCount = moveCount + 1
		if (moveCount > 8) then
			write(*,*) 'Tie game'
			call showBoard(b)
			exit
		end if
		call showBoard(b)
		!call chkovr(b)
		compMove = pickMove(b)
		b(compMove:compMove) = 'O'
		moveCount = moveCount + 1
		call showBoard(b)
		
		if (gameState == 0) exit
		
	end do
	
end subroutine playTicTacToe

integer function pickMove(b)
	
	character(len=9), intent(in) :: b
	integer :: checkSum
	integer :: i
	integer :: output = 0
	real :: n
	
	integer, allocatable :: seed(:)
	integer :: size, clock
	
	checkSum = 0	
	!first row
	do i = 1, 3
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !in case either of the two success cases happen, keep track of blank space
		end if
	end do
	write(*,*) checkSum
	if ((checkSum == 8) .or. (checkSum == 2)) then
		pickMove = output
		go to 20
	end if
	
	checkSum = 0
	!second row
	do i = 4, 6
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !if either of the two success cases happen, keep track of blank space
		end if
	end do
	if (checkSum == 8 .or. checkSum == 2) then
		pickMove = output
		go to 20
	end if
	
	checkSum = 0
	!third row
	do i = 7, 9
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !if either of the two success cases happen, keep track of blank space
		end if
	end do
	if (checkSum == 8 .or. checkSum == 2) then
		pickMove = output
		go to 20
	end if
	
	checkSum = 0
	!first column
	do i = 1, 7, 3
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !if either of the two success cases happen, keep track of blank space
		end if
	end do
	if (checkSum == 8 .or. checkSum == 2) then
		pickMove = output
		go to 20
	end if
	
	checkSum = 0
	!second column
	do i = 2, 8, 3
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !if either of the two success cases happen, keep track of blank space
		end if
	end do
	if (checkSum == 8 .or. checkSum == 2) then
		pickMove = output
		go to 20
	end if
	
	checkSum = 0
	!third column
	do i = 3, 9, 3
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !if either of the two success cases happen, keep track of blank space
		end if
	end do
	if (checkSum == 8 .or. checkSum == 2) then
		pickMove = output
		go to 20
	end if
	
	checkSum = 0
	!first diagonal
	do i = 1, 9, 4
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !if either of the two success cases happen, keep track of blank space
		end if
	end do
	if (checkSum == 8 .or. checkSum == 2) then
		pickMove = output
		go to 20
	end if
	
	checkSum = 0
	!second diagonal
	do i = 3, 7, 2
		if (b(i:i) == 'O') then
			checkSum = checkSum + 4
		else if (b(i:i) == 'X') then
			checkSum = checkSum + 1
		else
			output = i !if either of the two success cases happen, keep track of blank space
		end if
	end do
	if (checkSum == 8 .or. checkSum == 2) then
		pickMove = output
		go to 20
	end if
	
	!pick randomly
	call random_seed(size=size)
	allocate(seed(size))
	call system_clock(count=clock)
	call random_seed(put=seed)
	do
		output = 1 + (rand(seed(1))*9)
		if (b(output:output) == ' ') go to 20
		call random_seed(put=seed)
	end do
	
	20 write(*,*) 'Opponent move - ', output
	pickMove = output
	
end function pickMove

subroutine showBoard(b)
	
	implicit none
	
	character(len=9), intent(in) :: b
	integer :: i, j
	
	do i = 1, 3, 1
		write(*,50) b(((3*i)-2):((3*i)-2)), '|', b(((3*i)-1):((3*i)-1)), '|', b((3*i):(3*i))
		50 format(1X,A1,A1,A1,A1,A1)
		if (i /= 3) write(*,*) '-+-+-'
	end do
	
end subroutine showBoard

integer function getMove(b)
	
	character(len=9), intent(in) :: b
	integer :: playerMove
	
	do
		write(*,*) 'Your move: '
		read(*,50) playerMove
		50 format(I1)
		if (chkplay(b, playerMove) == 1) then
			exit
		else
			write(*,*) 'Move invalid.'
		end if
	end do
	getMove = playerMove
	
end function getMove

integer function same(a, b, c, output)
	
	character, intent(in) :: a
	character, intent(in) :: b
	character, intent(in) :: c
	integer, intent(out) :: output
	
	if (a /= b) then
		output = 0
	else
		write(*,*) 'a = b'
		if (a /= c) then
			output = 0
		else
			output = 1
			write(*,*) 'a = c'
		end if
	end if
	same = output
	
end function same

subroutine chkovr(b)
	
	character(len=9), intent(in) :: b
	integer :: output
	
	output = same(b(1:1), b(2:2), b(3:3), output)
	if (output == 1) then
		!write(*,*) 'top row'
		if (b(1:1) == 'X') then
			write(*,*) 'Player wins'
		else if (b(1:1) == '0') then
			write(*,*) 'Computer wins'
		end if
	return
	end if
	
	output = same(b(4:4), b(5:5), b(6:6), output)
	if (output == 1) then
		if (b(4:4) == 'X') then
			write(*,*) 'Player wins'
		else if (b(4:4) == '0') then
			write(*,*) 'Computer wins'
		end if
	return
	end if
	output = same(b(7:7), b(8:8), b(9:9), output)
	if (output == 1) then
		if (b(7:7) == 'X') then
			write(*,*) 'Player wins'
		else if (b(7:7) == '0') then
			write(*,*) 'Computer wins'
		end if
	return
	end if
	
	
end subroutine chkovr

integer function chkplay(b, p)
	
	character(len=9), intent(in) :: b
	integer, intent(in) :: p
	
	if (b(p:p) /= ' ') then
		chkplay = 0
	else
		chkplay = 1
	end if
	
end function chkplay

end program tictactoe
