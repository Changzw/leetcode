//
//  1.1. Binary Tree Preorder Traversal.swift
//  leetCode
//
//  Created by czw on 7/29/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

/*
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 难度：中等
 
 给定一个二叉树，返回它的 前序 遍历。
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 递归：
 1. 根左右
 2. 临界 root == nil
 3. 递归（左，右）
 */
class BinaryTreePreorderTraversal {
  // 递归
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    
    res.append(root.val)
    res += preorderTraversal(root.left)
    res += preorderTraversal(root.right)
    return res
  }
  
  //
  func preorderTraversal_(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var stack: [TreeNode?] = [root]
    var res: [Int] = [root.val]
    var cur: TreeNode? = root
    
    while stack.count != 0 {
      // left
      while let current = cur?.left {
        stack.append(current)
        res.append(current.val)
        cur = current
      }
      
      // switch to right
      if let node = stack.last {
        stack.removeLast()
        
        if let right = node?.right {
          stack.append(right)
          res.append(right.val)
          cur = right
        }
      }
    }
    
    return res
  }
  
  func preorderTraversal__(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    var stack = [root]
    
    while let node = stack.popLast() {
      res.append(node.val)
      if let right = node.right { stack.append(right) }
      if let left = node.left { stack.append(left) }
    }
    
    return res
  }
  
  
  func preorderTraversal___(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res = [Int]()
    var stack = [TreeNode]()
    var cur: TreeNode? = root
    
    // 根左右
    while cur != nil || !stack.isEmpty {
      while cur != nil {
        stack.append(cur!)
        res.append(cur!.val)
        cur = cur!.left
      }
      
      if let n = stack.popLast() {
        cur = n.right
      }
    }
    
    return res
  }

}

extension BinaryTreePreorderTraversal: Algorithm {
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
      print(preorderTraversal(root))
    }
    
    performLogCostTime(self.name + "method2") {
      print(preorderTraversal_(root))
    }
    
    performLogCostTime(self.name + "method3") {
      print(preorderTraversal__(root))
    }
  }
}
