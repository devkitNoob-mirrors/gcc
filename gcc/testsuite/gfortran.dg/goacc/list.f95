! { dg-do compile } 
! { dg-additional-options "-fmax-errors=100" } 

program test 
  implicit none

  integer :: i, j, k, l, a(10)
  common /b/ k
  real, pointer :: p1 => NULL()
  complex :: c, d(10)


  !$acc parallel private(i)
  !$acc end parallel

  !$acc parallel private(a)
  !$acc end parallel

  !$acc parallel private(c, d)
  !$acc end parallel

  !$acc parallel private(i, j, k, l, a)
  !$acc end parallel  

  !$acc parallel private (i) private (j)
  !$acc end parallel

  !$acc parallel private ! { dg-error "Failed to match clause" }

  !$acc parallel private() ! { dg-error "Syntax error" }

  !$acc parallel private(a(1:3)) ! { dg-error "Syntax error" }

  !$acc parallel private(10) ! { dg-error "Syntax error" }

  !$acc parallel private(/b/, /b/) ! { dg-error "present on multiple clauses" }
  !$acc end parallel

  !$acc parallel private(i, j, i) ! { dg-error "present on multiple clauses" }
  !$acc end parallel

  !$acc parallel private(p1) 
  !$acc end parallel

  !$acc parallel firstprivate(i)
  !$acc end parallel

  !$acc parallel firstprivate(c, d)
  !$acc end parallel

  !$acc parallel firstprivate(a)
  !$acc end parallel

  !$acc parallel firstprivate(i, j, k, l, a)
  !$acc end parallel  

  !$acc parallel firstprivate (i) firstprivate (j)
  !$acc end parallel

  !$acc parallel firstprivate ! { dg-error "Failed to match clause" }

  !$acc parallel firstprivate() ! { dg-error "Syntax error" }

  !$acc parallel firstprivate(a(1:3)) ! { dg-error "Syntax error" }

  !$acc parallel firstprivate(10) ! { dg-error "Syntax error" }

  !$acc parallel firstprivate (/b/, /b/) ! { dg-error "present on multiple clauses" }
  !$acc end parallel

  !$acc parallel firstprivate (i, j, i) ! { dg-error "present on multiple clauses" }
  !$acc end parallel

  !$acc parallel firstprivate(p1) 
  !$acc end parallel

  !$acc parallel private (i) firstprivate (i) ! { dg-error "present on multiple clauses" }
  !$acc end parallel


  !$acc serial private(i)
  !$acc end serial

  !$acc serial private(a)
  !$acc end serial

  !$acc serial private(c, d)
  !$acc end serial

  !$acc serial private(i, j, k, l, a)
  !$acc end serial  

  !$acc serial private (i) private (j)
  !$acc end serial

  !$acc serial private ! { dg-error "Failed to match clause" }

  !$acc serial private() ! { dg-error "Syntax error" }

  !$acc serial private(a(1:3)) ! { dg-error "Syntax error" }

  !$acc serial private(10) ! { dg-error "Syntax error" }

  !$acc serial private(/b/, /b/) ! { dg-error "present on multiple clauses" }
  !$acc end serial

  !$acc serial private(i, j, i) ! { dg-error "present on multiple clauses" }
  !$acc end serial

  !$acc serial private(p1) 
  !$acc end serial

  !$acc serial firstprivate(i)
  !$acc end serial

  !$acc serial firstprivate(c, d)
  !$acc end serial

  !$acc serial firstprivate(a)
  !$acc end serial

  !$acc serial firstprivate(i, j, k, l, a)
  !$acc end serial  

  !$acc serial firstprivate (i) firstprivate (j)
  !$acc end serial

  !$acc serial firstprivate ! { dg-error "Failed to match clause" }

  !$acc serial firstprivate() ! { dg-error "Syntax error" }

  !$acc serial firstprivate(a(1:3)) ! { dg-error "Syntax error" }

  !$acc serial firstprivate(10) ! { dg-error "Syntax error" }

  !$acc serial firstprivate (/b/, /b/) ! { dg-error "present on multiple clauses" }
  !$acc end serial

  !$acc serial firstprivate (i, j, i) ! { dg-error "present on multiple clauses" }
  !$acc end serial

  !$acc serial firstprivate(p1) 
  !$acc end serial

  !$acc serial private (i) firstprivate (i) ! { dg-error "present on multiple clauses" }
  !$acc end serial


  !$acc host_data use_device(i) ! { dg-error "neither a POINTER nor an array" }
  !$acc end host_data

  !$acc host_data use_device(c, d) ! { dg-error "neither a POINTER nor an array" }
  !$acc end host_data

  !$acc host_data use_device(a)
  !$acc end host_data

  !$acc host_data use_device(i, j, k, l, a) ! { dg-error "neither a POINTER nor an array" }
  !$acc end host_data  

  !$acc host_data use_device (i) use_device (j) ! { dg-error "neither a POINTER nor an array" }
  !$acc end host_data

  !$acc host_data use_device ! { dg-error "Failed to match clause" }

  !$acc host_data use_device() ! { dg-error "Syntax error" }

  !$acc host_data use_device(a(1:3)) ! { dg-error "Syntax error" }

  !$acc host_data use_device(10) ! { dg-error "Syntax error" }

  !$acc host_data use_device(/b/, /b/)
  ! { dg-error "neither a POINTER nor an array" "" { target *-*-* } .-1 }
  ! { dg-error "present on multiple clauses" "" { target *-*-* } .-2 }
  !$acc end host_data

  !$acc host_data use_device(i, j, i)
  ! { dg-error "neither a POINTER nor an array" "" { target *-*-* } .-1 }
  ! { dg-error "present on multiple clauses" "" { target *-*-* } .-2 }
  !$acc end host_data

  !$acc host_data use_device(p1)
  !$acc end host_data

end program test
