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
    var start = 0, curr = 0
    
    var maxLength = 0
    var currentLength = 0
    
    for e in s {
      if itemMap[e] != nil {
        start = max(itemMap[e]! + 1, start)
        itemMap[e] = curr
        currentLength = curr - start + 1
      }else {
        currentLength = currentLength + 1
      }
      itemMap[e] = curr
      curr += 1
      
      maxLength = max(maxLength, currentLength)
    }
    
    return maxLength
  }
}

extension LongestSubstring: Algorithm {
  var name: String {
    return "LongestSubstring"
  }
  
  func doTest() {
    //performLogCostTime("method1") {
    //  print(self.threeSum1([-1, 0, 1, 2, -1, -4]))
    //}
    performLogCostTime(self.name) {
      print(self.lengthOfLongestSubstring2("abcabcbbabcabcbb"))
    }
    
    performLogCostTime(self.name + "2020年01月19日10:55:24") {
      print((self.lengthOfLongestSubstring_2020_01_19("abcabcbbabcabcbb")))
    }
  }
}
