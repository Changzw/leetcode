//
//  Add Strings.swift
//  leetCode
//
//  Created by czw on 12/4/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation
//https://leetcode.com/problems/add-strings/submissions/


//same as https://leetcode.com/problems/add-binary/
/*
 Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.
 
 Note:
 
 The length of both num1 and num2 is < 5100.
 Both num1 and num2 contains only digits 0-9.
 Both num1 and num2 does not contain any leading zero.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */
class AddStrings {
  func addStrings(_ num1: String, _ num2: String) -> String {
    let a = Array(num1)
    let b = Array(num2)
    
    var ai = a.count - 1
    var bi = b.count - 1
    var carry = 0
    
    var res = ""
    while ai >= 0 || bi >= 0 {
      var sum = carry
      if ai >= 0 {
        sum += Int(String(a[ai]))!
        ai -= 1
      }
      if bi >= 0 {
        sum += Int(String(b[bi]))!
        bi -= 1
      }
      
      carry = sum / 10
      res = String(sum % 10) + res
    }
    
    if carry > 0 {
      res = String(carry) + res
    }
    return res
  }
}

extension AddStrings: Algorithm {
  var name: String{
    return "Add Strings"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      
    }
  }
}
