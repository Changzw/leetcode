//
//  24. Single Number II.swift
//  leetCode
//
//  Created by czw on 7/21/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现了三次。找出那个只出现了一次的元素。
 说明：
 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 
 示例 1:
 输入: [2,2,3,2]
 输出: 3
 
 示例 2:
 输入: [0,1,0,1,0,1,99]
 输出: 99
 
 运算规则
 组合\结果\运算符.....And.......Or.........Xor
 0......0...........0.........0..........0
 1......0...........0.........1..........1
 0......1...........0.........1..........1
 1......1...........1.........1..........0
 简单的说
 And:同为真时为真
 Or:同为假时为假
 Xor:相同为假
 
方法： 使用 map 缓存需要 O(n) 的空间
 
 分析：
 该题使用逻辑运算
 */
class SingleNumber2  {
  func singleNumber(_ nums: [Int]) -> Int {
    var map:[Int: Int] = [:]
    for v in nums {
      if map[v] != nil{
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
    var one = 0, two = 0, three = 0
    
    for v in nums {
      two |= (one & v)
      one ^= v
      three = ~(one & two)
      one &= three
      two &= three
    }
    
    return one;
  }
}

extension SingleNumber2: Algorithm {
  func doTest() {
    performLogCostTime(self.name + " method1") {
      print(singleNumber([4,1,2,1,2]))
    }
    
    performLogCostTime(self.name + " method2") {
      print(singleNumber_([4,1,2,1,2]))
    }
  }
}
