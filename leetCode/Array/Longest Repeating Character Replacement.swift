//
//  Longest Repeating Character Replacement.swift
//  leetCode
//
//  Created by czw on 1/19/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-repeating-character-replacement/
/*
 Given a string s that consists of only uppercase English letters, you can perform at most k operations on that string.
 In one operation, you can choose any character of the string and change it to any other uppercase English character.
 Find the length of the longest sub-string containing all repeating letters you can get after performing the above operations.
 Note:
 Both the string's length and k will not exceed 104.
 
 Example 1:
   Input:
   s = "ABAB", k = 2
 Output:
   4
 
 Explanation:
   Replace the two 'A's with two 'B's or vice versa.
 
 Example 2:
   Input:
   s = "AABABBA", k = 1
 Output:
   4
 
 Explanation:
   Replace the one 'A' in the middle with 'B' and form "AABBBBA".
   The substring "BBBB" has the longest repeating letters, which is 4.
 */

class LongestRepeatingCharacterReplacement {
  
  func characterReplacement(_ s: String, _ k: Int) -> Int {
    if s.count <= k + 1 { return s.count }
    
    var map: [Character:Int] = [:]
    var left = s.startIndex
    var right = s.startIndex
    var result = 0
    var maxCount = 0
    
    while right != s.endIndex {
      if map[s[right]] == nil {
        map[s[right]] = 1
      }else {
        map[s[right]]! += 1
      }
      
      maxCount = max(maxCount, map[s[right]]!)
      while s.distance(from: left, to: right) + 1 - maxCount > k {
        map[s[left]]! -= 1
        left = s.index(after: left)
      }
      result = max(result, s.distance(from: left, to: right) + 1)
      right = s.index(after: right)
    }
    
    return result
  }
}

extension LongestRepeatingCharacterReplacement: Algorithm {
  
  var name: String{
    return "Longest Repeating Character Replacement"
  }

  func doTest() {
    performLogCostTime(self.name) {
      print(characterReplacement("ABAB", 2))
    }
  }
}
