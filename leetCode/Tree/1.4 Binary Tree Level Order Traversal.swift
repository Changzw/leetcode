//
//  1.4 Binary Tree Level Order Traversal.swift
//  leetCode
//
//  Created by czw on 7/30/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 难度 中等
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
 示例：
 二叉树：[3,9,20,null,null,15,7],
    3
   / \
  9  20
 /     \
15      7
 返回其层次遍历结果：
 [
   [3],
   [9,20],
   [15,7]
 ]
 
 分析：
 先进先出队列处理这个问题
 */
class BinaryTreeLevelOrderTraversal {
  func levelOrderBottom_0(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var queue = [root]
    var front = 0
    var res = [Int]()
    var cur: TreeNode? = root
    
    while cur != nil {
      res.append(cur!.val)
      if let left = cur?.left { queue.append(left) }
      if let right = cur?.right { queue.append(right) }
      
      front += 1
      if front < queue.count {
        cur = queue[front]
      }else {
        cur = nil
      }
    }
    
    return res
  }
  
  func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [[]] }
    
    var queue = [[root]]
    var front = 0
    var res = [[Int]]()
    var cur: TreeNode? = root
    
//    while cur != nil {
//      res.append(cur!.val)
//      if let left = cur?.left { queue.append(left) }
//      if let right = cur?.right { queue.append(right) }
//
//      front += 1
//      if front < queue.count {
//        cur = queue[front]
//      }else {
//        cur = nil
//      }
//    }
    
    return res
  }
  
}

extension BinaryTreeLevelOrderTraversal: Algorithm {
  func doTest() {
    let root = TreeNode(10)
    root.left = TreeNode(9)
    root.right = TreeNode(8)
    root.left?.left = TreeNode(7)
    root.left?.right = TreeNode(6)
    
    root.right?.left = TreeNode(5)
    root.right?.right = TreeNode(4)
    
    root.left?.left?.left = TreeNode(3)
    root.left?.left?.right = TreeNode(2)
    
    performLogCostTime(self.name + "method1") {
      print(levelOrderBottom(root))
    }
//
//    performLogCostTime(self.name + "method2") {
//      print(preorderTraversal_(root))
//    }
//
//    performLogCostTime(self.name + "method3") {
//      print(preorderTraversal__(root))
//    }
  }
}
