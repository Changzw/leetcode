//
//  1.1 Triangle.swift
//  leetCode
//
//  Created by czw on 7/31/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/triangle/
 难度： 中等
 
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
 相邻的结点：在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。
 i or i+1
 例如，给定三角形：
 [
   [2],
   [3,4],
   [6,5,7],
   [4,1,8,3]
 ]
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 分析：（错误分析）
 有点像二叉树，只是这个树不是有序的，暴力解法，把所有的结果都算出来得出最大的
 
 在深入分析
  将问题拆开
  拆分图形 将原来的 三角形 拆开
 [
   [2],
   
// x1   x2
   [3,  4],
   [6,5,  7],
   [4,1,8,  3]
 ]
 比较 x1 和 x2 的大小，然后继续拆得出最小值
 
 x2 = triangle.reduce(0, { $0 + $1.last! })
 x1 = min(x2, minimumTotal(triangle-1))
 
 这么想少路径 pass 3-5-1 是走不到的
 
 再分析：
 方程式做
 f(i,j) = (i,j) + min(f(i+1,j), f(i+1,j+1))
 
 找出临界区
 
 i = 0 && j = 0 return (i+j)
 */
class Triangle {
  private func cutTriangle(_ triangle: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    for row in triangle[1...] {
      res.append(Array(row[0..<row.count - 1]))
    }
    print("\(triangle.first!.first!)-\(res)")
    return res
  }
  
  func minimumTotal(_ triangle: [[Int]]) -> Int {
    
    if triangle.count == 1 && triangle[0].count == 1 {
      return triangle[0][0]
    }
    
    let x2 = triangle.reduce(0, { $0 + $1.last! })
    let x1 = min(x2, triangle[0][0] + minimumTotal(cutTriangle(triangle)))
    
    return x1
  }
  
  
  // 递归 数据多了受不了
  func f_(_ i: Int, _ j: Int, _ triangle: [[Int]]) -> Int {
    if i == triangle.count || j == triangle[i].count {
      return 0
    }
    
    return triangle[i][j] + min(f_(i+1, j, triangle), f_(i+1, j+1, triangle))
  }
  
  func minimumTotal_(_ triangle: [[Int]]) -> Int {
    return f_(0, 0, triangle)
  }
  
  // cache
  func f__(_ i: Int, _ j: Int, _ triangle: [[Int]], _ cache: inout [[Int?]]) -> Int {
    if i == triangle.count || j == triangle[i].count {
      return 0
    }
    
    if cache[i][j] == nil {
      cache[i][j] = triangle[i][j] + min(f__(i+1, j, triangle, &cache), f__(i+1, j+1, triangle, &cache))
    }
    return cache[i][j]!
  }
  
  func minimumTotal__(_ triangle: [[Int]]) -> Int {
    var cache:[[Int?]] = triangle.map{ $0.map{ _ in nil } }
    return f__(0, 0, triangle, &cache)
  }
  
// dp   f(i,j) = (i,j) + min(f(i+1,j), f(i+1,j+1))
//  dp[i][j] = source[i][j] + min(dp[i+1,j], dp[i+1,j+1])
//  因为得到 i 需要先得到 i+1, 所以动态规划从后面向前推进
  func minimumTotal___(_ triangle: [[Int]]) -> Int {
    if triangle.count == 1 { return triangle[0][0] }
    
    var dp = triangle
    let n = triangle.count
    for i in (0..<triangle.count-1).reversed() {
      stride(from: 0, to: triangle[i].count, by: 1)
        .forEach { (j) in
          dp[i][j] = triangle[i][j] + min(dp[i+1][j], dp[i+1][j+1])
      }
    }
    
    return dp[0][0]
  }
  
  func minimumTotal____(_ triangle: [[Int]]) -> Int {
    let n = triangle.count
    var dp = [Int].init(repeating: 0, count: n + 1)
    
    stride(from: n-1, through: 0, by: -1)
      .forEach { (i) in
        stride(from: 0, through: i, by: 1)
          .forEach { (j) in
            dp[j] = min(dp[j], dp[j+1]) + triangle[i][j]
        }
    }
    return dp[0]
  }
}

extension Triangle: Algorithm {
  func doTest() {
    let t =  [[2],
              [3,4],
              [6,5,7],
              [4,1,8,3]]
    performLogCostTime(self.name + "method1") {
      print(minimumTotal_(t))
    }
    performLogCostTime(self.name + "method2") {
      print(minimumTotal__(t))
    }
    performLogCostTime(self.name + "method3") {
      print(minimumTotal___(t))
    }
    performLogCostTime(self.name + "method4") {
      print(minimumTotal____(t))
    }
  }
}
