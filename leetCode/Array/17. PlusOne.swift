//
//  17. PlusOne.swift
//  leetCode
//
//  Created by czw on 7/19/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 
 示例 1:
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 示例 2:
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 */

class PlusOne {
  func plusOne(_ digits: [Int]) -> [Int] {
    
//    func carry(_ digits: [Int], c: Int) {
//      var position = digits.count - 1
//      var carry = c
//      while position >= 0 {
//
//      }
//    }
    
    var res = digits
    var position = digits.count - 1
    var carry = 1
    
    while position >= 0 {
      res[position] += carry
      
      if res[position] == 10 {
        carry = 1
        res[position] = 0
      }else {
        carry = 0
      }
      position -= 1
    }
    
    if carry == 1 {
      return [1] + res
    }
    
    return res
  }
}

extension PlusOne: Algorithm {
  func doTest() {
    performLogCostTime(self.name + "method1") {
      
    }
  }
}
