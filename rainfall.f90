program Rainfall
    
    implicit none
    
    integer:: i, j, n, st
    character(15),dimension(50):: town
    real,dimension(50):: rain
    character(1)::ans
    
!   Open/Read files ------------------------------------------------------------------------------------------------------------------
    open(1, file='data.txt', iostat=st)
    if(st/= 0) then
        print*, 'Error'
    else
        read(1,*) 
        n=0
        do i=1,50
            read(1,*,iostat=st) town(i), rain(i)
            n=n+1
            if (st==-1) exit
        end do
    end if
  
    
!   Printing data from data.txt ---------------------------------------------------------------------------------------    
    write(*,100)
100 FORMAT ('Town',16x,'Rain') 
    do i=1,n-1
        write(*,200) town(i), rain(i)
    end do
200 FORMAT (A15,5x,F6.1)
    
!   Exit from console ---------------------------------------------------------------------------------------
    write (*,*) 'Press y to exit'
300 read (*,*) ans    
    if (ans=='y') then
        stop
    else 
        go to 300
    end if
    
    
end program Rainfall