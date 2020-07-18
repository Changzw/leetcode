//
//  main.swift
//  Longest Palindromic
//
//  Created by czw on 11/22/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

class LongestPalindromic {
  /*
   "abc"
   "bcacb"
   "cc"
   */
  
  /*
   thinking
   1. find currentMiddle index
   2. expand list base on currentMiddle
   */
  func longestPalindrome(_ s: String) -> String {
    if s.count <= 1 {
      return ""
    }
    
    let end = s.endIndex
    var middle = s.index(after: s.startIndex)
    
    var window: (String.Index, String.Index) = (s.startIndex, s.startIndex)
    var maxLength = 0
    while middle != end {
      // left
      if s[middle] == s[s.index(before: middle)] {
        if let (x, y) =  expandString(before: s.index(before: middle), after: middle, s: s) {
          if s.distance(from: x, to: y) > maxLength {
            window = (x, y)
            maxLength = s.distance(from: x, to: y)
          }
        }
      }
      
      if s[middle] == s[s.index(after: middle)] {
        if let (x, y) =  expandString(before: middle, after: s.index(after: middle), s: s) {
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
    
    let range = window.0..<window.1
//    let range = s.startIndex..<s.endIndex
    return String(s.substring(with: range))
//    return s[range]
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
  
  private func expandAroundCenter(s: String, left: String.Index, right: String.Index) -> Int {
    var l = left, r = right
    while l > s.startIndex && r < s.endIndex && s[l] == s[r] {
      l = s.index(before: l)
      r = s.index(after: r)
    }
    
    return s.distance(from: l, to: r) - 1
  }
  
  func longestPalindrome2(_ s: String) -> String {
    guard s.count <= 1 else { return "" }
    
    var start = s.startIndex, end = s.startIndex
    var middle = start
    while middle < end {
      let len1 = expandAroundCenter(s: s, left: middle, right: s.index(after: middle))
      let len2 = expandAroundCenter(s: s, left: middle, right: middle)
      
      let len = max(len1, len2)
      if len > s.distance(from: start, to: middle) {
        
      }
    }
    
//    int start = 0, end = 0;
//    for (int i = 0; i < s.length(); i++) {
//        int len1 = expandAroundCenter(s, i, i);
//        int len2 = expandAroundCenter(s, i, i + 1);
//        int len = Math.max(len1, len2);
//        if (len > end - start) {
//            start = i - (len - 1) / 2;
//            end = i + len / 2;
//        }
//    }
//    return s.substring(start, end + 1);
    
    return ""
  }
}

extension LongestPalindromic: Algorithm {
  var name: String {
    return "LongestPalindromic"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      print(self.longestPalindrome("abccabccff"))
    }
  }
}
