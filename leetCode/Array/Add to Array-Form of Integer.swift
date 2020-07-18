//
//  Add to Array-Form of Integer.swift
//  leetCode
//
//  Created by czw on 12/4/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/add-to-array-form-of-integer/
/*
 For a non-negative integer X,
 the array-form of X is an array of its digits in left to right order.
 For example,
 if X = 1231, then the array form is [1,2,3,1].
 
 Given the array-form A of a non-negative integer X, return the array-form of the integer X+K.
 
 Example 1:
 
 Input: A = [1,2,0,0], K = 34
 Output: [1,2,3,4]
 Explanation: 1200 + 34 = 1234
 Example 2:
 
 Input: A = [2,7,4], K = 181
 Output: [4,5,5]
 Explanation: 274 + 181 = 455
 Example 3:
 
 Input: A = [2,1,5], K = 806
 Output: [1,0,2,1]
 Explanation: 215 + 806 = 1021
 Example 4:
 
 Input: A = [9,9,9,9,9,9,9,9,9,9], K = 1
 Output: [1,0,0,0,0,0,0,0,0,0,0]
 Explanation: 9999999999 + 1 = 10000000000
 */

/*
 因为结果是数组 那么把 K -> [] 然后遍历一次把结果存入 [] 中
 */
class AddtoArrayFormofInteger {
  func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
    var b: [Int] = []
    
    var K = K
    while K != 0 {
      b.insert((K % 10), at: b.endIndex)
      K /= 10
    }
    b = b.reversed()
    
    var ai = A.count - 1, bi = b.count - 1
    var carry = 0
    var res: [Int] = []
    
    while ai >= 0 || bi >= 0 {
      var sum = carry
      if ai >= 0 {
        sum += A[ai]
        ai -= 1
      }
      
      if bi >= 0 {
        sum += b[bi]
        bi -= 1
      }
      
      res.insert(sum % 10, at: res.endIndex)
      carry = sum / 10
    }
    
    if carry > 0 {
      res.insert(carry, at: res.endIndex)
    }
    
    return res.reversed()
  }
}

extension AddtoArrayFormofInteger: Algorithm {
  var name: String{
    return "AddtoArrayFormofInteger"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      
    }
  }
}
