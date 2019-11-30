//
//  main.swift
//  longest substring
//
//  Created by czw on 11/20/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

class Solution {
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
      curr = curr + 1
      
      maxLength = max(maxLength, currentLength)
    }
    
    return maxLength
  }
}

let s = Solution()
print(s.lengthOfLongestSubstring2("abba"))
