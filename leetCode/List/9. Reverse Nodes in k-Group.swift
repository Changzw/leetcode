//
//  9. Reverse Nodes in k-Group.swift
//  leetCode
//
//  Created by czw on 7/22/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation
/*
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 k 是一个正整数，它的值小于或等于链表的长度。
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 
 示例：
 给你这个链表：1->2->3->4->5
 当 k = 2 时，应当返回: 2->1->4->3->5
 当 k = 3 时，应当返回: 3->2->1->4->5
 
 说明：
 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 */
class ReverseNodesInk_Group {
  func reverseList(_ head: ListNode) -> (ListNode, ListNode?)? {
    let dummy = ListNode(0)
    dummy.next = head
    
    var cur: ListNode? = head
    var other = cur?.next
    if other == nil { return (head, nil) }
    
    var n: ListNode!
    while cur != nil {
      other = other?.next
      dummy.next = cur
      if cur?.next == nil {
        n = cur
      }
      cur = cur?.next
      cur?.next = other
    }
    
    return (n, head)
  }
  
  func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode? = dummy
    var fast = head
    var slow = head
    
    var other: ListNode?  = nil
    var step = k
    
    while fast != nil {
      while step > 0 {
        fast = fast?.next
        step -= 1
      }
      other = fast?.next
      fast?.next = nil
      
      let nodes = reverseList(slow!)
      
      prev?.next = nodes?.0
      prev = prev?.next
      
      if let n = nodes?.1 {
        n.next = other
      }else {
        nodes?.0.next = other
      }
      
      slow = other
      fast = other
    }
    
    return dummy.next
  }
}

extension ReverseNodesInk_Group: Algorithm {
  func doTest() {
    var p: ListNode? = nil
    var l1: ListNode!
    [1,2,3,4,5,6,7,8]
      .forEach { (i) in
        if p == nil {
          p = ListNode(i)
          l1 = p
        }else {
          p?.next = ListNode(i)
          p = p?.next
        }
    }
    p?.next = nil
    
    performLogCostTime(self.name) {
      print(reverseKGroup(l1, 3))
    }
  }
}
