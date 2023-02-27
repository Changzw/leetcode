//
//  1.7 Decode Ways.swift
//  leetCode
//
//  Created by czw on 8/1/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/decode-ways/
 难度：中等
 一条包含字母 A-Z 的消息通过以下方式进行了编码：
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 给定一个只包含数字的非空字符串，请计算解码方法的总数。
 
 示例 1:
   输入: "12"
   输出: 2
   解释: 它可以解码为 "AB"（1 2）或者 "L"（12）。
 
 示例 2:
   输入: "226"
   输出: 3
   解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
 
 120241
 1 2   24 1
 12    2 4 1
 分析：推递归公式
 f(n) 表示输入 n 个数字，解码的总个数
   如果 s[n-1] > 2 f(n) = f(n-1)
   如果 s[n-1] <=2 f(n) = f(n-1) + 1
   f(1) = 1
 
 因为有 0 的情况，0 是把字符串断开的节点，所以开始把 0 去掉，拆分成字符串数组
 根据 numDecodings_error 这个函数有很多边界条件，出现了这个问题，多半是你开始就错了，推导公式有问题
 
 换：
 如果
 s[n-1] = 1, f(n) = f(n-1) + f(n-2)
 s[n-1] = 2 && s[n] in 1...6 f(n) = f(n-1) + f(n-2)
 否则 f(n) = f(n-1)
 s[n] = 0 && s[n-1] = 1,2 那么 f(n) = f(n-1), 否则返回 0
 */
class DecodeWays {
  
  func numDecodings(_ s: String) -> Int {
    let str = Array(s)
    let len = str.count
    if len < 1 { return 0 }
    if len == 1 { return str[0] == "0" ? 0 : 1 }
    
    var dp = Array(repeating: 0, count: len + 1)
    dp[0] = 1
    dp[1] = str[0] == "0" ? 0 : 1
    for i in 2 ..< len + 1 {
      var last = Int("\(str[i - 1])")!
      if last > 0 {
        dp[i] += dp[i - 1]
      }
      last = Int("\(str[i - 2])\(str[i - 1])")!
      
      if last >= 10 && last <= 26 {
        dp[i] += dp[i - 2]
      }
    }
    return dp[len]
  }
  
  func numDecodings1(_ s: String) -> Int {
    let len = s.count
    if len < 1 { return 0 }
    let start = s.startIndex
    if len == 1 { return s[start] == "0" ? 0 : 1 }
    
    var dp = Array(repeating: 0, count: len + 1)
    dp[0] = 1
    dp[1] = s[start] == "0" ? 0 : 1
    for i in 2 ..< len + 1 {
      var last = Int("\(s[s.index(start, offsetBy: i-1)])")!
      if last > 0 {
        dp[i] += dp[i - 1]
      }
      last = Int("\(s[s.index(start, offsetBy: i-2)])\(s[s.index(start, offsetBy: i-1)])")!
      
      if last >= 10 && last <= 26 {
        dp[i] += dp[i - 2]
      }
    }
    return dp[len]
  }

  // memo
//  func numDecodings1 (_ s: String) -> Int {
//    func decoding(_ s: String, _ i: Int, _ cache: inout Int) -> Int {
//      if i == 0 { return 1 }
//
//      let idx = s.index(s.startIndex, offsetBy: i-1)
//      if let v = Int(s[idx].description), v > 2 {
//        return decoding(s, i-1, &cache)
//      }else{
//        return decoding(s, i-1, &cache) + 1
//      }
//    }
//    var cache = [Int](repeating: 0, count: s.count)
//
//    return decoding(s, s.count - 1, &cache)
//  }
}

extension DecodeWays: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
      print(numDecodings(
        "1235431356413123416542312312341324125612346456422451235431356413123416542312312341324125612346456422451235431356413123416542312312341324125612346456422451235431356413123416542312"))
    }
    performLogCostTime(self.name+" method1") {
      print(numDecodings1(
        "1235431356413123416542312312341324125612346456422451235431356413123416542312312341324125612346456422451235431356413123416542312312341324125612346456422451235431356413123416542312"))
    }
//    performLogCostTime(self.name+" method2") {
//      print(uniquePaths2(22, 25))
//    }
//    performLogCostTime(self.name+" method3") {
//      print(uniquePaths3(22, 25))
//    }
//    performLogCostTime(self.name+" method4") {
//      print(uniquePaths4(22, 25))
//    }
  }
}
