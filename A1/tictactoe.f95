program tictactoe

!	Developed by Callum Williams
!	For CIS*3190 - Software For Legacy Systems
!	Winter 2018

implicit none

character(len = 9) :: board = '000000000' !blank board
logical :: tmp

tmp = showBoard(board)

contains

logical function showBoard(b)
	
	implicit none
	
	character(len=9), intent(in) :: b
	integer :: i, j
	
	do i = 0, 8, 1
		WRITE(*,*) i
	end do
	
end function showBoard

end program tictactoe
