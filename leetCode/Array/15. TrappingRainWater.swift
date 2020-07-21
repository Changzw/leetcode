//
//  15. TrappingRainWater.swift
//  leetCode
//
//  Created by czw on 7/19/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/* hard
 
给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/22/rainwatertrap.png
 
上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，
在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。

示例:
输入: [0,1,0,2,1,0,1,3,2,1,2,1]
输出: 6

分析:
 方法一：
 1. 没柱子的蓄水高度，左右两边最高的柱子最小值减去自己的高度
 
 这个技巧要会啊！
 
！！！得出公式 water[i] = min(max_left_height, max_right_height) - height
 
 
 2. 如何取得 i 左右的最大值!!!!!!
 
 3. 找到最大最小值后，再遍历一遍得出结果
 
 方法二：
 1. 递归，自顶向下分解
 
 1. 找到最高的柱子
 2. 处理左边
 3. 处理右边
 
 临界点：
 
 */

class TrappingRainWater {
  func trap(_ height: [Int]) -> Int {
    if height.count < 2 { return 0 }

    let len = height.count
    var maxLeft = Array<Int>(repeating: 0, count: len)
    var maxRight = Array<Int>(repeating: 0, count: len)
    
    for i in 1..<len {
      maxLeft[i] = max(maxLeft[i-1], height[i-1])
      maxRight[len-i-1] = max(maxRight[len-i], height[len-i])
    }
    
    var total = 0
    for i in 1..<len {
      let water = min(maxLeft[i], maxRight[i]) - height[i]
      if water > 0 {
        total += water
      }
    }

    return total
  }
  
  func trap_(_ height: [Int]) -> Int {
    let len = height.count
    var maxIdx = 0
    
    // find max index
    for i in 0..<len {
      if height[i] > height[maxIdx] {
        maxIdx = i
      }
    }
    
    var total = 0
    var peak = 0
    // left
    for i in 0..<maxIdx {
      if height[i] > peak {
        peak = height[i]
      }else {
        total += (peak - height[i])
      }
    }
    
    peak = 0
    // right
    for i in stride(from: len-1, to: maxIdx, by: -1) {
      if height[i] > peak {
        peak = height[i]
      }else {
        total += (peak - height[i])
      }
    }
    
    return total
  }
  
}


extension TrappingRainWater: Algorithm {
  
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
//          left: 0,0,1,1,2,2,2,2,3,3,3,3
//         rigth: 3,3,3,3,3,3,3,2,2,2,1,0
    }
    
    performLogCostTime(self.name + "method2") {
      print(trap_([0,1,0,2,1,0,1,3,2,1,2,1]))
    }
  }
}
