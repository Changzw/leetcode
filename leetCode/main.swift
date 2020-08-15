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
if false { algorithm = BinaryTreeLevelOrderTraversal() }
if false { algorithm = BinaryTreeLevelOrderTraversalII() }
if false { algorithm = Triangle() }
if false { algorithm = MaximumSubarray() }
if false { algorithm = LongestPalindromic() }
if false { algorithm = PalindromePartitioningII() }
if false { algorithm = UniquePaths() }
if false { algorithm = MinPathSum() }
if false { algorithm = DecodeWays() }
if true { algorithm = WordBreak() }
if true { algorithm = longestIncreasingSubsequence() }
if true { algorithm = CoinChange() }

if true { algorithm = PerfectSquares() }
if true { algorithm = MaximumProductSubarray() }
if true { algorithm = LRUCache(2) }
if true { algorithm = ValidateBinarySearchTree() }
if true { algorithm = BinaryTreeZigzagLevelOrderTraversal() }
if true { algorithm = MaximumDepthOfBinaryTree() }

algorithm?.doTest()
