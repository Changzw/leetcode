//
//  4Sum.swift
//  leetCode
//
//  Created by czw on 12/3/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation
/*
 Given an array nums of n integers and an integer target,
 are there elements a, b, c, and d in nums such that a + b + c + d = target?
 Find all unique quadruplets in the array which gives the sum of target.
 Note:
 The solution set must not contain duplicate quadruplets.
 
 Example:
 Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
 A solution set is:
 [
  [-1,  0, 0, 1],
  [-2, -1, 1, 2],
  [-2,  0, 0, 2]
 ]
 */
class _4Sum {
  /*
   因为unique quadruplets，所以先排序遍历
   a+b+c+d = target
   b+c+d=target-a = complementary
   so 确定 a 遍历 a
   比较 b+c+d - complementary
   c+d=target-a-b=complementary-b = complementary2
   so 确定 b 遍历 b
   比较 c+d - complementary2
   
   可是这样
   a = 0
   b = a + 1, 那么a会再走一遍b，会有重复解
   */
  
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 3 else { return [] }
    
    let data = nums.sorted()
    var res: [[Int]] = []
    
    var i = 0
    
    while i<data.count - 3 {
      let iv = data[i]
      var j = i + 1
      
      while j<data.count - 2 {
        let jv = data[j]
        var l = j + 1
        var r = data.count - 1
        
        while l < r {
          let lv = data[l]
          let rv = data[r]
          let sum = iv + jv + lv + rv
          if sum < target {
//            while l<r && data[l] == lv {
              l = l + 1
//            }
          }else if sum > target {
//            while l<r && data[r] == rv {
              r = r - 1
//            }
          }else {
            res.append([iv,jv,lv,rv])
            break
          }
        }
        
        while j<data.count-2 && data[j] == jv{
          j=j+1
        }
      }
      
      while i<data.count-3 && data[i] == iv {
        i = i+1
      }
    }
    
    return res
  }
}

extension _4Sum:Algorithm {
  var name: String {
    return "4Sum"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      print(self.fourSum([0,0,0,0], 0))
    }
    
  }
}
