//
//  2. SqrtX.swift
//  leetCode
//
//  Created by czw on 7/26/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 难度：简单
 https://leetcode-cn.com/problems/sqrtx/
 实现 int sqrt(int x) 函数。
 计算并返回 x 的平方根，其中 x 是非负整数。
 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
 
 示例 1:
 输入: 4
 输出: 2
 
 示例 2:
 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842..., 由于返回类型是整数，小数部分将被舍去。
 */
class SqrtX {
  func mySqrt(_ x: Int) -> Int {
    
    return 0
  }
}

extension SqrtX: Algorithm {
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(self.mySqrt(6))
    }
  }
}
