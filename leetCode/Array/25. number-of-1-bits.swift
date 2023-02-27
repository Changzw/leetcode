//
//  25. number-of-1-bits.swift
//  leetCode
//
//  Created by czw on 7/29/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
十进制数，没有前缀
二进制数，前缀是0b
八进制数，前缀是0o
十六进制数，前缀是0x
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17
*/
class Numberof1bits {
  func hammingWeight(_ n: Int) -> Int {
    var mask = 1
    var res = 0
    stride(from: 0, to: MemoryLayout<Int>.size * 8, by: 1)
      .forEach { _ in
        if mask & n > 0 {
          res += 1
        }
        mask <<= 1
    }
    return res
  }
}

extension Numberof1bits: Algorithm {
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(hammingWeight(0b11111111111111111111111111111101))
    }
  }
}
