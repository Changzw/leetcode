//
//  main.swift
//  removeDuplicates
//
//  Created by czw on 11/17/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

class RemoveDuplicates {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count != 0 else { return 0 }
    
    var length = 0
    let count = nums.count
    
    for item in nums.suffix(from: 1) {
      
    }
    return 3;
  }
}

extension RemoveDuplicates: Algorithm {
  var name: String {
    return "RemoveDuplicates"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      
    }

  }
}

