//
//  3SumClosest.swift
//  leetCode
//
//  Created by czw on 12/2/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/3sum-closest/

/*
 Given an array nums of n integers and an integer target,
 find three integers in nums such that the sum is closest to target.
 Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 Example:
 Given array nums = [-1, 2, 1, -4], and target = 1.
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

class _3SumClosest {
  /*
   thinking:
   3Sum 找出多个解，解不会出现triplets
   这个问题是求 abs(sum - target) 的最小解
   
   1. 暴力
   * 记录currentMin
   * 循环遍历 O(n³)次
   */
  
  func threeSumClosest1(_ nums: [Int], _ target: Int) -> Int {
    var currentMin = Int.max
    var res = 0
    for (i1, v1) in nums.enumerated() {
      for (i2, v2) in nums.enumerated().dropFirst(i1+1) {
        for (_, v3) in nums.enumerated().dropFirst(i2+1) {
          let sum = (v1+v2+v3)
          if abs(sum-target) < currentMin {
            currentMin = abs(sum - target)
            res = sum
          }
        }
      }
    }
    return res
  }
  
  /*
   先排序再找
   or 用一个有序窗口保存 3个数呢？
   这种直愣愣的替换元素的方法在 会 丢弃有效值的 fail
   eg ([1,2,4,8,16,32,64,128] ,82)
   */
  func threeSumClosest2(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 3 { return 0 }
    
    var window: [Int] = [nums[0], nums[1], nums[2]]
    var currentWindow = window
    var currentSum = window.reduce(0, +)
    var currentMin = abs(currentSum-target)
    
    for v in nums.dropFirst(3) {
      let sum1 = [v, window[0], window[1]].reduce(0, +)
      
      if abs(sum1-target) < currentMin {
        currentSum = sum1
        currentWindow = [v, window[0], window[1]]
        currentMin = abs(sum1 - target)
      }
      
      let sum2 = [v, window[0], window[2]].reduce(0, +)
      if abs(sum2-target) < currentMin {
        currentSum = sum2
        currentWindow = [v, window[0], window[2]]
        currentMin = abs(sum2 - target)
      }
      
      let sum3 = [v, window[1], window[2]].reduce(0, +)
      if abs(sum3-target) < currentMin {
        currentSum = sum3
        currentWindow = [v, window[1], window[2]]
        currentMin = abs(sum3 - target)
      }
      window = currentWindow
    }
    
    return currentSum
  }
  
  func threeSumClosest3(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 3 { return 0 }
    
    var window: [Int] = [nums[0], nums[1], nums[2]]
    
    var currentWindow = window
    var currentSum = window.reduce(0, +)
    var currentMin = abs(currentSum-target)
    
    for v in nums.dropFirst(3) {
      let sum1 = [v, window[0], window[1]].reduce(0, +)
      
      if abs(sum1-target) < currentMin {
        currentSum = sum1
        currentWindow = [v, window[0], window[1]]
        currentMin = abs(sum1 - target)
      }
      
      let sum2 = [v, window[0], window[2]].reduce(0, +)
      if abs(sum2-target) < currentMin {
        currentSum = sum2
        currentWindow = [v, window[0], window[2]]
        currentMin = abs(sum2 - target)
      }
      
      let sum3 = [v, window[1], window[2]].reduce(0, +)
      if abs(sum3-target) < currentMin {
        currentSum = sum3
        currentWindow = [v, window[1], window[2]]
        currentMin = abs(sum3 - target)
      }
      window = currentWindow
    }
    
    return currentSum
  }
  
//  3 Sum 变种
  /*
   找3个数，他们的和结果，与target 最接近
   twoSum: a+b = target
   so a = target - b = complementary
   so 遍历 b 接着去找 a, 使用一个map把遍历过的a 存起来
   这样遍历一遍就可以得到 (a,b)
   
   3Sum: a+b+c = target
   b + c = target - a = complementary
   so 遍历 a，然后去找 b,c
   如果不 sort 那么很难确定 b,c
   sorted 以后 b,c 可以对向遍历 在一次 循环中就可以实现
   
   0|1|2|3|4|.........|n-1|
   a →
     b →
                      ← c
   
  */
  
  func threeSumClosest4(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 3 { return 0 }
    let data = nums.sorted()
    
    var i = 0
    var res = data[0...2].reduce(0, +)
    
    while i < data.count - 2 {
      var l = i + 1
      var r = data.count - 1
      
      while l < r {
        let sum = data[i] + data[l] + data[r]
        if (abs(target - res) > abs(target - sum)) {
          res = sum
          if res == target {
            return res
          }
        }
        sum > target ? (r = r - 1) : (l = l + 1)
      }
      
      while i+1<data.count-2 && data[i] == data[i+1] {
        i = i + 1
      }
      i = i + 1
    }
    
    return res
  }
}

extension _3SumClosest: Algorithm {
  var name: String {
    return "3SumClosest"
  }
  
  func doTest() {
//    performLogCostTime(self.name + "threeSumClosest1") {
//      print(self.threeSumClosest4([-1,2,1,-4], 1))
//    }
    
    performLogCostTime(self.name + "threeSumClosest4") {
      print(self.threeSumClosest4([-1,0,1,1,55] ,3))
    }
  }
}
