!!
!!  Copyright (C) 2011-2013  Johns Hopkins University
!!
!!  This file is part of lesgo.
!!
!!  lesgo is free software: you can redistribute it and/or modify
!!  it under the terms of the GNU General Public License as published by
!!  the Free Software Foundation, either version 3 of the License, or
!!  (at your option) any later version.
!!
!!  lesgo is distributed in the hope that it will be useful,
!!  but WITHOUT ANY WARRANTY; without even the implied warranty of
!!  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!!  GNU General Public License for more details.
!!
!!  You should have received a copy of the GNU General Public License
!!  along with lesgo.  If not, see <http://www.gnu.org/licenses/>.
!!

!*********************************************************************
module clocks
!*********************************************************************
!
! This module provides the clock data type (object) and the
! subroutines/functions that act on instances of the clock data type.
!
use types, only : rprec
implicit none

save 
private

public clock_t, &
     clock_start, &
     clock_stop

type clock_t
   real(rprec) :: start
   real(rprec) :: stop
   real(rprec) :: time
end type clock_t

!---------------------------------------------------------------------
contains
!---------------------------------------------------------------------

!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
subroutine clock_start( this )
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#ifdef PPMPI
use mpi, only : mpi_wtime
#endif
implicit none

type(clock_t), intent(inout) :: this

#ifdef PPMPI
this % start = mpi_wtime()
#else
call cpu_time( this % start )
#endif

return
end subroutine clock_start

!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
subroutine clock_stop( this )
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#ifdef PPMPI
use mpi, only : mpi_wtime
#endif
implicit none

type(clock_t), intent(inout) :: this

#ifdef PPMPI
this % stop = mpi_wtime()
#else
call cpu_time( this % stop )
#endif

! Compute the clock time
this % time = this % stop - this % start

return

end subroutine clock_stop

end module clocks
