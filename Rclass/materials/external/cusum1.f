
      subroutine cusum1(n, x)

      integer n
      double precision x(n)
      integer i

      do 10 i = 2, n
          x(i) = x(i) + x(i-1)
   10 continue

      end
