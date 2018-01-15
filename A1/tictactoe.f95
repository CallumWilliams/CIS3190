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
		call showBoard(b)
		compMove = pickMove(b)
		write(*,*) compMove
		b(compMove:compMove) = 'O'
		call showBoard(b)
		
		if (gameState == 0) exit
		
	end do
	
end subroutine playTicTacToe

integer function pickMove(b)
	
	character(len=9), intent(in) :: b
	integer :: checkSum = 0
	integer :: checkComplete = 0
	integer :: i
	integer :: output = 0
	
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
	if (checkSum == 8 .or. checkSum == 2) then
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
	do
		output = int(rand()*9)+1
		if (b(output:output) == ' ') exit
		write(*,*) 'rand'
	end do
	
	20 write(*,*) 'Opponent move'
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
