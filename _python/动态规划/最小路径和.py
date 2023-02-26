
"""
https://leetcode.cn/problems/minimum-path-sum/

因为要防止路径重复计算，所以要使用数组把计算好的路径保存起来
dp[m][n] = min(dp[m][n-1], dp[m-1][n]) + grid[m-1][n-1]
"""
from typing import List
import sys

class Solution:
  def _minPathSum(self, grid: List[List[int]]) -> int:
    m,n = len(grid), len(grid[0])
    dp = [[0]*(n) for _ in range(m)]

    dp[0][0] = grid[0][0]
    for i in range(1,m): dp[i][0] = dp[i-1][0] + grid[i][0]
    for j in range(1,n): dp[0][j] = dp[0][j-1] + grid[0][j]
    for i in range(1, m):
      for j in range(1, n):
        dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]

    return dp[m-1][n-1]



s = Solution()
print(s.minPathSum([[1,3],[4,2]]))
