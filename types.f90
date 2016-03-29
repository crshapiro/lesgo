!!
!!  Copyright (C) 2009-2013  Johns Hopkins University
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
module types
!*********************************************************************
!
! This module provides generic types
!
implicit none

public
! rprec is used to specify precision
#ifdef PPDBLPREC
integer, parameter :: rprec = kind (1.d0)
#else
integer, parameter :: rprec = kind (1.0)
#endif
 
!integer, parameter :: rprec = kind (1.e0)
!integer, parameter :: rprec = selected_real_kind (6)
!integer, parameter :: rprec = selected_real_kind (15)

type vec3d_t
  real(rprec) :: mag
  real(rprec), dimension(3) :: xyz
end type vec3d_t

type vec2d_t
  real(rprec) :: mag
  real(rprec), dimension(2) :: xy
end type vec2d_t

type point3D_t
  real(rprec), dimension(3) :: xyz
end type point3D_t



end module types
