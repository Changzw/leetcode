//
//  Remove Duplicates from Sorted Array II.swift
//  leetCode
//
//  Created by czw on 12/6/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
/*
 Given a sorted array nums, remove the duplicates in-place such that duplicates appeared at most twice and return the new length.
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 Example 1:
 
 Given nums = [1,1,1,2,2,3],
 
 Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
 
 It doesn't matter what you leave beyond the returned length.
 Example 2:
 
 Given nums = [0,0,1,1,1,1,2,3,3],
 
 Your function should return length = 7, with the first seven elements of nums being modified to 0, 0, 1, 1, 2, 3 and 3 respectively.
 
 It doesn't matter what values are set beyond the returned length.
 Clarification:
 
 Confused why the returned value is an integer but your answer is an array?
 
 Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.
 
 Internally you can think of this:
 
 // nums is passed in by reference. (i.e., without making a copy)
 int len = removeDuplicates(nums);
 
 // any modification to nums in your function would be known by the caller.
 // using the length returned by your function, it prints the first len elements.
 for (int i = 0; i < len; i++) {
 print(nums[i]);
 }
 */

/*
 thinking:
 [0,0,1,1,1,1,2,3,3], - [0,0,1,1,2,3,3]
 
 因为要remove 那么从后往前遍历，然后 remove，保证索引 正确
 loop: count-1 -> 0
  flag = 0
  loop: a[i-1] == a[i]
    flag += 1
    if flag > 1
      remove
    i -= 1
  i -= 1
 */

class RemoveDuplicatesFromSortedSrray2 {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = nums.count - 1
    var flag = 0
    while i > 0 {
      while i > 0 && nums[i-1] == nums[i]  {
        flag += 1
        if flag > 1 {
          nums.remove(at: i)
        }
        i -= 1
      }

      flag = 0
      i -= 1
    }
    return nums.count
  }
  
//  trick
  func removeDuplicates2(_ nums: inout [Int]) -> Int {
    var i = 0
    while i<nums.count {
      if i<2 || nums[i] > nums[i-2] {
        
      }
      i += 1
    }
    
    return 0
  }
}

extension RemoveDuplicatesFromSortedSrray2: Algorithm {
  var name: String{
    return "RemoveDuplicatesFromSortedSrray2"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      var data = [0,0,1,1,1,1,2,3,3]
      print(removeDuplicates(&data))
    }
  }
}
