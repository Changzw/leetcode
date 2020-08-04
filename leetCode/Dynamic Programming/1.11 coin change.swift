//
//  1.11 coin change.swift
//  leetCode
//
//  Created by czw on 8/2/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/coin-change/
 难度中等
 给定不同面额的硬币 coins 和一个总金额 amount。
 编写一个函数来计算可以凑成总金额所需的最少的硬币个数。
 如果没有任何一种硬币组合能组成总金额，返回 -1。
 
 示例 1:
   输入: coins = [1, 2, 5], amount = 11
   输出: 3
   解释: 11 = 5 + 5 + 1
 
 示例 2:
   输入: coins = [2], amount = 3
   输出: -1
  
 说明:
 你可以认为每种硬币的数量是无限的。
 
 分析:
 f(n) = min[f(n-a[i])] + 1
 f(0) = 0
 
 dp[i] = min(dp[i], dp[i-a[j]] + 1)
 */
class CoinChange {
  func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if coins.min()! > amount { return -1 }
    
    var dp = [Int](repeating: Int.max - 1, count: amount+1)
    dp[0] = 0
    
    for c in coins {
      for x in c...amount {
        dp[x] = min(dp[x], dp[x-c] + 1)
      }
    }
    return dp.last! != Int.max - 1 ? dp.last! : -1
  }
}

extension CoinChange: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
      print(coinChange([1], 0))
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
