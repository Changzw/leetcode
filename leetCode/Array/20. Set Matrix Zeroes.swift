//
//  20. Set Matrix Zeroes.swift
//  leetCode
//
//  Created by czw on 7/20/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。
 示例 1:
 输入:
 [
     [1,1,1],
     [1,0,1],
     [1,1,1]
 ]
 输出:
 [
     [1,0,1],
     [0,0,0],
     [1,0,1]
 ]
 示例 2:
 输入:
 [
     [0,1,2,0],
     [3,4,5,2],
     [1,3,1,5]
 ]
 输出:
 [
     [0,0,0,0],
     [0,4,5,0],
     [0,3,1,0]
 ]
 进阶:
 一个直接的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
 你能想出一个常数空间的解决方案吗？
 分析：
 1. 所有 row 中有 0 的索引
 2. 找到 col 中有 0 的索引
 */

class SetMatrixZeroes {
  func setZeroes(_ matrix: inout [[Int]]) {
    var rowSet = Set<Int>()
    var colSet = Set<Int>()
    
    for (i,row) in matrix.enumerated() {
      for (j, v) in row.enumerated() {
        if v == 0 {
          rowSet.insert(i)
          colSet.insert(j)
        }
      }
    }
    
    for (i,row) in matrix.enumerated() {
      if rowSet.contains(i) {
        for (j, _) in row.enumerated() {
          matrix[i][j] = 0
        }
        continue
      }
      
      for (j, _) in row.enumerated() {
        if colSet.contains(j) {
          matrix[i][j] = 0
        }
      }
    }
  }
  
  func setZeroes_(_ matrix: inout [[Int]]) {
    var zeroRow = false
    var zeroColumn = false
    
    for i in 0 ..< matrix.count {
      for j in 0 ..< matrix[i].count {
        if matrix[i][j] == 0  {
          if i == 0  { zeroRow = true }
          if j == 0 { zeroColumn = true }
          matrix[0][j] = 0
          matrix[i][0] = 0
        }
      }
    }
    for j in 1..<matrix[0].count {
      if matrix[0][j] == 0 {
        for i in 0 ..< matrix.count {
          matrix[i][j] = 0
        }
      }
    }
    for i in 1..<matrix.count {
      if matrix[i][0] == 0 {
        for j in 0 ..< matrix[i].count {
          matrix[i][j] = 0
        }
      }
    }
    if zeroRow {
      for j in 0..<matrix[0].count {
        matrix[0][j] = 0
      }
    }
    if zeroColumn {
      for i in 0..<matrix.count {
        matrix[i][0] = 0
      }
    }
  }
}

extension SetMatrixZeroes: Algorithm {
  func doTest() {
    var m = [
      [0,1,2,0],
      [3,4,5,2],
      [1,3,1,5]
    ]
    performLogCostTime(self.name + " method1") {
      setZeroes(&m)
      print(m)
    }
    m = [
      [0,1,2,0],
      [3,4,5,2],
      [1,3,1,5]
    ]
    performLogCostTime(self.name + " method2") {
      setZeroes(&m)
      print(m)
    }
  }
}
