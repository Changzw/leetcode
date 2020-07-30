//
//  SearchRotatedSortedArray2.swift
//  leetCode
//
//  Created by czw on 7/18/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/search-in-rotated-sorted-array-ii/
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 ( 例如，数组 [0,0,1,2,2,5,6] 可能变为 [2,5,6,0,0,1,2] )。
 编写一个函数来判断给定的目标值是否存在于数组中。若存在返回 true，否则返回 false。
 
 示例 1:
 输入: nums = [2,5,6,0,0,1,2], target = 0
 输出: true
 
 示例 2:
 输入: nums = [2,5,6,0,0,1,2], target = 3
 输出: false
 进阶:
 
 这是 搜索旋转排序数组 的延伸题目，本题中的 nums  可能包含重复元素。
 这会影响到程序的时间复杂度吗？会有怎样的影响，为什么？
 
 [1,1,3,1, 1 ,1,1,1,1],3
 
 有重复的，会造成哪边是有序的不确定
 需要重新找到有序的判定条件
 or 剔除重复元素，再查找
 */

class SearchRotatedSortedArray2 {
  
  func search(_ nums: [Int], _ target: Int) -> Bool {
    if nums.count == 1 {
      return target == nums[0]
    }
    
    var l = 0
    var r = nums.count - 1
    
    while l <= r {
      while l < nums.count - 1 && nums[l] == nums[l+1]  {
        l += 1
      }
      while r > 0 && nums[r] == nums[r-1] {
        r -= 1
      }
      
      var mid = (l + r) / 2
      if nums[mid] == target { return true }
      
      if nums[l] <= nums[mid] {
        if nums[l] <= target && target < nums[mid] { // 在有序区间
          r = mid - 1
        }else {
          l = mid + 1
        }
      }else {
        if nums[r] >= target && target > nums[mid] {// 在有序区间
          l = mid + 1
        } else {
          r = mid - 1
        }
      }
      mid = (l + r) / 2
    }
    
    return false
  }
}

extension SearchRotatedSortedArray2: Algorithm {
  var name: String {
    return "SearchRotatedSortedArray2"
  }
  
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(search([1,3,1,1,1], 3))
    }
  }
}
