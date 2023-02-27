//
//  1. Search in Rotated Sorted Array.swift
//  leetCode
//
//  Created by czw on 7/17/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 难度：中等，分类分析题型
 https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
 
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 你可以假设数组中不存在重复的元素。
 你的算法时间复杂度必须是 O(log n) 级别。
 
 示例 1:
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 
 示例 2:
 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 
 问题：如何解决 旋转后的二叉问题？
 1. 确定使用二叉树
 2. 判断左右哪边有序
 3. 判断 target 是否在有序区间呢
    * 注意有序边界情况
 4. 不在有序内就是另一边
 
 
 本题是需要使用二分查找，怎么分是关键，举个例子：
 
 第一类
 1011110111 和 1110111101 这种。此种情况下 nums[start] == nums[mid]，分不清到底是前面有序还是后面有序，此时 start++ 即可。相当于去掉一个重复的干扰项。
 第二类
 2 3 4 5 6 7 1 这种，也就是 nums[start] < nums[mid]。此例子中就是 2 < 5；
 这种情况下，前半部分有序。因此如果 nums[start] <=target<nums[mid]，则在前半部分找，否则去后半部分找。
 第三类
 6 7 1 2 3 4 5 这种，也就是 nums[start] > nums[mid]。此例子中就是 6 > 2；
 这种情况下，后半部分有序。因此如果 nums[mid] <target<=nums[end]。则在后半部分找，否则去前半部分找。
 */

class SearchRotatedSortedArray {

//  func search_() ->  {
//
//      if (nums == null || nums.length == 0) {
//        return false;
//      }
//      int start = 0;
//      int end = nums.length - 1;
//      int mid;
//      while (start <= end) {
//        mid = start + (end - start) / 2;
//        if (nums[mid] == target) {
//          return true;
//        }
//        if (nums[start] == nums[mid]) {
//          start++;
//          continue;
//        }
//        //前半部分有序
//        if (nums[start] < nums[mid]) {
//          //target在前半部分
//          if (nums[mid] > target && nums[start] <= target) {
//            end = mid - 1;
//          } else {  //否则，去后半部分找
//            start = mid + 1;
//          }
//        } else {
//          //后半部分有序
//          //target在后半部分
//          if (nums[mid] < target && nums[end] >= target) {
//            start = mid + 1;
//          } else {  //否则，去后半部分找
//            end = mid - 1;
//
//          }
//        }
//      }
//      //一直没找到，返回false
//      return false;
//
//  }
  
  func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 1 {
      return target == nums[0] ? 0 : -1
    }
    
    var l = 0
    var r = nums.count - 1
    var mid = (l + r) / 2
    
    while l <= r {
      if nums[mid] == target { return mid }
      
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
    
    return -1
  }
}

extension SearchRotatedSortedArray: Algorithm {
  var name: String {
    return "SearchRotatedSortedArray"
  }
  
  func doTest() {
    
    performLogCostTime(self.name + "method1") {
      print(search([1,3,5], 5))
    }
  }
}
