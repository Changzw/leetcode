//
//  main.swift
//  removeDuplicates
//
//  Created by czw on 11/17/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

func performLogCostTime(_ name: String, _ exec: () -> ()) {
  let startTime = CFAbsoluteTimeGetCurrent()
  //要执行的代码
  exec()
  let endTime = CFAbsoluteTimeGetCurrent()
  
  debugPrint("\(name) cust：\((endTime - startTime)*1000)s")
}

class Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count != 0 else { return 0 }
    
    var length = 0
    let count = nums.count
    
    for item in nums.suffix(from: 1) {
      
    }
    return 3;
  }
}

