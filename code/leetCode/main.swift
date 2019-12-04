//
//  main.swift
//  leetCode
//
//  Created by czw on 12/2/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

func performLogCostTime(_ name: String, _ exec: () -> ()) {
  let startTime = CFAbsoluteTimeGetCurrent()
  exec()
  let endTime = CFAbsoluteTimeGetCurrent()
  
  debugPrint("\(name) cost time：\((endTime - startTime)*1000)s")
}

var algorithm: Algorithm?

//MARK: Array
//MARK: 3Sum
if false{
  algorithm = _3Sum()
}

// MARK: 3SumClosest
if false{
  algorithm = _3SumClosest()
}

//MARK: 3Sum
if false{
  algorithm = _4Sum()
}

//MARK: List

//MARK: String
if false {
  algorithm = AddBinary()
}

if true {
  algorithm = AddStrings()
}

if let al = algorithm {
  al.doTest()
}



