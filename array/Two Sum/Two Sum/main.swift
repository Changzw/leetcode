//
//  main.swift
//  Two Sum
//
//  Created by czw on 11/17/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation


func performLogCostTime(_ name: String, _ exec: () -> ()) {
  let startTime = CFAbsoluteTimeGetCurrent()
  //要执行的代码
  exec()
  let endTime = CFAbsoluteTimeGetCurrent()
  
  debugPrint("代码执行时长：\((endTime - startTime)*1000)毫秒")
}

class Solution {
//  O(n)
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
}

performLogCostTime("method1") {
  let s = Solution()
  print(s.twoSum1([3,2,4], 6))
}

performLogCostTime("method2") {
  let s = Solution()
  print(s.twoSum2([3,2,4], 6))
}

performLogCostTime("method3") {
  let s = Solution()
  print(s.twoSum3([3,2,4], 6))
}

