//
//  23. Single Number.swift
//  leetCode
//
//  Created by czw on 7/21/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 说明：
 
 你的算法应该具有 线性时间复杂度。 你可以 不使用额外空间来实现吗？
 
 示例 1:
 输入: [2,2,1]
 输出: 1
 示例 2:
 
 输入: [4,1,2,1,2]
 输出: 4
 
 分析：
 使用 map 可以直接得出结果，可是题不允许使用额外空间
 Q: 不使用额外空间如何cache 重复数据呢？
 O(n) 的时间复杂度，也不许使用排序
 
 解法1：技巧，题目说了（除了某个元素只出现一次以外，其余每个元素均出现两次）
 使用异或 ^ 如果int 值相同那么就是 0
 */

class SingleNumber {
  func singleNumber(_ nums: [Int]) -> Int {
    var map:[Int: Int] = [:]
    for v in nums {
      if map[v] != nil {
        map[v]! += 1
      }else {
        map[v] = 1
      }
    }
    
    for (i,v) in map {
      if v == 1 {
        return i
      }
    }
    return 0
  }
  
  func singleNumber_(_ nums: [Int]) -> Int {
    return nums.reduce(0, ^)
  }

}

extension SingleNumber: Algorithm {
  func doTest() {
    performLogCostTime(self.name + " method1") {
      print(singleNumber([4,1,2,1,2]))
    }
    
    performLogCostTime(self.name + " method2") {
      print(singleNumber_([4,1,2,1,2]))
    }
  }
}
