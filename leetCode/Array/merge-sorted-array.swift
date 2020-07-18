//
//  merge-sorted-array.swift
//  leetCode
//
//  Created by czw on 6/2/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
//使用两个指针，分别指向两个数组的最后面
//pt1 = m - 1
//pt2 = n - 1
//数组长度
//len = 3 + 3
//nums1 当前指针 curr = len - 1
//
//因为 nums1 是连续的，nums2 放到 nums1 里面，那么当 nums2 遍历完后整个遍历就结束了


class MergeSortedArray {
  func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var cur = m + n - 1
    var idx1 = m - 1
    var idx2 = n - 1
    
    while idx2 >= 0 {
      if idx1 >= 0 && nums1[idx1] > nums2[idx2] {
        nums1[cur] = nums1[idx1]
        idx1 -= 1
      }else {
        nums1[cur] = nums2[idx2]
        idx2 -= 1
      }
      cur -= 1
    }
  }
}

extension MergeSortedArray: Algorithm {
  var name: String {
    return "merge"
  }
  
  func doTest() {
    
    performLogCostTime(self.name + "method1") {
      var x = [0]
      merge(&x, 0, [1], 1)
//      print(self.([3,2,4], 6))
    }
  }
}
