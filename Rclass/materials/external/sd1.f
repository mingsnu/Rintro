
      subroutine cusum1(m, n, k, res)

      integer n, k
      double precision m
	  integer stride = n
      integer i

      do 10 i = 2, n
          x(i) = x(i) + x(i-1)
   10 continue

      end

	 
