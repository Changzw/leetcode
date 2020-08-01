//
//  DPComment.swift
//  leetCode
//
//  Created by czw on 8/1/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

func isPalindrome(_ s: String) -> Bool {
  // 使用双向指针，左右一一对比
  var i = s.startIndex
  var j = s.index(before: s.endIndex)
  
  while i < j {
    if s[i] != s[j] { return false }
    i = s.index(after: i)
    j = s.index(before: j)
  }
  return true
}
