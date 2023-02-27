//
//  12. NextPermutation.swift
//  leetCode
//
//  Created by czw on 7/18/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/next-permutation/
 难度：中等
 
 解题方式
 发现规律，实现规律
 
 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
 必须原地修改，只允许使用额外常数空间。
 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 1,2,3 →
 1,3,2
 2,1,3
 2,3,1
 3,1,2
 3,2,1
 
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 
 分析数据的规律
1234 56
1234 65
123 546
123 564
123 645
123 654
c
12 4365
12 4536
12 4563
12 4635
12 4653--4 从左向右比较发生降序
12 5346
...
654321
123456
 1. 下一大的排序是从后向前，找到降序的位置，x
 2. 在右侧找到比 x 大的最小元素，替换
 3. 右侧逆治
 
 算法：
 双指针，从后向前遍历
 如果发现 suff > prev 替换
 
 */

class NextPermutation {
  func nextPermutation(_ nums: inout [Int]) {
    if nums.count < 2 { return }
    
    var prev = nums.count - 2
    var suff = nums.count - 1
    
    // 1. 找到降序
    while prev > 0 && nums[prev] >= nums[suff] {
      prev -= 1
      suff -= 1
    }
    
    // 2. 没找到，全局reverse
    if nums[prev] >= nums[suff] {
      nums.reverse(); return
    }
    
    // 3. 找到替换元素
    while suff < nums.count && nums[suff] > nums[prev] {
      suff += 1
    }
    suff -= 1
    nums.swapAt(prev, suff)
    
    // 4. 剩余部分翻转
    nums[(prev+1)..<nums.count].reverse()
  }
}

extension NextPermutation: Algorithm {
  func doTest() {
    performLogCostTime(self.name + "method1") {
      var a = [5,1,1]
      nextPermutation(&a)
      print(a)
    }
  }
}


