//
//  4. FindMedianSortedArrays.swift
//  leetCode
//
//  Created by czw on 7/18/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。
 请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 你可以假设 nums1 和 nums2 不会同时为空。
 
 示例 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 则中位数是 2.0
 
 示例 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 则中位数是 (2 + 3)/2 = 2.5
 
 问题：两个数组的中位数
 1. 合并？复杂度O(n)，不行，那咋整
 2. log 那就需要二叉树
 3. 中位数不能直接得到转换思想-> 寻找第 k 大的数
 4. 在两个有序数组中找到第 k 大的数
 */

class FindMedianSortedArrays {
  func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let len = nums1.count + nums2.count
    
    return 0
  }
}

extension FindMedianSortedArrays: Algorithm {
  var name: String {
    return "FindMedianSortedArrays"
  }
  
  func doTest() {
    performLogCostTime(self.name + "method") {
      print(findMedianSortedArrays([1,3,1,1,1], [3]))
    }
  }
}
