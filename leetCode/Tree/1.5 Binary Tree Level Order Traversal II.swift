//
//  1.5 Binary Tree Level Order Traversal II.swift
//  leetCode
//
//  Created by czw on 8/4/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
     3
    / \
   9  20
  /     \
 15      7
 返回其自底向上的层次遍历为：
 [
   [15,7],
   [9,20],
   [3]
 ]
 
 分析有了 BinaryTreeLevelOrderTraversal 却出结果以后，把 数组翻转即可
 */
class BinaryTreeLevelOrderTraversalII {
  func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    guard let r = root else { return [] }
    var res = [[Int]]()
    
    func level(_ root: TreeNode?, _ lev: Int, _ res: inout [[Int]]) {
      guard let r = root else { return }
      if lev == res.count { res.append([]) }
      res[lev].append(r.val)
      if let l = r.left { level(l, lev+1, &res) }
      if let r = r.right { level(r, lev+1, &res) }
    }
    level(r, 0, &res)
    return res.reversed()
  }
}

extension BinaryTreeLevelOrderTraversalII: Algorithm {
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
//      print(levelOrderBottom0(root))
//    }
//    //
//    performLogCostTime(self.name + "method3") {
//      print(levelOrderBottom1(root))
//    }
  }
}
