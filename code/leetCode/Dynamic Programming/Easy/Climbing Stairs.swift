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
 climbStairs(i,n)=climbStairs(i+1,n)+climbStairs(i+2,n)
 事件复杂度 2的n次方
 控件复杂度 O(n) 树深是 n
 */

class ClimbingStairs {
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
    performLogCostTime(self.name) {
      print(climbStairs3(44))
    }
  }
}
