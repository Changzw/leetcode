//
//  main.swift
//  Longest Palindromic
//
//  Created by czw on 11/22/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/longest-palindromic-substring/
 难度：中等
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 
 示例 1：
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。

 示例 2：
 输入: "cbbd"
 输出: "bb"
 
 分析：
 遍历每个元素，f(i) 以i为中心扩散
 最后 max{f(i)}
 */

class LongestPalindromic {
  // 暴力解法, 复杂度 O(n3)
  func longestPalindrome1(_ s: String) -> String {
    if s.count < 2 { return s }
    var maxLen = 0
    var res: String!
    
    stride(from: 0, to: s.count - 1, by: 1)
      .forEach { (i) in
        stride(from: i+1, to: s.count, by: 1)
          .forEach { (j) in
            let ii = s.index(s.startIndex, offsetBy: i)
            let ji = s.index(s.startIndex, offsetBy: j)
            let subString = String(s[ii...ji])
            if j-i+1>maxLen && isPalindrome(subString) {
              maxLen = j-i+1
              res = subString
            }
        }
    }
    return res
  }
  
  // 中心扩散
  func longestPalindrome2(_ s: String) -> String {
    let end = s.endIndex
    var middle = s.index(after: s.startIndex)
    
    var window: (String.Index, String.Index) = (s.startIndex, s.startIndex)
    var maxLength = 0
    while middle != end {
      // left
      if s[middle] == s[s.index(before: middle)] {
        if let (x, y) = expandString(before: s.index(before: middle), after: middle, s: s) {
          if s.distance(from: x, to: y) > maxLength {
            window = (x, y)
            maxLength = s.distance(from: x, to: y)
          }
        }
      }
      
      if s[middle] == s[s.index(after: middle)] {
        if let (x, y) = expandString(before: middle, after: s.index(after: middle), s: s) {
          if s.distance(from: x, to: y) > maxLength {
            window = (x, y)
            maxLength = s.distance(from: x, to: y)
          }
        }
      }
      
      if s[s.index(after: middle)] == s[s.index(before: middle)] {
        if let (x, y) = expandString(before: s.index(before: middle), after: s.index(after: middle), s: s) {
          if s.distance(from: x, to: y) > maxLength {
            window = (x, y)
            maxLength = s.distance(from: x, to: y)
          }
        }
      }
      
      middle = s.index(after: middle)
    }
    
    return String(s[window.0..<window.1])
  }
  
  func longestPalindrome2_(_ s: String) -> String {
    
    typealias Window = (String.Index, String.Index)
    
    func center(_ i: String.Index, j: String.Index, _ s: String) -> Window {
      var left = i
      var right = j
      
      while left >= s.startIndex && right < s.endIndex {
        if s[left] == s[right] {
          left = s.index(before: left)
          right = s.index(after: right)
        }
      }
      
      return (left, right)
    }
    
    guard s.count >= 2 else { return String(s[s.startIndex]) }
    
    var maxLen = 0
    var range: ClosedRange<String.Index>?
    
    stride(from: 0, to: s.count, by: 1)
      .forEach { (i) in
        let left = s.index(s.startIndex, offsetBy: i)
        let right = s.index(s.startIndex, offsetBy: i + 1)
        let odd = center(left, j: left, s)
        let event = center(left, j: right, s)
        
        let distanceOdd = s.distance(from: odd.1, to: odd.0)
        let distanceEvent = s.distance(from: event.1, to: event.0)
        
        if distanceOdd > maxLen {
          maxLen = distanceOdd
          range = odd.0...odd.1
        }
        
        if distanceEvent > maxLen {
          maxLen = distanceOdd
          range = event.0...event.1
        }
    }
    
    if let range = range {
      return String(s[range])
    }
    return String(s[s.startIndex])
  }
  
  private func expandString(before: String.Index, after: String.Index, s: String) -> (String.Index, String.Index)? {
    if after == s.endIndex {
      return (s.index(after: before), s.index(before: after))
    }
    
    if before == s.startIndex && s[before] != s[after] {
      return (s.index(after: before), s.index(before: after))
    }

    if s[before] == s[after] {
      return expandString(before: s.index(before: before), after: s.index(after: after), s: s)
    }
    
    return (s.index(after: before), s.index(before: after))
  }
  
  // 动态规划
  func longestPalindrome3(_ s: String) -> String {
    if s.count < 2 { return s }
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
    stride(from: 0, to: s.count, by: 1) .forEach { dp[$0][$0] = true }
    
    var res: String = String(s[s.startIndex])
    var maxLen = 1
    stride(from: 1, to: s.count, by: 1)
      .forEach { (j) in
        stride(from: 0, to: j, by: 1)
          .forEach { (i) in
            let ii = s.index(s.startIndex, offsetBy: i)
            let ji = s.index(s.startIndex, offsetBy: j)
            if s[ii] != s[ji] {
              dp[i][j] = false
            }else {
              if j - i < 3 {
                dp[i][j] = true
              } else {
                dp[i][j] = dp[i + 1][j - 1]
              }
            }
            if dp[i][j] && j-i+1 > maxLen {
              maxLen = j-i+1
              res = String(s[ii...ji])
            }
        }
    }

    return res
  }
  
  func longestPalindrome4(_ s: String) -> String {
    guard s.count >= 2 else { return s }
    let characters = Array(s)
    var maxLen = 1
    var begin = 0
    var dp = Array(repeating: Array(repeating: false, count: characters.count), count: characters.count )
    
    for j in 0..<s.count {
      for i in 0..<j {
        if characters[j] == characters[i] {
          dp[i][j] = (j-i<3) || dp[i+1][j-1]
        }
        if (dp[i][j] && j - i + 1 > maxLen) {
          maxLen = j - i + 1
          begin = i
        }
      }
    }
    return String(characters[begin..<(begin+maxLen)])
  }
}

extension LongestPalindromic: Algorithm {
  func doTest() {
    performLogCostTime(self.name) {
      print(self.longestPalindrome1("aaaa"))
    }
    
    performLogCostTime(self.name) {
      print(self.longestPalindrome3("aaaa"))
    }

  }
}
