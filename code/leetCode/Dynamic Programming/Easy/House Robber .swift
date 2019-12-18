//
//  House Robber .swift
//  leetCode
//
//  Created by czw on 12/18/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/house-robber/
/*
 You are a professional robber planning to rob houses along a street.
 Each house has a certain amount of money stashed,
 the only constraint stopping you from robbing each of them is
 that adjacent houses have security system connected and
 it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given a list of non-negative integers representing the amount of money of each house,
 determine the maximum amount of money you can rob tonight without alerting the police.
 
 Example 1:
 
 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 2:
 
 Input: [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.
 
 This particular problem and most of others can be approached using the following sequence:
  1.Find recursive relation
  2.Recursive (top-down)
  3.Recursive + memo (top-down)
  4.Iterative + memo (bottom-up)
  5.Iterative + N variables (bottom-up)
 */

class HouseRobber{
//  thinking:
  func rob0(_ nums: [Int]) -> Int {
    func rob(_ nums: [Int], _ i: Int) -> Int {
      if i < 0 {
        return 0
      }else {
        return max(rob(nums, i-2) + nums[i], rob(nums, i-1))
      }
    }
    return rob(nums, nums.count - 1)
  }
  
  func rob1(_ nums: [Int]) -> Int {
    var cache: [Int] = Array.init(repeating: 0, count: nums.count)
    
    func rob(_ nums: [Int], _ i: Int, _ cache: inout [Int]) -> Int {
      if i < 0 {
        return 0
      }else {
        if cache[i] != 0 {
          return cache[i]
        }else {
          cache[i] = max(rob(nums, i-2, &cache) + nums[i], rob(nums, i-1, &cache))
          return cache[i]
        }
      }
    }
    
    return rob(nums, nums.count - 1, &cache)
  }
  
  func rob2(_ nums: [Int]) -> Int {
    
    
    
    
    var cache: [Int:Int] = [:]
    
    func rob(_ nums: [Int], _ i: Int, _ cache: inout [Int:Int]) -> Int {
      if i < 0 {
        return 0
      }else {
        if cache[i] != nil {
          return cache[i]!
        }else {
          cache[i] = max(rob(nums, i-2, &cache) + nums[i], rob(nums, i-1, &cache))
          return cache[i]!
        }
      }
    }
    
    return rob(nums, nums.count - 1, &cache)
  }
  
}

extension HouseRobber : Algorithm {
  var name: String {
    return "House Robber"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      print(rob0([1,7,9,3,1,15,5,1]))
    }

    performLogCostTime(self.name) {
      print(rob1([1,7,9,3,1,15,5,1]))
    }
  }
}
