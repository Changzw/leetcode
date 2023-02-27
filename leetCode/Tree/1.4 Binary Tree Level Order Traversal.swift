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
 1. front = 0 为队首
 2. queue[0] = root
 3. queue.size 个 n 出队，n.left, n.right 入队, 更新 queue.size
 */
class BinaryTreeLevelOrderTraversal {
  
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var queue = [root]
    var front = 0
    var res = [[Int]]()
    
    while queue.count != front {
      let range = front..<queue.count
      front = queue.count
      
      let level = queue[range]
      res.append(level.map { $0.val })
      
      level.forEach { (n) in
        if let l = n.left { queue.append(l) }
        if let r = n.right { queue.append(r) }
      }
    }
    return res
  }
  
  func levelOrder1(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var res = [[Int]]()
    func level(_ t: TreeNode?, _ l: Int, _ res:inout [[Int]]) {
      if res.count == l { res.append([]) }
      if let v = t?.val { res[l].append(v) }
      if let left = t?.left { level(left, l+1, &res) }
      if let right = t?.right { level(right, l+1, &res) }
    }
    level(root, 0, &res)
    return res
  }
  
  
  func levelOrder0(_ root: TreeNode?) -> [Int] {
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
      print(levelOrder(root))
    }
//
    performLogCostTime(self.name + "method2") {
      print(levelOrder0(root))
    }
//
    performLogCostTime(self.name + "method3") {
      print(levelOrder1(root))
    }
  }
}
