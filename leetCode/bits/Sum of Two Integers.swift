//
//  Sum of Two Integers.swift
//  leetCode
//
//  Created by czw on 12/4/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation
//https://leetcode.com/problems/sum-of-two-integers/discuss/84278/A-summary%3A-how-to-use-bit-manipulation-to-solve-problems-easily-and-efficiently
class SumOfTwoIntegers {
  func getSum(_ a: Int, _ b: Int) -> Int {
    if a == 0 {return b}
    if b == 0 {return a}
    
    var a = a
    var b = b
    while b != 0 {
      let carry = a & b
      a = a ^ b
      b = carry << 1
    }
    
    return a
  }
}

extension SumOfTwoIntegers : Algorithm {
  var name: String{
    return "Sum of Two Integers"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      
    }
  }
}
