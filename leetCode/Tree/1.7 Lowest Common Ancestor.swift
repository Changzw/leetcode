//
//  1.7 LowestCommonAncestor.swift
//  leetCode
//
//  Created by czw on 8/7/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 中等
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 
 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]
 
 示例 1:
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 
 示例 2:
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出: 5
 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
 
 说明:
 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉树中。
 
 分析1：
 1. 遍历一遍把所有 parent node 放到字典中
 2. 回溯字典，找公共节点
 
 分析2：
 不断剪枝，当剪枝前有，剪枝后没有 某个 node 说明剪之前的 node 为公共节点
 
 */

class LowestCommonAncestor {
  func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    if root === p || root === q { return root }

    guard let p = p else { return q }
    guard let q = q else { return p }
    
    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)
    if left == nil { return right }
    if right == nil { return left }
    return root
  }
}

extension LowestCommonAncestor: Algorithm {
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
