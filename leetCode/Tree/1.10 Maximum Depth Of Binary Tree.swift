//
//  1.10 Maximum Depth Of Binary Tree.swift
//  leetCode
//
//  Created by czw on 8/15/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，找出其最大深度。
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。
 */

class MaximumDepthOfBinaryTree {
  func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
  }
  
  func maxDepth_(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var queue = [TreeNode]()
    queue.append(root)
    var level = 0
    var front = 0
    
    while front != queue.count {
      level += 1
      let size = queue.count
      while front != size {
        let n = queue[front]
        if let l = n.left {
          queue.append(l)
        }
        if let r = n.right {
          queue.append(r)
        }
        front += 1
      }
    }
    
    return level
  }
}

extension MaximumDepthOfBinaryTree: Algorithm {
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
    
    performLogCostTime(self.name + " method1") {
      print(maxDepth(root))
    }
    performLogCostTime(self.name + " method2") {
      print(maxDepth_(root))
    }
  }
}
