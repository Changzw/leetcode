//
//  Int+extension.swift
//  leetCode
//
//  Created by czw on 8/4/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

precedencegroup PowerPrecedence {
  lowerThan: MultiplicationPrecedence
  associativity: left
}

infix operator ** : PowerPrecedence
extension Int {
  static func ** (v: Int, power: Int) -> Int {
    var res = v
    var n = power
    if n % 2 == 0 {// event
      while n != 1 {
        res *= res
        n >>= 1
      }
    }else {
      n -= 1
      while n != 1 {
        res *= res
        n >>= 1
      }
      res += v
    }
    return res
  }
}
