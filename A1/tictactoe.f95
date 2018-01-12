program tictactoe

!	Developed by Callum Williams
!	For CIS*3190 - Software For Legacy Systems
!	Winter 2018

implicit none

character(len = 9) :: board = '         ' !blank board
logical :: tmp
integer  :: gameState = 1;

tmp = showBoard(board)

do

contains

logical function showBoard(b)
	
	implicit none
	
	character(len=9), intent(in) :: b
	integer :: i, j
	
	do i = 1, 3, 1
		write(*,50) b(((3*i)-2):((3*i)-2)), '|', b(((3*i)-1):((3*i)-1)), '|', b((3*i):(3*i))
		50 format(1X,A1,A1,A1,A1,A1)
		if (i /= 3) write(*,*) '-+-+-'
	end do
	
end function showBoard

end program tictactoe
