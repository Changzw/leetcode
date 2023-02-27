//
//  6. LongestConsecutiveSequence.swift
//  leetCode
//
//  Created by czw on 7/18/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/longest-consecutive-sequence/
 给定一个未排序的整数数组，找出最长连续序列的长度。
 要求算法的时间复杂度为 O(n)。
 
 示例:
 输入: [100, 4, 200, 1, 3, 2]
 输出: 4
 解释: 最长连续序列是 [1, 2, 3, 4]。它的长度为 4。
 
 解题思路：
 1. 排序? O(n) 的排序没有
 2. 思考 使用 hash map 处理
 3. 因为连续，所以连续的元素大小 都是相差 1
 
 具体细节；
  1. 遍历数组，elem 放入 dict 中标记 dict[elem] = 1, dict[elem-1] = -1, dict[elem+1] = -1
  2. len 储存当前最大连续的长度
 */

class LongestConsecutiveSequence {
  func longestConsecutive(_ nums: [Int]) -> Int {
    if nums.count < 2 {
      return nums.count
    }
    
    var dict: [Int: Bool] = Dictionary(minimumCapacity: nums.count)
    for e in nums {
      dict[e] = true
    }
    
    var len = 1
    for i in dict.keys {
      var currentLen = 1
      
      if dict[i - 1] != nil {
        continue // 前驱直接跳过，最大连续肯定不会从中间开始的
      }
      
      var r = i + 1
      while dict[r] != nil {
        currentLen += 1
        r += 1
      }
      len = max(len, currentLen)
    }
    return len
  }
  
  func longestConsecutive2(_ nums: [Int]) -> Int {
    if nums.count < 2 {
      return nums.count
    }
    
    let set = Set(nums)
        
    var len = 1
    for i in set {
      var currentLen = 1
      
      if set.contains(i-1) {
        continue // 前驱直接跳过，最大连续肯定不会从中间开始的
      }
      
      var r = i + 1
      while set.contains(r){
        currentLen += 1
        r += 1
      }
      len = max(len, currentLen)
    }
    return len
  }

}


extension LongestConsecutiveSequence: Algorithm {
  var name: String {
    return "LongestConsecutiveSequence"
  }
  
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(longestConsecutive([100, 4, 200, 1, 3, 2]))
    }
  }
}
