//
//  1.6 Recover Binary Search Tree.swift
//  leetCode
//
//  Created by czw on 8/4/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/recover-binary-search-tree/
 难度：困难
 二叉搜索树中的两个节点被错误地交换。
 请在不改变其结构的情况下，恢复这棵树。
 
 示例 1:
 输入: [1,3,null,null,2]
      1
     /
    3
     \
      2
 输出: [3,1,null,null,2]
      3
     /
    1
     \
      2
 
 示例 2:
 输入: [3,1,4,null,null,2]
    3
   / \
  1   4
     /
    2
 输出: [2,1,4,null,null,3]
    2
   / \
  1   4
     /
    3
 
 进阶:
 使用 O(n) 空间复杂度的解法很容易实现。
 你能想出一个只使用常数空间的解决方案吗？
 
 分析：二叉搜索树，按中序遍历结果是顺序的
 
 */
class RecoverBinarySearchTree {
  func recoverTree(_ root: TreeNode?) {
    
  }
}

extension RecoverBinarySearchTree: Algorithm {
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
      
    }
    //
//    performLogCostTime(self.name + "method2") {
//      print(levelOrder0(root))
//    }
//    //
//    performLogCostTime(self.name + "method3") {
//      print(levelOrder1(root))
//    }
  }
}
