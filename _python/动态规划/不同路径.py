
"""
https://leetcode.cn/problems/unique-paths/
f(m,n) = f(m-1,n) + f(m, n-1)
使用递归：有很多值都是算过的了，eg f(1,1) 会重新算很多次

dp[m][n] = dp[m][n-1] + dp[m-1][n]
"""

class Solution:
  def _uniquePaths(self, m: int, n: int) -> int:
    if m == 1: return 1
    if n == 1: return 1
    return self.uniquePaths(m-1, n) + self.uniquePaths(m, n-1)

  def _0uniquePaths(self, m: int, n: int) -> int:
    if m == 1 and n == 1: return 1
    cache = [[0]*n for _ in range(m)]
    def path(x_step: int, y_step: int):
      if x_step == 0: return 1
      if y_step == 0: return 1
      if cache[x_step][y_step]:
        return cache[x_step][y_step]
      cache[x_step][y_step] = path(x_step-1, y_step) + path(x_step, y_step-1)
      return cache[x_step][y_step]

    return path(m-1, n-1)

  def uniquePaths(self, m: int, n: int) -> int:
    dp = [[1]*n] + [[1] + [0] * (n - 1) for _ in range(m-1)]
    for i in range(1, m):
      for j in range(1, n):
        dp[i][j] = dp[i][j-1] + dp[i-1][j]
    return dp[m-1][n-1]


    cache = [[0]*n for _ in range(m)]
    def path(x_step: int, y_step: int):
      if x_step == 0: return 1
      if y_step == 0: return 1
      if cache[x_step][y_step]:
        return cache[x_step][y_step]
      cache[x_step][y_step] = path(x_step-1, y_step) + path(x_step, y_step-1)
      return cache[x_step][y_step]

    return path(m-1, n-1)
s = Solution()
print(s._0uniquePaths(3, 3))
