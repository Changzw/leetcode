//
//  1.2 Binary Tree Inorder Traversal.swift
//  leetCode
//
//  Created by czw on 7/29/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
 难度 中等
 给定一个二叉树，返回它的 前序 遍历。
   示例:
 输入: [1,null,2,3]
 1
  \
   2
  /
 3
 
 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 分析：
 左根右
 */

class BinaryTreeInorderTraversal {
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    
    res += inorderTraversal(root.left)
    res.append(root.val)
    res += inorderTraversal(root.right)
    
    return res
  }
  
  func inorderTraversal_(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    var stack: [TreeNode] = [root]
    var cur = root
    while stack.count != 0 {
      // left
      while let left = cur.left {
        stack.append(left)
        cur = left
      }
      
      // root
      if let n = stack.popLast() {
        cur = n
        res.append(n.val)
      }
      
      // right
      while cur.right == nil && stack.count != 0  {
        if let n = stack.popLast() {
          cur = n
          res.append(n.val)
        }
      }
      
      if let right = cur.right {
        stack.append(right)
        cur = right
      }
    }
    return res
  }
  
  func inorderTraversal__(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
//    var stack: [TreeNode] = [root]
//
//    while let node = stack.popLast() {
//      if let right = node.right {
//        stack.append(right)
//      }
//
//    }
    return res
  }

  func inorderTraversal___(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var cur = root
    
    // 左根右
    while cur != nil || !stack.isEmpty {
      while cur != nil{ //一直遍历到最后一层
        stack.append(cur!)
        cur = cur!.left
      }
      if let n = stack.popLast() {
        res.append(n.val)
        cur = n.right
      }
    }
    return res
  }
}

extension BinaryTreeInorderTraversal: Algorithm {
  func doTest() {
    let root = TreeNode(2)
    root.left = TreeNode(3)
    root.right = nil// TreeNode(8)
    root.left?.left = TreeNode(1)
    
//    root.left?.right = TreeNode(6)
//
//    root.right?.left = TreeNode(5)
//    root.right?.right = TreeNode(4)
//
//    root.left?.left?.left = TreeNode(3)
//    root.left?.left?.right = TreeNode(2)
    
    performLogCostTime(self.name + "method1") {
      print(inorderTraversal(root))
    }
    
    performLogCostTime(self.name + "method2") {
      print(inorderTraversal_(root))
    }
//
    performLogCostTime(self.name + "method3") {
      print(inorderTraversal__(root))
    }
  }
}
