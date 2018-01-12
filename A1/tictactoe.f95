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
		
		if (gameState == 0) exit
		
	end do
	
end subroutine playTicTacToe

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
