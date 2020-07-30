//
//  1.3 Binary Tree Postorder Traversal.swift
//  leetCode
//
//  Created by czw on 7/29/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
 难度：困难
给定一个二叉树，返回它的 后序 遍历。
 示例:
 输入: [1,null,2,3]
 1
  \
   2
  /
 3
 输出: [3,2,1]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 分析：
 左右根
 */

class BinaryTreePostorderTraversal {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res = [Int]()
    
    res += postorderTraversal(root.left)
    res += postorderTraversal(root.right)
    res.append(root.val)
    
    return res
  }
  
  // 因为前序遍历是 根左右，后序遍历是 左右根，反过来是 根右左
  func postorderTraversal_(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res = [Int]()
    var stack = [TreeNode]()
    var cur: TreeNode? = root

    while cur != nil || !stack.isEmpty {
      while cur != nil {
        stack.append(cur!)
        res.append(cur!.val)
        cur = cur?.right
      }
      if let n = stack.popLast() {
        cur = n.left
      }
    }
    return res.reversed()
  }
  
  // 同上
  func postorderTraversal__(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res = [Int]()
    var stack = [root]
    
    while let node = stack.popLast() {
      res.append(node.val)
      if let left = node.left { stack.append(left) }
      if let right = node.right { stack.append(right) }
    }

    return res.reversed()
  }

}


extension BinaryTreePostorderTraversal: Algorithm {
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
      print(postorderTraversal(root))
    }
    
    performLogCostTime(self.name + "method2") {
      print(postorderTraversal_(root))
    }
    
    performLogCostTime(self.name + "method3") {
      print(postorderTraversal_(root))
    }
  }
}
