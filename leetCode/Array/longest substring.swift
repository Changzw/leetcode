//
//  main.swift
//  longest substring
//
//  Created by czw on 11/20/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 3. Longest Substring Without Repeating Characters
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
   Input: "abcabcbb"
   Output: 3
   Explanation: The answer is "abc", with the length of 3.
   Example 2:
 
 Input: "bbbbb"
   Output: 1
   Explanation: The answer is "b", with the length of 1.
   Example 3:
  
 Input: "pwwkew"
   Output: 3
   Explanation: The answer is "wke", with the length of 3.
   Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

/*
 my thinking
 what are the features
  1. the window is sliding from left to right
  2. the window is incressingly bigger and bigger
 
 so:
 we shuld find the conditions
  * that make window move
  * that make window bigger
 
 
 */

class LongestSubstring {
  func lengthOfLongestSubstring_2020_01_19(_ s: String) -> Int {
    var length = 0
    var items = Array<Character>()
    var left = s.startIndex
    var right = left
    
    while right != s.endIndex {
      if !items.contains(s[right]) {
        // bigger
        items.append(s[right])
      }else {
        // move on
        let index = items.firstIndex(of: s[right])!
        left = s.index(left, offsetBy: index + 1)
        items = Array(s[left...right])// 耗时
      }
      right = s.index(after: right)
      length = max(length, s.distance(from: left, to: right))
    }
    
    return length
  }
  
  func x2020_06_02(_ s: String) -> Int {
    var len = 0
    var left = s.startIndex
    var right = left
    
    var window = ""
    
    while right != s.endIndex {
      let curChar = s[right]
      if window.contains(curChar) {
        let index = window.firstIndex(of: curChar)!
        let distance = window.distance(from: window.startIndex, to: index)
        left = s.index(left, offsetBy: distance + 1)
      }
      right = s.index(after: right)
      window = String(s[left..<right])
      len = max(len, s.distance(from: left, to: right))
    }
    
    return len
  }
  
  func xx2020_06_02(_ s: String) -> Int {
    var kv: [Character: String.Index] = [:]
    var len = 0
    var left = s.startIndex
    var right = left
    
    while right != s.endIndex {
      let ch = s[right]
      if let i = kv[ch] {
        left = s.index(after: i)
      }
      kv[ch] = right
      len = max(len, s.distance(from: left, to: right))
      right = s.index(after: right)
    }
    
    return len
  }
  
  func lengthOfLongestSubstring(_ s: String) -> Int {
    var itemSet: Set<Character> = Set<Character>()
    var i = s.startIndex, j = s.startIndex
    
    var maxLength = 0
    while i != s.endIndex && j != s.endIndex {
      if !itemSet.contains(s[j]) {
        itemSet.insert(s[j])
        j = s.index(after: j)
      }else {
        itemSet.remove(s[i])
        i = s.index(after: i)
      }
      let l = s.distance(from: i, to: j)
      if l > maxLength {
        maxLength = l
      }
    }
    
    return maxLength
  }
  
  func lengthOfLongestSubstring2(_ s: String) -> Int {
    var itemMap: [Character: Int] = [:]
    var left = 0, right = 0
    var len = 0
    
    for e in s {
      if let idx = itemMap[e] {
        left = max(idx + 1, left)
      }
      itemMap[e] = right
      len = max(len, right - left + 1)
      right += 1
    }
    
    return len
  }
  
  func lengthOfLongestSubstring3(_ s: String) -> Int {
    var itemMap: [Character: Int] = [:]
    var left = 0
    var len = 0
    
    for right in 0..<s.count {
      let idx = s.index(s.startIndex, offsetBy: right)
      let ch = s[idx]
      
      if let x = itemMap[ch] {
        left = max(x + 1, left)
      }
      itemMap[ch] = right
      len = max(len, right - left + 1)
    }
    
    return len
  }

}

extension StringProtocol {
  var ascii: [UInt8] { compactMap(\.asciiValue) }
}

class LongestSubstring_ {
  
}

extension LongestSubstring: Algorithm {
  var name: String {
    return "LongestSubstring"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      print(self.lengthOfLongestSubstring3("abcabcbb"))
    }
  }
}
