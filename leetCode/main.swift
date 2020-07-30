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

if false {
  algorithm = NextPermutation()
  algorithm?.doTest()
}

if false {
  algorithm = PermutationSequence()
  algorithm?.doTest()
}

if false {
  algorithm = TrappingRainWater()
  algorithm?.doTest()
}

if false {
  algorithm = RotateImage()
  algorithm?.doTest()
}

if false {
  algorithm = Climbing_Stairs()
  algorithm?.doTest()
}

if false {
  algorithm = GrayCode()
  algorithm?.doTest()
}

if false {
  algorithm = SetMatrixZeroes()
  algorithm?.doTest()
}

if false {
  algorithm = GasStation()
  algorithm?.doTest()
}

if false {
  algorithm = Candy()
  algorithm?.doTest()
}

if false {
  algorithm = SingleNumber()
  algorithm?.doTest()
}

if false {
  algorithm = SingleNumber2()
  algorithm?.doTest()
}

if false {
  algorithm = AddTwoNumbers()
  algorithm?.doTest()
}

if false {
  algorithm = ReverseLinkedList()
  algorithm?.doTest()
}

if false {
  algorithm = ReverseLinkedList2()
  algorithm?.doTest()
}

if false {
  algorithm = PartitionList()
  algorithm?.doTest()
}

if false {
  algorithm = RemoveDuplicatesfromSortedList()
  algorithm?.doTest()
}

if false {
  algorithm = RemoveDuplicatesfromSortedList2()
  algorithm?.doTest()
}

if false {
  algorithm = RotateList()
  algorithm?.doTest()
}

if false {
  algorithm = RemoveNthNodeFromEndofList()
  algorithm?.doTest()
}

if false {
  algorithm = SwapNodesInPairs()
  algorithm?.doTest()
}

if false {
  algorithm = ReverseNodesInk_Group()
  algorithm?.doTest()
}

if false {
  algorithm = PowXN()
  algorithm?.doTest()
}

if false {
  algorithm = Numberof1bits()
  algorithm?.doTest()
}

if false {
  algorithm = BinaryTreePreorderTraversal()
  algorithm?.doTest()
}

if false {
  algorithm = BinaryTreeInorderTraversal()
  algorithm?.doTest()
}

if false {
  algorithm = BinaryTreePostorderTraversal()
  algorithm?.doTest()
}

if true {
  algorithm = BinaryTreeLevelOrderTraversal()
  algorithm?.doTest()
}
