//
//  PartitionEqualSubsetSum .swift
//  leetCode
//
//  Created by czw on 12/25/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation
//https://leetcode.com/problems/partition-equal-subset-sum/
/*
 Given a non-empty array containing only positive integers,
 find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.
 
 Note:
 Each of the array element will not exceed 100.
 The array size will not exceed 200.
 
 Example 1:
 
 Input: [1, 5, 11, 5]
 Output: true
 Explanation: The array can be partitioned as [1, 5, 5] and [11].
 
 Example 2:
 Input: [1, 2, 3, 5]
 Output: false
 Explanation: The array cannot be partitioned into equal sum subsets.
 */

/*
 1. 找到递归关系
 2. 递归（自顶向下）
 3. 递归 + 备忘录（自顶向下）
 4. 迭代 + 备忘录（自底向上）
 5. 迭代 + N 变量（自底向上）
 */
class PartitionEqualSubsetSum {
  func canPartition(_ nums: [Int]) -> Bool {
    
    return true
  }
}

extension PartitionEqualSubsetSum : Algorithm {
  var name: String{
    return "PartitionEqualSubsetSum"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      
    }
  }
}
