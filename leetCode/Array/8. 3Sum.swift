//
//  main.swift
//  3Sum
//
//  Created by czw on 12/1/19.
//  Copyright © 2019 czw. All rights reserved.
//

//https://leetcode.com/problems/3sum/
/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0?
 Find all unique triplets in the array which gives the sum of zero.
 Note:
 The solution set must not contain duplicate triplets.
 
 Example:
 Given array nums = [-1, 0, 1, 2, -1, -4],
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */

import Foundation

class _3Sum {
  
//  暴力
/*
   [-1, 0, 1, 2, -1, -4]
   test result
   [[-1, 0, 1], [-1, 2, -1], [0, 1, -1]]
   "method1 cost time：2.1240711212158203s"
   error:
      contain duplicate triplets
   */
  func threeSum1(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 { return [] }
    
    var res: [[Int]] = []
    let zero = 0
    
    var i2: Int, i3: Int, i1 = 0
    
    while i1 < nums.count {
      i2 = i1 + 1
      
      while i2 < nums.count {
        i3 = i2 + 1
        while i3 < nums.count {
          if zero == (nums[i1] + nums[i2] + nums[i3]) {
            res.append([nums[i1], nums[i2], nums[i3]])
            break
          }
          i3 = i3 + 1
        }
        i2 = i2 + 1
      }
      
      i1 = i1 + 1
    }
    
    return res
  }
  
  /*
   resolve the question that contain duplicate triplets
   
   Input
   [0,4,0,-2,3,1,-5,0]
   Output
   [[-4,1,3],[-4,4,0],[-2,1,1],[-2,4,-2],[1,-5,4]]
   Expected
   [[-5,1,4],[-4,0,4],[-4,1,3],[-2,-2,4],[-2,1,1],[0,0,0]]
   
   如何判断两个数组 包含的元素完全相同
   
   */
  func threeSum2(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 { return [] }
    
    var res: [[Int]] = []
    let zero = 0
    
    var i2: Int, i3: Int, i1 = 0
    
    while i1 < nums.count {
      i2 = i1 + 1
      
      while i2 < nums.count {
        i3 = i2 + 1
        while i3 < nums.count {
          if zero == (nums[i1] + nums[i2] + nums[i3]) {
            
            var curr = 0
            var skip = false
            while curr < res.count {
              let previousRes = res[curr]
              if previousRes.contains(nums[i1])
                && previousRes.contains(nums[i2])
                && previousRes.contains(nums[i3])
                && nums[i1] != nums[i2] {
                skip = true
                break
              }
              
              curr = curr + 1
            }
            
            if skip {
              i3 = i3 + 1
              continue
            }else {
              res.append([nums[i1], nums[i2], nums[i3]])
              break
            }
          }
          i3 = i3 + 1
        }
        i2 = i2 + 1
      }
      
      i1 = i1 + 1
    }
    
    return res
  }
  
//  nums.sorted
  func threeSum3(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 { return [] }
    
    let _nums = nums.sorted()
    var res: [[Int]] = []
    
    var i1 = 0
    while i1 < nums.count - 2 {
      var i2 = i1 + 1
      var i3 = _nums.count - 1
      let target = 0 - _nums[i1]
      
      while i2 < i3 {
        let sum = _nums[i2] + _nums[i3]
        if target < sum {
          i3 = i3 - 1
        }else if target > sum {
          i2 = i2 + 1
        }else {
// 最开始的想法是，想把符合结果的arr 放到res 里面，然后怎么处理再次重复的
// 看了答案以后知道，可以先放进去，以后避免发生再次重复的现象
          res.append([_nums[i1], _nums[i2], _nums[i3]])
          while i2 < i3 && _nums[i2] == _nums[i2+1] { i2 = i2 + 1 }
          while i2 < i3 && _nums[i3] == _nums[i3-1] { i3 = i3 - 1 }
// 让指针走下去
          i2 = i2 + 1
          i3 = i3 - 1
        }
      }
      while i1 + 1 < _nums.count && _nums[i1] == _nums[i1+1] {
        i1 = i1 + 1
      }
//让指针走下去
      i1 = i1 + 1
    }
    return res
  }
}

extension _3Sum: Algorithm{
  var name: String {
    return "3Sum"
  }
  
  func doTest() {
    //performLogCostTime("method1") {
    //  print(self.threeSum1([-1, 0, 1, 2, -1, -4]))
    //}
    performLogCostTime(self.name) {
      print(self.threeSum3([-1,0,1,2,-1,-4]))
    }
    
    //performLogCostTime("method2") {
    //  print(self.twoSum2([3,2,4], 6))
    //}
    //
    //performLogCostTime("method3") {
    //  print(self.twoSum3([3,2,4], 6))
    //}
  }
}
