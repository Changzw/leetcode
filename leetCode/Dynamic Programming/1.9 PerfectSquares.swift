//
//  1.9 PerfectSquares.swift
//  leetCode
//
//  Created by czw on 8/2/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/perfect-squares/
 难度：中等
 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。
 你需要让组成和的完全平方数的个数最少。
 
 示例 1:
 输入: n = 12
   输出: 3
   解释: 12 = 4 + 4 + 4.
 12 - 1 * 12   12
 示例 2:
 输入: n = 13
   输出: 2
   解释: 13 = 4 + 9.
 
 看能不能拆分小问题呢？如何推到公式呢？
 示例给的很好
 如果没有给出 12 4 4 4
 很容易写出 12 9 1 1 1
 
 f(i) = min[f(i-j*j) + 1]
 也就是 f(i) 需要 找到前面最小次数的组合，即：
 
 dp[i] = min(dp[i], d[i-j*j]+1)
 
 这道题如果自定向下思考会有很麻烦，因为你不确定离 n 最近的 j*j 的j 是几
 如果自底向上，逐一把每个 j 情况记录下来的出即可
 */
class PerfectSquares {
  func numSquares(_ n: Int) -> Int {
    var dp = [Int](repeating: Int.max, count: n+1)
    dp[0] = 0
    
    for i in 1...n {
      for j in 1...i {
        let s = j * j
        if s > i { break }
        dp[i] = min(dp[i-1] + 1, dp[i-s] + 1)
      }
    }
    
    return dp.last!
  }
}

extension PerfectSquares: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
      print(numSquares(12))
    }
    //    performLogCostTime(self.name+" method1") {
    //      print(uniquePaths1(22, 25))
    //    }
    //    performLogCostTime(self.name+" method2") {
    //      print(uniquePaths2(22, 25))
    //    }
    //    performLogCostTime(self.name+" method3") {
    //      print(uniquePaths3(22, 25))
    //    }
    //    performLogCostTime(self.name+" method4") {
    //      print(uniquePaths4(22, 25))
    //    }
  }
}
