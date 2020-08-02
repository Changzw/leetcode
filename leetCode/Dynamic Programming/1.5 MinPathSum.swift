//
//  1.5 MinPathSum.swift
//  leetCode
//
//  Created by czw on 8/1/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode-cn.com/problems/minimum-path-sum/
 难度： 中等
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 说明：每次只能向下或者向右移动一步。
 
 示例:
 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。
 
 分析：
 因为 1.4 会算出所有路径，并将结果缓存在 dp[i][j] 中
 这个问题使用相同方式，只是有个 minPath 存最小的结果
 
 根据走的规则，推导出公式，一样先自定向下
 f(m,n) = min(f(m-1,n), f(m,n-1)) + s[m][n]
 f(0,0) = s[0][0]
 f(m,1) = f(m-1,1) + s[m][1]
 f(1,n) = f(1,n-1) + s[1][n]
 */

class MinPathSum {
  // 超时
  func minPathSum(_ grid: [[Int]]) -> Int {
    func pathSum(_ m: Int, _ n: Int, grid:[[Int]]) -> Int {
      if m == 0 && n == 0 { return grid[0][0] }
      if m == 0 { return grid[m][n] + pathSum(m, n-1, grid: grid) }
      if n == 0 { return grid[m][n] + pathSum(m-1, n, grid: grid) }
      return grid[m][n] + min(pathSum(m-1, n, grid: grid), pathSum(m, n-1, grid: grid))
    }
    
    let m = grid.count - 1
    let n = grid.first!.count - 1
    return pathSum(m, n, grid: grid)
  }
  // 加 memo
  func minPathSum1(_ grid: [[Int]]) -> Int {
    func pathSum(_ m: Int, _ n: Int, grid:[[Int]], _ cache: inout [[Int?]]) -> Int {
      if m == 0 && n == 0 { return grid[0][0] }
      if cache[m][n] != nil { return cache[m][n]! }
      
      if m == 0 {
        cache[m][n] = grid[m][n] + pathSum(m, n-1, grid: grid, &cache)
      }else if n == 0 {
        cache[m][n] = grid[m][n] + pathSum(m-1, n, grid: grid, &cache)
      }else {
        cache[m][n] = grid[m][n] + min(pathSum(m-1, n, grid: grid, &cache), pathSum(m, n-1, grid: grid, &cache))
      }
      return cache[m][n]!
    }
    
    let m = grid.count
    let n = grid.first!.count
    var cache = [[Int?]](repeating: [Int?](repeating: nil, count: n), count: m)
    return pathSum(m-1, n-1, grid: grid, &cache)
  }
  
//  自底向上思考
/* 根据公式
  f(m,n) = min(f(m-1,n), f(m,n-1)) + s[m][n]
  f(0,0) = s[0][0]
  f(m,1) = f(m-1,1) + s[m][1]
  f(1,n) = f(1,n-1) + s[1][n]
   
   dp[m,n] = min(dp[m-1][n], dp[m][n-1]) + s[m][n]
   dp[0,0] = s[0][0]
   dp[m,1] = dp[m-1][n] + s[m][n]
   dp[1,n] = dp[m][n-1] + s[m][n]
  */
  func minPathSum2(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid.first!.count
    var dp = grid
    for i in 0..<m {
      for j in 0..<n {
        if i == 0 && j == 0 { continue }
        if i == 0 {
          dp[i][j] = dp[i][j-1] + grid[i][j]
        }else if j == 0 {
          dp[i][j] = dp[i-1][j] + grid[i][j]
        }else {
          dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
        }
      }
    }
    return dp[m-1][n-1]
  }
  
//  优化 dp 内存空间
  func minPathSum3(_ grid: [[Int]]) -> Int {
    if grid.count == 1 { return grid.first!.reduce(0, +) }
    
    var cur = grid[0]
    var pre = grid[1]
    
    let m = grid.count
    let n = grid.first!.count
    
    for i in 0..<m {
      for j in 0..<n {
        if i == 0 && j == 0 { continue }
        if i == 0 {
          cur[j] = cur[j-1] + grid[i][j]
        }else if j == 0 {
          cur[j] = pre[j] + grid[i][j]
        }else {
          cur[j] = min(pre[j], cur[j-1]) + grid[i][j]
        }
      }
      pre = cur
    }
    return cur.last!
  }
  
//  再优化, 优化不了了，不等价
  func minPathSum4(_ grid: [[Int]]) -> Int {
    if grid.count == 1 { return grid.first!.reduce(0, +) }
    
    var cur = grid[0]
    
    let m = grid.count
    let n = grid.first!.count
    
    for i in 0..<m {
      for j in 0..<n {
        if i == 0 && j == 0 { continue }
        if i == 0 || j == 0 {
          cur[j] += grid[i][j]
        }else {
          cur[j] = min(cur[j], cur[j-1]) + grid[i][j]
        }
      }
    }
    return cur.last!
  }
}

extension MinPathSum: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
      print(minPathSum([
        [1,3,1],
        [1,5,1],
        [4,2,1]
      ]))
    }
    performLogCostTime(self.name+" method1") {
      print(minPathSum1([
        [1,3,1],
        [1,5,1],
        [4,2,1]
      ]))
    }
    performLogCostTime(self.name+" method2") {
      print(minPathSum2([
        [1,3,1],
        [1,5,1],
        [4,2,1]]))
    }
    performLogCostTime(self.name+" method3") {
      print(minPathSum3([
        [1,3,1],
        [1,5,1],
        [4,2,1]]))
    }
    performLogCostTime(self.name+" method4") {
      print(minPathSum4([
        [1,3,1],
        [1,5,1],
        [4,2,1]]))
    }
  }
}
