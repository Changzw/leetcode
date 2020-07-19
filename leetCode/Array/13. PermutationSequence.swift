//
//  PermutationSequence.swift
//  leetCode
//
//  Created by czw on 7/19/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给出集合 [1,2,3,…,n]，其所有元素共有 n! 种排列。
 按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 给定 n 和 k，返回第 k 个排列。
 
 说明：
 给定 n 的范围是 [1, 9]。
 给定 k 的范围是[1,  n!]。
 
 示例 1:
 输入: n = 3, k = 3
 输出: "213"
 
 示例 2:
 输入: n = 4, k = 9
 1234
 1243
 1324
 1342
 1423
 1432
 2134
 2143
 2314
 输出: "2314"
 
 分析：
 1. 暴力：使用 next Permutation 调用 n 次得出结果
 
 2.1 数组是有序的
 2.2 找出最小的 a! >= k
 2.3 然后在 a 内找到第 k 个
 2.4
 1! -> 1
 2! -> 2
 3! -> 6
 4! -> 24
 */


class PermutationSequence {
  private func factorial(_ n: Int) -> Int {
    var res = 1
    var num = n
    while (num > 0) {
      res *= num
      num -= 1
    }
    return res
  }
  
  func getPosition(k: inout Int, subPermutationCount: Int) -> Int {
    var position = 0
    var totalPermutation = 0
    while totalPermutation < k {
      totalPermutation += subPermutationCount
      position += 1
    }
    position -= 1
    
    k = k - totalPermutation + subPermutationCount
    
    return position
  }
  
  // 深度查找 dfs 的方式（剪枝）
  func getPermutation(_ n: Int, _ k: Int) -> String {
    var resortPosition = 0
    var permutationCounts: [Int] = []
    
    // 找到需要后几位，排序的位置
    var x = factorial(resortPosition)
    while x < k {
      permutationCounts.append(x)
      resortPosition += 1
      x = factorial(resortPosition)
    }
    
    // 前面不需要排列所有的字符串
    var res = ""
    var num = 1
    while res.count < n - resortPosition {
      res += String(num)
      num += 1
    }
    
    // 需要排列的, 构建数组
    var resortNums: [Int] = []
    while num <= n {
      resortNums.append(num)
      num += 1
    }
    
    var curK = k
    while resortNums.count > 0 {
      let position = getPosition(k: &curK, subPermutationCount: permutationCounts[resortNums.count - 1])
      let elem = resortNums[position]
      res += String(elem)
      resortNums.remove(at: position)
    }
    
    return res
  }
    
}


extension PermutationSequence: Algorithm {
  
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(getPermutation(3, 4))
    }
  }
}
