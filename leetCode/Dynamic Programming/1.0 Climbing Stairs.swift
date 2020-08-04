//
//  Climbing Stairs.swift
//  leetCode
//
//  Created by czw on 12/8/19.
//  Copyright © 2019 czw. All rights reserved.
//

//https://leetcode.com/problems/climbing-stairs/
import Foundation

/*
 You are climbing a stair case. It takes n steps to reach to the top.
 Each time you can either climb 1 or 2 steps.
 In how many distinct ways can you climb to the top?
 Note: Given n will be a positive integer.
 
 Example 1:
 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Example 2:
 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

/*
1.brute force
 因为要爬到5，之前的可能是 3 or 4 (5-1,5-2)
 所以根据该题，得出公式：
 f(n) = f(n-1) + f(n-2)
 f(1) = 1
 f(2) = 2
 */

class ClimbingStairs {
  /*
   递归的三大要素:
   第一要素：明确你这个函数想要干什么
   第二要素：寻找递归结束条件
   第三要素：找出函数的等价关系式
   */
  
  func climbStairs__(_ n: Int) -> Int {
    if n <= 2 { return n }
    return climbStairs__(n - 1) + climbStairs__(n - 2)
  }
  
  // memo
  func climbStairs_memo(_ n: Int) -> Int {
    var memo: [Int?] = Array(repeating: nil, count: n)
    
    func climbStairs(_ n: Int, _ memo: inout [Int?]) -> Int {
      if n <= 2 {
        return n
      }
      
      let index = n - 1
      if memo[index] != nil {
        return memo[index]!
      }else {
        memo[index] = climbStairs(n - 1, &memo) + climbStairs(n - 2, &memo)
      }
      
      return memo[index]!
    }
    
    let res = climbStairs(n, &memo)
    return res
  }
  
  func climbStairs(_ n: Int) -> Int {
    func climbStairs_(_ i: Int, _ n: Int) -> Int {
      if i > n {
        return 0
      }else if i == n {
        return 1
      }else {
        return climbStairs_(i+1, n) + climbStairs_(i+2, n)
      }
    }
    
    return climbStairs_(0, n)
  }
  
  func climbStairs1(_ n: Int) -> Int {
    var cache: [Int:Int] = [:]
    func climbStairs_(_ i: Int, _ n: Int, _ cache: inout [Int:Int]) -> Int {
      if i > n {
        return 0
      }else if i == n {
        return 1
      }
      
      if cache[i] != nil {
        return cache[i]!
      }
      
      cache[i] = climbStairs_(i+1, n, &cache) + climbStairs_(i+2, n, &cache)
      return cache[i]!
    }
    
    return climbStairs_(0, n, &cache)
  }
  
  func climbStairs2(_ n: Int) -> Int {
    guard n > 1 else { return n }
    
    var dp: [Int] = [0,1,2]
    var i = 3
    while i <= n {
      dp.append(dp[i-1] + dp[i - 2])
      i += 1
    }
    return dp[n]
  }
  
  func climbStairs3(_ n: Int) -> Int {
    guard n > 1 else { return n }
    
    var first = 1
    var second = 2
    var i = 3
    while i <= n {
      let third = first + second
      first = second
      second = third
      i += 1
    }
    return second
  }

}

extension ClimbingStairs: Algorithm{
  var name: String{
    return "climbing-stairs"
  }
  
  func doTest() {
    performLogCostTime(self.name + "new") {
      print(climbStairs__(5))
    }
    
    performLogCostTime(self.name + "origin:") {
      print(climbStairs(5))
    }
    
    performLogCostTime(self.name + "origin:") {
      print(climbStairs_memo(5))
    }
  }
}
