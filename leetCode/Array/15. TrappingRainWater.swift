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
 1. 减去 等于0
 2. 从左指针向右游走
 3. 锚定 leftAnchor，在右边找到第一个 max(rightArr) >= height[leftAnchor] || 没有大于 height[leftAnchor] 取 max(rightArr)，
    得到位置 rightAnchor
 4. 得到 leftAnchor -- rightAnchor 之间的谁住高度
 5. leftAnchor 到达右边结束
 */

class TrappingRainWater {
  
  func findPosition(start: Int, _ nums: [Int], limitHeight: Int) -> Int {
    var maxH = 0
    var idx = 0
    
    var i = start
    while i < nums.count {
      if nums[i] >= limitHeight {
        return i
      }else {
        maxH = max(maxH, nums[i])
        idx = i
      }
      i += 1
    }

    return idx
  }
  
  func trap(_ height: [Int]) -> Int {
    if height.count < 2 { return 0 }
    
    var l = 0
    var r = height.count - 1
    while l < r && height[l] == 0 { l += 1 }
    while r > l && height[r] == 0 { r -= 1 }
    
    var totalHeight = 0
    var waterAnchor = l
    while waterAnchor != r {
      let p = findPosition(start: waterAnchor+1, height, limitHeight: height[waterAnchor])
      let minH = min(height[waterAnchor], height[p])
      var index = waterAnchor + 1
      while index < p {
        totalHeight += (minH - height[index])
        index += 1
      }
      waterAnchor = p
    }
    
    return totalHeight
  }
}


extension TrappingRainWater: Algorithm {
  
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
    }
  }
}
