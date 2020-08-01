//
//  1.3 Palindrome Partitioning II.swift
//  leetCode
//
//  Created by czw on 7/31/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode-cn.com/problems/palindrome-partitioning-ii/
 难度：困难
 
 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。
 返回符合要求的最少分割次数。
 
 示例:
 输入: "aa b"
 输出: 1
 解释: 进行一次分割就可将 s 分割成 ["aa","b"] 这样两个回文子串。
 */

class PalindromePartitioningII {
  func minCut(_ s: String) -> Int {
    
    return 0
  }
}

extension PalindromePartitioningII: Algorithm {
  func doTest() {
    performLogCostTime(self.name+"method1") {
      print(isPalindrome("1110210111"))
    }
    performLogCostTime(self.name+"method2") { }
    performLogCostTime(self.name+"method3") { }
  }
}

/*
 https://leetcode-cn.com/problems/palindrome-partitioning/
 难度：中等
 
 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。
 返回 s 所有可能的分割方案。
 
 示例:
 输入: "aab"
 输出:
 [
  ["aa","b"],
  ["a","a","b"]
 ]
 
 分析：
 子回文最大长度 1
 子回文最大长度 2
 子回文最大长度 3
 
 直到 n，没有新的回文产生，生成矩阵
 
 这样会出现很多重复的问题，每次都要重头遍历 s
 
 示例其实提示了，先找到最大的回文，然后每次下层只是查分最大回文
 
 */

class PalindromePartitioning {
  func partition(_ s: String) -> [[String]] {
    var sep = 1
    var res = [[String]]()
    
    var i = s.startIndex
    var end = s.endIndex
    
    
    
    
    return res
  }
}

extension PalindromePartitioning: Algorithm {
  func doTest() {
    performLogCostTime(self.name+"method1") {
      
    }
    performLogCostTime(self.name+"method2") { }
    performLogCostTime(self.name+"method3") { }
  }
}
