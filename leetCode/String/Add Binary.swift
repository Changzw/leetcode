//
//  Add Binary.swift
//  leetCode
//
//  Created by czw on 12/4/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation
//https://leetcode.com/problems/add-binary/

class AddBinary {
  /*
   Given two binary strings, return their sum (also a binary string).
   The input strings are both non-empty and contains only characters 1 or 0.
   Example 1:
   Input: a = "11", b = "1"
   Output: "100"
   
   Example 2:
   Input: a = "1010", b = "1011"
   Output: "10101"
   */
  
  /*
   1. a,b 同时从后 向前遍历
   2. a[i] + b[i] 存入当前结果 res，是否进位 carry
   3. a || b 有一个遍历完
   4. 是否有 carry
   5. 将未遍历完的 a || b 余下部分直接拼接给 res
   */
  func addBinary(_ a: String, _ b: String) -> String {
    let a = Array(a)//a.compactMap{ Int(String($0)) }
    let b = Array(b)//.compactMap{ Int(String($0)) }
    
    var carry: Int = 0
    var ai = a.count - 1, bi = b.count - 1
    var res = ""
    while ai >= 0 || bi >= 0 {
      var sum = carry
      if ai >= 0 {
        sum = sum + Int(String(a[ai]))!
        ai = ai - 1
      }
      if bi >= 0 {
        sum = sum + Int(String(b[bi]))!
        bi = bi - 1
      }
      
      carry = sum >> 1
      res = "\(sum & 1)" + res
    }

    if carry > 0 {
      res = "\(carry)" + res
    }
    
    return res
  }
  
  func addBinary2(_ a: String, _ b: String) -> String {
    let a = Array(a)
    let b = Array(b)
    
    var carry: Int = 0
    var ai = a.count - 1, bi = b.count - 1
    var res = ""
    while ai >= 0 || bi >= 0{
      var sum = carry
      if ai >= 0 {
        sum = sum + Int(String(a[ai]))!
        ai = ai - 1
      }
      if bi >= 0 {
        sum = sum + Int(String(b[bi]))!
        bi = bi - 1
      }
      
      carry = sum / 2
      res = String(sum % 1) + res
    }
    
    if carry > 0 {
      res = String(carry) + res
    }
    
    return res
  }
  
}

extension AddBinary: Algorithm {
  var name: String{
    return "Add Binary"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      print(self.addBinary("11", "1"))
    }
  }
}
