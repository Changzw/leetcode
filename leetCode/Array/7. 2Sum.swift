//
//  main.swift
//  Two Sum
//
//  Created by czw on 11/17/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode.com/problems/two-sum/
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

class TwoSum {
/*
 分析1： 暴力解决 O(n2)
  *遍历两边肯定
  *判断item1 + item2 == target
 */
  func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    for (m, item1) in nums.enumerated() {
      for (n, item2) in nums.enumerated() {
        if n == m {
          continue
        }
        if item1 + item2 == target {
          return [m, n]
        }
      }
    }
    
    return []
  }
  
  /*
   分析2： 优化暴力解决 O(n2)
   *遍历两边肯定
   *将外部遍历过的排除掉
   *判断item1 + item2 == target
   */
  func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    let count = nums.count
    var i = 0, j = 0
    
    while i < count {
      j = i + 1
      while j < count {
        if nums[i] + nums[j] == target {
          return [i, j]
        }
        
        j = j + 1
      }
      
      i = i + 1
    }
    return []
  }
  
  /*
   分析3：使用空间换时间的方式，hash 值处理。优化暴力解决 空间复杂度 O(n)，时间复杂度 O(n)
   *遍历两边肯定
   *将外部遍历过的排除掉
   *判断item1 + item2 == target
   */
  func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    var mapNums = [Int: Int]()
    
    for (i, v) in nums.enumerated() {
      let complement = target - v
      if mapNums[complement] == nil {
        mapNums[v] = i
      }else {
        return [mapNums[complement]!, i]
      }
    }
    
    return []
  }
  
  func twoSum4(_ nums: [Int], _ target: Int) -> [Int] {
    let set = Set(nums)
    
    

    return []
  }

}

extension TwoSum: Algorithm {
  var name: String {
    return "2Sum"
  }
  
  func doTest() {
 
    performLogCostTime(self.name + "method1") {
      print(self.twoSum1([3,2,4], 6))
    }
    
    performLogCostTime(self.name + "method2") {
      print(self.twoSum2([3,2,4], 6))
    }
    
    performLogCostTime(self.name + "method3") {
      print(self.twoSum3([3,2,4], 6))
    }
  }
}


