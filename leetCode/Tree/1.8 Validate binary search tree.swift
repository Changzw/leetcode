//
//  1.8 Validate binary search tree.swift
//  leetCode
//
//  Created by czw on 8/15/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode-cn.com/problems/validate-binary-search-tree/
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 假设一个二叉搜索树具有如下特征：
   节点的左子树只包含小于当前节点的数。
   节点的右子树只包含大于当前节点的数。
   所有左子树和右子树自身必须也是二叉搜索树。
 
 示例 1:
 输入:
   2
  / \
 1   3
 输出: true
 
 示例 2:
 输入:
    5
   / \
  1   4
     / \
    3   6
 输出: false
 
 1，5，3，4，6
 解释: 输入为: [5,1,4,null,null,3,6]。
           根节点的值为 5，但是其右子节点值为 4。
 
    5
   / \
  1   7
     / \
    3   8
 
  1，5，3，7，8
 分析：
 中序遍历二叉搜索树得出来的是有序的！
 left,root,right
 */

class ValidateBinarySearchTree {
  
  func tryAdd(_ res: inout [Int], v: Int) -> Bool {
    if let l = res.last {
      if l >= v {
        return false
      }else {
        res.append(v)
        return true
      }
    }else {
      res.append(v)
      return true
    }
  }
  
  func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    var cur: TreeNode? = root
    var stack = [TreeNode]()
    stack.append(root)
    var res = [Int]()
    
    while stack.count != 0 {
      // left
      while let left = cur?.left {
        stack.append(left)
        cur = left
      }
      
      // root
      if let n = stack.popLast() {
        cur = n
        if !tryAdd(&res, v: n.val) {
          return false
        }
      }
      
      // right
      while cur?.right == nil && stack.count != 0  {
        if let n = stack.popLast() {
          cur = n
          if !tryAdd(&res, v: n.val) {
            return false
          }
        }
      }
      
      if let right = cur?.right {
        stack.append(right)
        cur = right
      }
    }
    
    return true
  }

func isValidBST_(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    var pre = Int.min
    
    if !isValidBST(root.left) {
      return false
    }
    
    if root.val <= pre {
      return false
    }else {
      pre = root.val
    }
    return isValidBST(root.right)
  }
  
}

extension ValidateBinarySearchTree: Algorithm {
  func doTest() {
    let root = TreeNode(2)
    root.left = TreeNode(1)
    root.right = TreeNode(3)
//    root.left?.left = TreeNode(7)
//    root.left?.right = TreeNode(6)
//
//    root.right?.left = TreeNode(5)
//    root.right?.right = TreeNode(4)
//
//    root.left?.left?.left = TreeNode(3)
//    root.left?.left?.right = TreeNode(2)
    
    performLogCostTime(self.name + "method1") {
      print(isValidBST(root))
    }

  }
}
