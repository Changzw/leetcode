//
//  19. GrayCode.swift
//  leetCode
//
//  Created by czw on 7/20/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 格雷编码是一个二进制数字系统，在该系统中，两个连续的数值仅有一个位数的差异。
 给定一个代表编码总位数的非负整数 n，打印其格雷编码序列。即使有多个不同答案，你也只需要返回其中一种。
 格雷编码序列必须以 0 开头。
 
 示例 1:
 输入: 2
 输出: [0,1,3,2]
 解释:(在左侧添加 0 or 1)
 00 - 0
 01 - 1
 11 - 3
 10 - 2
 
 对于给定的 n，其格雷编码序列并不唯一。
 例如，[0,2,3,1] 也是一个有效的格雷编码序列。
  解释:(在右侧添加 0 or 1)
 00 - 0
 10 - 2
 11 - 3
 01 - 1
 
 示例 2:
 输入: 0
 输出: [0]
 解释: 我们定义格雷编码序列必须以 0 开头。
      给定编码总位数为 n 的格雷编码序列，其长度为 2^n。当 n = 0 时，长度为 2^0 = 1。
      因此，当 n = 0 时，其格雷编码序列为 [0]。
 
 分析：
 镜像算格雷编码
 n=1  n=2 ……
 0  | 00
 1  | 01
    | 11
    | 10
 
 如果不用镜像，格雷编码根据 n 长度是成指数增加的，就是 翻倍
 n=1 -> n=2, 下一个是根据上一个编码得到的
 
  n=2, 上半部是直接把 n=1 拿到(二进制首位添加个 0)
  下半部是把 n=1 的数组拿到(二进制首位添加个 1), + 1<<(n-1)
 */
class GrayCode {
  func grayCode(_ n: Int) -> [Int] {
    if n == 0 { return [n] }
    if n == 1 { return [0,1] }
    
    let prev = grayCode(n-1)
    let suff = prev.reversed().map{ $0 + 1<<(n-1) }
    
    return prev + suff
  }
  
  func grayCode_(_ n: Int) -> [Int] {
    if n == 0 { return [n] }
    if n == 1 { return [0,1] }
    
    var graycode = [0,1]
    var i = 2
    while i<=n {
      let prev = graycode
      let suff = prev.reversed().map{ $0 + 1<<(i-1) }
      graycode = prev + suff
      i += 1
    }
    
    return graycode
  }
}

extension GrayCode: Algorithm {
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(grayCode(3))
    }
    performLogCostTime(self.name + "method2") {
      print(grayCode_(3))
    }
  }
}
