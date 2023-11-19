program Rainfall
    
    implicit none
    
    character(1)::ans
    character(15),dimension(50):: town
    integer:: i, n
    real:: mean, m
    real,dimension(50):: rain
    
    
    call read_print_data (n, town, rain)
    mean=mean_rainfall(rain,n)
        
!   Printing data from data.txt ----------------------------------------------------------------------------------
    write(*,100)
100 FORMAT ('Town',16x,'Rain') 
    do i=1,n
        write(*,200) town(i), rain(i)
    end do
200 FORMAT (A15,5x,F6.1)
    
    write(*,'    ')
    
!   Printing mean value of rainfall
    write(*,300) mean
300 FORMAT ('The mean value of rainfall of all cities is',1x,F6.1)
    
    write(*,'    ')
    
!   Exit from console --------------------------------------------------------------------------------------------
    write (*,*) 'Press y to exit'
400 read (*,*) ans    
    if (ans=='y') then
        stop
    else 
        go to 400
    end if
    
!------------------------------------------------------------------------------------------------------------------   
!------------------------------------------------------------------------------------------------------------------   
    
!   Diadikasies 
    contains
    
!   Yporoutina diabasmatos kai apeikonisis data.txt----------------------------------------------------------------
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
                if (st==-1) exit
                nmax=nmax+1
            end do
        end if
    
    end subroutine read_print_data
    
!   Sunartisi upologismou mesou orou vroxoptwsis------------------------------------------------------------------
    function mean_rainfall(x,p) result(m)
        
        integer:: p, k
        real:: m
        real,dimension(p):: x, y
        
        m=0
        do k=1,p
            m=x(k)+m
        end do
        m=m/p
           
    end function
    
    
    
end program Rainfall