//
//  Array+extension.swift
//  leetCode
//
//  Created by czw on 8/1/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

extension Array {
//  We may reduce the number of string concatenation by doubling the source template i.e.
//  for example, “a” * 5 = (“a” * 2) * 2 + “a” * 1. In this example, we do 3 concatenations instead of 5.
  static func * (array: Array, num: Int) -> Array {
    assert(num >= 1, "翻倍只能是 num >= 1")
    var s = array
    var total: Array = []
    var n = num
    while n > 1 {
      if n & 1 == 1 { total += s }
      s += s
      n >>= 1
    }
    total += s
    return total
  }
}
