//
//  3. SearchInsert.swift
//  leetCode
//
//  Created by czw on 7/18/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation


class SearchInsert {
  func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var l = 0
    var r = nums.count - 1
    
    var mid = 0
    while l <= r {
      mid = (l + r) / 2
      if target == nums[mid] { return mid }
      
      if target <= nums[mid] {
        r = mid - 1
      }else {
        l = mid + 1
      }
    }
    
    return target > nums[mid] ? mid + 1 : mid
  }
}

extension SearchInsert: Algorithm {
  var name: String {
    return "SearchInsert"
  }
  
  func doTest() {
    performLogCostTime(self.name + "method1") {
      print(searchInsert([1,3,5,6], 7))
    }
  }
}
