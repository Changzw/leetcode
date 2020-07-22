//
//  8. Swap Nodes in Pairs.swift
//  leetCode
//
//  Created by czw on 7/22/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
 示例:
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 
 分析：
 n1, n2, 最为替换节点 other 用于保存后面的list
 prev 保存交换后后面的节点
 
 n1 = head
 n2 = head.next
 other = n2.next
 n2.next = n1
 
 */
class SwapNodesInPairs {
  func swapPairs(_ head: ListNode?) -> ListNode? {
    if head?.next == nil { return head }
    
    let dummy = ListNode(0)
    var n1 = head
    var n2 = head?.next
    
    var other = n2?.next
    var prev: ListNode? = dummy
    
    
    while n2 != nil && n1 != nil {
      prev?.next = n2
      n2?.next = n1
      n1?.next = other
      
      prev = n1
      n1 = other
      n2 = n1?.next
      other = n2?.next
    }
    
    return dummy.next
  }
}

extension SwapNodesInPairs: Algorithm {
  func doTest() {
    var p: ListNode? = nil
    var l1: ListNode!
    [1]
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
      print(swapPairs(l1))
    }
  }
}

