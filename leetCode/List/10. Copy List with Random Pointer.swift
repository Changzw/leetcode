//
//  10. Copy List with Random Pointer.swift
//  leetCode
//
//  Created by czw on 7/29/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

public class Node {
  public var val: Int
  public var next: Node?
  public var random: Node?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
    self.random = nil
  }
}

/*
 https://leetcode-cn.com/problems/copy-list-with-random-pointer/
 难度：中等
 
 给定一个链表，每个节点包含一个额外增加的随机指针，该指针可以指向链表中的任何节点或空节点。
 要求返回这个链表的 深拷贝。
 我们用一个由 n 个节点组成的链表来表示输入/输出中的链表。每个节点用一个 [val, random_index] 表示：
 val：一个表示 Node.val 的整数。
 random_index：随机指针指向的节点索引（范围从 0 到 n-1）；如果不指向任何节点，则为  null 。
 
 示例 1：
 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
 
 示例 2：
 输入：head = [[1,1],[2,1]]
 输出：[[1,1],[2,1]]
 
 示例 3：
 输入：head = [[3,null],[3,0],[3,null]]
 输出：[[3,null],[3,0],[3,null]]
 
 示例 4：
 输入：head = []
 输出：[]
 解释：给定的链表为空（空指针），因此返回 null。
 
 提示：
 -10000 <= Node.val <= 10000
 Node.random 为空（null）或指向链表中的节点。
 节点数目不超过 1000 。
 
 
 分析：
 要做深 copy，node(val, next) 在一次循环过程都可以处理好，可是 random 必须所有元素位置清楚以后才能处理
 循环两次
 1. 第一次把 list 成链，把新创建的 random 用数组指针保存
 2. 第二次，list 中的list 根据数组下表把 random 放进list 中
 */
class CopyListwithRandomPointer {
  func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }
    
    let head_ = Node(head.val)
    var trace: Node? = head_
    var cur = head.next
    
    var random: [Node?] = [trace]
    var i = 1
    
    while let current = cur {
      // new
      let node = Node(current.val)
      random[i] = node
      trace?.next = node
      trace = trace?.next
      
      // old
      cur = cur?.next
      i += 1
    }
    trace?.next = nil
    random[i] = nil
    
    cur = head
    trace = head_
    
    i = 0
    while let current = cur {
      if let v = current.random?.val {
        trace?.random = random[v]
      }else {
        trace?.random = nil
      }
      trace = trace?.next
      cur = cur?.next
    }
    
    return head_
  }
}

extension CopyListwithRandomPointer: Algorithm {
  func doTest() {

    let l = Node(7)
    var cur = l
    
    performLogCostTime(self.name + "method1") {
      
    }
  }
}

