program Rainfall
    
    implicit none
    
    integer:: i, j, nx, ny  
    character(15), dimension(5):: town
    real, dimension(5):: rain
    character(1)::ans
    
    
!   Open/Read files ---------------------------------------------------------------------------------------------------
    open(1, file='data.txt', status='old')
    
    read(1,*) 
    do i=1,5
        read(1,*) town(i), rain(i)
    end do
    
!   Printing data from data.txt ---------------------------------------------------------------------------------------    
    write(*,100)
100 FORMAT ('Town',17x,'Rain') 
    do i=1,5
        write(*,200) town(i), rain(i)
    end do
200 FORMAT (A15,5x,F6.1) 
    
!   Exit from console--------------------------------------------------------------------------------------------------
    write (*,*) 'Press y to exit'
300 read (*,*) ans
    
    if (ans=='y') then
        stop
    else 
        go to 300
    end if
    
end program Rainfall