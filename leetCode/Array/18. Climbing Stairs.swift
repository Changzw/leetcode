//
//  18. Climbing Stairs.swift
//  leetCode
//
//  Created by czw on 7/20/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 注意：给定 n 是一个正整数。
 
 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 示例 2：
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 
 自顶向下分析
 f(n) = f(n-1) + f(n-2)
 f(1) = 1
 f(2) = 2
 
 自底向上分析：
  f(n) = f(n-1) + f(n-2)
  third= second + first
 */
class Climbing_Stairs {
  func climbStairs(_ n: Int) -> Int {
    if n == 1 {
      return 1
    }
    if n == 2 {
      return 2
    }
    
    return climbStairs(n-1) + climbStairs(n-2)
  }
  
  func climbStairs_(_ n: Int) -> Int {
    if n < 4 {
      return n
    }

    var second = 3
    var first = 2
    var third: Int!
    var i = 4
    while i <= n {
      third = first + second
      first = second
      second = third
      i += 1
    }
    
    return third
  }
  
  func climbStairs__(_ n: Int) -> Int {
    if n < 3 {
      return n
    }

    var path = [1,2]
    while path.count < n {
      let r = path.count - 1
      path.append(path[r] + path[r-1])
    }
    return path.last!
  }
}

extension Climbing_Stairs: Algorithm {
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(climbStairs(6))
    }
    performLogCostTime(self.name + "method2") {
      print(climbStairs_(6))
    }
    performLogCostTime(self.name + "method3") {
      print(climbStairs__(6))
    }

  }
}
