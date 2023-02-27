//
//  1.10 longest Increasing Subsequence.swift
//  leetCode
//
//  Created by czw on 8/2/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/longest-increasing-subsequence/
 难度：中等
 给定一个无序的整数数组，找到其中最长上升子序列的长度。
 
 示例:
   输入: [10,9,2,5,3,7,101,18]
   输出: 4
   解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 
 说明:
 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 你算法的时间复杂度应该为 O(n²) 。
 进阶: 你能将算法的时间复杂度降低到 O(nlogn) 吗?

分析：
 f(n) = max[f(n-j)] + s[n] > subSequence.max ? 1 : 0
 
 dp[i]= max(dp[j]+1), 0≤j<i,nums[j]<nums[i]
 */

class longestIncreasingSubsequence {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count < 2 { return nums.count }
    
    var dp = [Int](repeating: 1, count: nums.count)
    for i in 1..<nums.count {
      for j in 0..<i {
        if nums[j] < nums[i] {
          dp[i] = max(dp[i], dp[j] + 1)
        }
      }
    }
    return dp.max()!
  }
}

extension longestIncreasingSubsequence: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
      print(lengthOfLIS([10,9,2,5,3,7,101,18]))
    }
    //    performLogCostTime(self.name+" method1") {
    //      print(uniquePaths1(22, 25))
    //    }
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
