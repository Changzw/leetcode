//
//  1.6 MaximumProductSubarray.swift
//  leetCode
//
//  Created by czw on 8/1/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode-cn.com/problems/maximum-product-subarray/
 难度：中等
 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。
 
 示例 1:
   输入: [2,3,-2,4]
   输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 示例 2:
   输入: [-2,0,-1]
   输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
 
 分析: 找递归公式！！！
 f(i) 表示已 i 为结尾的最大连续数组的 乘积
 f(i) = max( max[f(i-1)] * s[i], min[f(i-1)] * s[i] )

 dp[i] = max( max(dp[i-1]) * s[i], min(dp[i-1]) * s[i] )
 */

class MaximumProductSubarray {
  func maxProduct(_ nums: [Int]) -> Int {
    var dpX = [Int](repeating: 0, count: nums.count)
    var dpN = [Int](repeating: 0, count: nums.count)
    dpX[0] = nums[0]
    dpN[0] = nums[0]
    
    for i in 1..<nums.count {
      let v0 = dpN[i-1] * nums[i]
      let v1 = dpX[i-1] * nums[i]
      dpX[i] = max(max(v0, v1), nums[i])
      dpN[i] = min(min(v0, v1), nums[i])
    }
    return max(dpN.max()!, dpX.max()!)
  }
  
  func maxProduct0(_ nums: [Int]) -> Int {
    var dpX = [Int](repeating: 0, count: nums.count)
    var dpN = [Int](repeating: 0, count: nums.count)
    dpX[0] = nums[0]
    dpN[0] = nums[0]
    
    var max_ = nums[0]
    for i in 1..<nums.count {
      let v0 = dpN[i-1] * nums[i]
      let v1 = dpX[i-1] * nums[i]
      dpX[i] = max(max(v0, v1), nums[i])
      dpN[i] = min(min(v0, v1), nums[i])
      
      let m = max(dpX[i], dpN[i])
      if m > max_ { max_ = m }
    }
    return max_
  }
}

extension MaximumProductSubarray: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
      print(maxProduct([-2,3,-4]))
    }
    
    performLogCostTime(self.name+" method") {
      print(maxProduct0([-2,3,-4]))
    }
  }
}
