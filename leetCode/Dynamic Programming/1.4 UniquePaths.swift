//
//  1.4 UniquePaths.swift
//  leetCode
//
//  Created by czw on 8/1/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/unique-paths/
 难度： 中等
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 问总共有多少条不同的路径？
 
 例如，上图是一个7 x 3 的网格。有多少可能的路径？
 示例 1:
 输入: m = 3, n = 2
 输出: 3
 
 解释:
 从左上角开始，总共有 3 条路径可以到达右下角。
 1. 向右 -> 向右 -> 向下
 2. 向右 -> 向下 -> 向右
 3. 向下 -> 向右 -> 向右
 
 示例 2:
 输入: m = 7, n = 3
 输出: 28
 
 提示：
 1 <= m, n <= 100
 题目数据保证答案小于等于 2 * 10 ^ 9x

分析：
 动态规划&分冶问题
 自顶向下思考问题
 设 f(m,n) 为找到 start 总路径条数
 那么只差一步到达 f(m,n) 的情况是 f(m,n-1) 和 f(m-1,n)，就是最后一步是向右和向下
 所以
 f(m,n) = f(m,n-1) + f(m-1,n)
 f(1,n) = 1
 f(m,1) = 1
 
 优化，因为使用分冶递归的方式会有很多重复计算
 
 自底向上分析呢？
 那就动态规划
 根据
 f(m,n) = f(m,n-1) + f(m-1,n)
 f(1,n) = 1
 f(m,1) = 1
 
 dp[m][n] = dp[m-1][n] + dp[m][n-1]
 dp[1][n] = 1
 dp[m][1] = 1
 */
class UniquePaths {
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    if n == 1 || m == 1{
      return 1
    }
    return uniquePaths(m-1, n) + uniquePaths(m, n-1)
  }
  
  func uniquePaths1(_ m: Int, _ n: Int) -> Int {
    func path(_ m: Int, _ n: Int, _ cache: inout [[Int?]]) -> Int{
      if n == 0 || m == 0 { return 1 }

      if cache[m][n] != nil {
        return cache[m][n]!
      }
      cache[m][n] = path(m-1, n, &cache) + path(m, n-1, &cache)
      return cache[m][n]!
    }
    
    var cache = [[Int?]](repeating: [Int?](repeating: nil, count: n), count: m)
    // 数组遍历 是 0..<count
    return path(m-1, n-1, &cache)
  }
  
  func uniquePaths2(_ m: Int, _ n: Int) -> Int {
    var dp = [[Int?]](repeating: [Int?](repeating: nil, count: n), count: m)
    for i in 1..<m {
      for j in 1..<n {
        dp[i][j] = (dp[i-1][j] ?? 1) + (dp[i][j-1] ?? 1)
      }
    }
    return dp[m-1][n-1] ?? 1
  }
  
  // 优化空间复杂度1
  /*
   由于dp[i][j] = dp[i-1][j] + dp[i][j-1]，
   因此只需要保留当前行与上一行的数据 (在动态方程中，即pre[j] = dp[i-1][j])，两行，空间复杂度O(2n)；
   */
  func uniquePaths3(_ m: Int, _ n: Int) -> Int {
    
    var cur: [Int] = [1] * n
    var pre: [Int] = [1] * n
    
    for _ in 1..<m {
      for j in 1..<n {
        cur[j] = pre[j] + cur[j-1]
      }
      pre = cur
    }
    return pre[n-1]
  }
  // 优化空间复杂度2
  /*
   cur[j] += cur[j-1], 即cur[j] = cur[j] + cur[j-1]
   等价于思路二-->> cur[j] = pre[j] + cur[j-1]，因此空间复杂度为O(n).
   */
  func uniquePaths4(_ m: Int, _ n: Int) -> Int {
    var cur: [Int] = [1] * n
    for _ in 1..<m {
      for j in 1..<n {
        cur[j] += cur[j-1]
      }
    }
    return cur[n-1]
  }
}

extension UniquePaths: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
//      print(uniquePaths(22, 15))
    }
    performLogCostTime(self.name+" method1") {
      print(uniquePaths1(22, 25))
    }
    performLogCostTime(self.name+" method2") {
      print(uniquePaths2(22, 25))
    }
    performLogCostTime(self.name+" method3") {
      print(uniquePaths3(22, 25))
    }
    performLogCostTime(self.name+" method4") {
      print(uniquePaths4(22, 25))
    }
  }
}
