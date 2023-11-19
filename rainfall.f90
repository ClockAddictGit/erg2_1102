program Rainfall
    
    implicit none
    
    integer:: i, n
    character(15),dimension(50):: town
    real,dimension(50):: rain
    character(1)::ans
    
    call read_print_data (n, town, rain)
        
!   Printing data from data.txt ---------------------------------------------------------------------------------------    
    write(*,100)
100 FORMAT ('Town',16x,'Rain') 
    do i=1,n-1
        write(*,200) town(i), rain(i)
    end do
200 FORMAT (A15,5x,F6.1)
    
!Exit from console ---------------------------------------------------------------------------------------
    write (*,*) 'Press y to exit'
300 read (*,*) ans    
    if (ans=='y') then
        stop
    else 
        go to 300
    end if
    
    
   
!   Diadikasies 
    contains
    
!   Yporoutina diabasmatos kai apeikonisis data.txt
    subroutine read_print_data (nmax,T,R)
    
        integer:: k, nmax, st
        character(15),dimension(50):: T
        real,dimension(50):: R
    
        open(1, file='data.txt', iostat=st)
        if(st/= 0) then
        print*, 'Error'
        else
            read(1,*) 
            nmax=0
            do k=1,50
                read(1,*,iostat=st) T(k), R(k)
                nmax=nmax+1
                if (st==-1) exit
            end do
        end if
    
    end subroutine read_print_data
    
    
end program Rainfall