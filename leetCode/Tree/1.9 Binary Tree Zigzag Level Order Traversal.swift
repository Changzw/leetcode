//
//  1.9 Binary Tree Zigzag Level Order Traversal.swift
//  leetCode
//
//  Created by czw on 8/15/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/
 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
                3
               / \
              9  20
             / \
            15  7
 返回锯齿形层次遍历如下：
 [
   [3],
   [20,9],
   [15,7]
 ]
 
 分析：
 1. 层级遍历，使用 queue
 2. flag 切换每一层的遍历方向
 3. size
 
 广度优先
 */
class BinaryTreeZigzagLevelOrderTraversal {
  func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var queue = [TreeNode]()
    var res = [[Int]]()
    var flag = false// true ->, false <-
    var front = 0
    
    queue.append(root)
    
    while front != queue.count {
      let size = queue.count
      var level = [Int]()
      
      while front != size {
        let n = queue[front]
        level.append(n.val)
        
        if let left = n.left {
          queue.append(left)
        }
        if let right = n.right {
          queue.append(right)
        }
        front += 1
      }
      
      if flag {
        level.reverse()
      }
      res.append(level)
      
      flag = !flag
    }
    
    return res
  }
 // TODO: zuo
  func zigzagLevelOrder_(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var res = [[Int]]()
    
    return res
  }

}

extension BinaryTreeZigzagLevelOrderTraversal: Algorithm {
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
      print(zigzagLevelOrder(root))
    }

  }
}
