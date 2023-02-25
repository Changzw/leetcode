
class Solution(object):
    def myPow(self, x, n):
        """
        :type x: float
        :type n: int
        :rtype: float
        """
        """
        n 奇数:f(n) = f((n-1)/2)*f((n-1)/2)*f(1)
        n 偶数:f(n) = f(n/2)*f(n/2)
        n 负数: 1/x
        f(0) = 1
        f(1) = x
        """
        if n == 0: return 1
        if n == 1: return x
        if n == -1: return 1/x

        if n % 2 == 0:
          y = self.myPow(x, n//2)
          return y * y * x
        else:
          y = self.myPow(x, (n-1)//2)
          return y * y

    def myPow(self, x, n):
        """
        :type x: float
        :type n: int
        :rtype: float
        """
        def quickMul(N):
          ans = 1.0
          x_tribute = x
          while N>0:
            if N%2==1:
              ans *=x_tribute
            x_tribute *=x_tribute
            N=N//2
          return ans
        return quickMul(n) if n >= 0 else 1.0 / quickMul(-n)

    def _myPow(self, x, n):
      if x == 0: return 0
      if n<0:
        n, x = -n, 1/x

      res = 1
      while n:
        if n & 1:
          res *= x
        x *= x
        n >>= 1
      return res

s = Solution()
print(s._myPow(2, 10))
