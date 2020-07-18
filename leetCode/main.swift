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

//MARK: - Array
if false {
  algorithm = LongestRepeatingCharacterReplacement()
  algorithm?.doTest()
}

if false {
  algorithm = LongestSubstring()
  algorithm?.doTest()
}

//MARK: 3Sum
if false{
  algorithm = _3Sum()
  algorithm?.doTest()
}

// MARK: 3SumClosest
if false{
  algorithm = _3SumClosest()
  algorithm?.doTest()
}

//MARK: 3Sum
if false{
  algorithm = _4Sum()
  algorithm?.doTest()
}

//MARK: RemoveDuplicatesFromSortedSrray
if false {
  algorithm = RemoveDuplicatesFromSortedSrray()
  algorithm?.doTest()
}
//MARK: RemoveDuplicatesFromSortedSrray2
if false {
  algorithm = RemoveDuplicatesFromSortedSrray2()
  algorithm?.doTest()
}

// MARK: - Dynamic
//MARK: MaximumSubarray
if false {
  algorithm = MaximumSubarray()
  algorithm?.doTest()
}

//MARK: ClimbingStairs
if false {
  algorithm = ClimbingStairs()
  algorithm?.doTest()
}

//MARK: BestTimetoBuyandSellStock
if false {
  algorithm = BestTimetoBuyandSellStock()
  algorithm?.doTest()
}

//MARK: HouseRobber
if false {
  algorithm = HouseRobber()
  algorithm?.doTest()
}

//MARK: - List

//MARK: - String
if false {
  algorithm = AddBinary()
  algorithm?.doTest()
}

if false {
  algorithm = AddStrings()
  algorithm?.doTest()
}

if false {
  algorithm = MergeSortedArray()
  algorithm?.doTest()
}

if false {
  algorithm = SearchRotatedSortedArray()
  algorithm?.doTest()
}

if false {
  algorithm = SearchRotatedSortedArray2()
  algorithm?.doTest()
}

if false {
  algorithm = SearchInsert()
  algorithm?.doTest()
}

if false {
  algorithm = LongestConsecutiveSequence()
  algorithm?.doTest()
}

if false {
  algorithm = RemoveElement()
  algorithm?.doTest()
}

if true {
  algorithm = NextPermutation()
  algorithm?.doTest()
}
