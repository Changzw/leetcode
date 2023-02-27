//
//  Remove Duplicates from Sorted Array.swift
//  leetCode
//
//  Created by czw on 12/6/19.
//  Copyright © 2019 czw. All rights reserved.
//

//https://leetcode.com/problems/remove-duplicates-from-sorted-array/

/*
 Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
 Do not allocate extra space for another array,
 you must do this by modifying the input array in-place with O(1) extra memory.
 
 Example 1:
 Given nums = [1,1,2],
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
 
 It doesn't matter what you leave beyond the returned length.
 
 Example 2:
 Given nums = [0,0,1,1,1,2,2,3,3,4],
 Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.
 
 It doesn't matter what values are set beyond the returned length.
 
 Clarification:
 Confused why the returned value is an integer but your answer is an array?
 Note that the input array is passed in by reference,
 which means modification to the input array will be known to the caller as well.
 
 Internally you can think of this:
 // nums is passed in by reference. (i.e., without making a copy)
 int len = removeDuplicates(nums);
 // any modification to nums in your function would be known by the caller.
 // using the length returned by your function, it prints the first len elements.
 for (int i = 0; i < len; i++) {
   print(nums[i]);
 }

 */
import Foundation

class RemoveDuplicatesFromSortedSrray {
  // think:
  /*
   从后往前遍历
   nums[i] == nums[i-1]
   remove i-1
   i -= 1
   
   */
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    var i = nums.count - 1
    while i > 0 {
      while i > 0 && nums[i] == nums[i-1] {
        nums.remove(at: i)
        i -= 1
      }
      
      i -= 1
    }
    
    return nums.count
  }
  
  // 比起第一种方法，费时的是：每删除一个元素数组重排。如果把后面的元素交换到前面，就不需要重新排数组了。
  // 题目也说只需
  /*
   如何不要重排呢？
   while i ++
   记录 当前 remove 的个数
   nums[i-remove] = nums[i]
   */
  func removeDuplicates2(_ nums: inout [Int]) -> Int {
    let count = nums.count
    var remove = 0, i = 1
    
    while i < count {
      if nums[i-1] == nums[i] {
        remove += 1
      }else {
        nums[i-remove] = nums[i]
      }
      i += 1
    }
    
    return count - remove
  }
}

extension RemoveDuplicatesFromSortedSrray: Algorithm {
  var name: String{
    return "RemoveDuplicatesFromSortedSrray"
  }
  
  func doTest() {
    performLogCostTime(self.name + "1") {
      var data = [0,0,1,1,1,2,2,3,3,4]
      print(removeDuplicates(&data))
    }
    
    performLogCostTime(self.name + "2") {
      var data = [0,0,1,1,1,2,2,3,3,4]
      print(removeDuplicates2(&data))
    }
  }
}

