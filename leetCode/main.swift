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

//#pragma clang diagnostic push
////"-Wunused-variable"这里就是警告的类型
//#pragma clang diagnostic ignored "-Wunused-variable"
//int a;
//#pragma clang diagnostic pop
//在宏控制里的a变量不会产生黄色警告。
//
//也可以在作用域比较大的头文件中包含：
//
//#pragma clang diagnostic ignored "警告名称''
if false { algorithm = LongestRepeatingCharacterReplacement() }
if false { algorithm = LongestSubstring() }
if false { algorithm = _3Sum() }
if false { algorithm = _3SumClosest() }
if false { algorithm = _4Sum() }
if false { algorithm = RemoveDuplicatesFromSortedSrray() }
if false { algorithm = RemoveDuplicatesFromSortedSrray2() }
if false { algorithm = MaximumSubarray() }
if false { algorithm = ClimbingStairs() }
if false { algorithm = BestTimetoBuyandSellStock() }
if false { algorithm = HouseRobber() }
if false { algorithm = AddBinary() }
if false { algorithm = AddStrings() }
if false { algorithm = MergeSortedArray() }
if false { algorithm = SearchRotatedSortedArray() }
if false { algorithm = SearchRotatedSortedArray2() }
if false { algorithm = SearchInsert() }
if false { algorithm = LongestConsecutiveSequence() }
if false { algorithm = RemoveElement() }
if false { algorithm = NextPermutation() }
if false { algorithm = PermutationSequence() }
if false { algorithm = TrappingRainWater() }
if false { algorithm = RotateImage() }
if false { algorithm = Climbing_Stairs() }
if false { algorithm = GrayCode() }
if false { algorithm = SetMatrixZeroes() }
if false { algorithm = GasStation() }
if false { algorithm = Candy() }
if false { algorithm = SingleNumber() }
if false { algorithm = SingleNumber2() }
if false { algorithm = AddTwoNumbers() }
if false { algorithm = ReverseLinkedList() }
if false { algorithm = ReverseLinkedList2() }
if false { algorithm = PartitionList() }
if false { algorithm = RemoveDuplicatesfromSortedList() }
if false { algorithm = RemoveDuplicatesfromSortedList2() }
if false { algorithm = RotateList() }
if false { algorithm = RemoveNthNodeFromEndofList() }
if false { algorithm = SwapNodesInPairs() }
if false { algorithm = ReverseNodesInk_Group() }
if false { algorithm = PowXN() }
if false { algorithm = Numberof1bits() }
if false { algorithm = BinaryTreePreorderTraversal() }
if false { algorithm = BinaryTreeInorderTraversal() }
if false { algorithm = BinaryTreePostorderTraversal() }
if false { algorithm = Triangle() }
if false { algorithm = MaximumSubarray() }
if true { algorithm = PalindromePartitioningII() }
if true { algorithm = LongestPalindromic() }

algorithm?.doTest()
