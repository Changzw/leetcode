//
//  2. Reverse Linked List II.swift
//  leetCode
//
//  Created by czw on 7/21/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 说明:
 1 ≤ m ≤ n ≤ 链表长度。
 
 示例:
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 */
class ReverseLinkedList2 {
  func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    
    var cur = head
    
    var idx = 1
    while idx < m - 1 {
      cur = cur?.next
      idx += 1
    }
    
    let left = cur
    var m = cur?.next
    var cur2 = m?.next
    m?.next = nil

    let m_ = m
    while idx < n - 1 {
      let right = cur2?.next
      left?.next = cur2
      cur2?.next = m
      
      m = left?.next
      cur2 = right
      idx += 1
    }
    
    m_?.next = cur2
    return head
  }
  
  func reverseBetween__(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    
    var pre: ListNode? = dummy
    stride(from: 0, to: m-1, by: 1).forEach{ _ in pre = pre?.next }
    
// reverse
    let cur = pre?.next
    stride(from: m, to: n, by: 1).forEach { _ in
      let next = cur?.next
      cur?.next = next?.next
      next?.next = pre?.next
      pre?.next = next
    }
    return dummy.next
  }
  
  func reverseBetween_(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    
    return nil
  }
}

extension ReverseLinkedList2: Algorithm {
  func doTest() {
    var idx = 0
    let conun = 1
    
    let l1 = ListNode(Int.random(in: 0...9))
    var p1 = l1
    while idx < conun {
      p1.next = ListNode(Int.random(in: 0...9))
      p1 = p1.next!
      idx += 1
    }
    p1.next = nil
    print(l1)
    
    performLogCostTime(self.name + " method1") {
      print(reverseBetween(l1, 1, 2)!)
    }
    
    performLogCostTime(self.name + " method2") {
      
    }
  }
}

/*
 反转一个单链表。
 示例:
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */
class ReverseLinkedList {
  func reverseList(_ head: ListNode?) -> ListNode? {
    if head?.next == nil { return head }
    
    var prev: ListNode? = nil
    var cur = head
    while cur != nil {
      let nextList = cur?.next
      cur?.next = prev
      prev = cur
      cur = nextList
    }
    
    return prev
  }
  
  func reverseList_(_ head: ListNode?) -> ListNode? {
    if head?.next == nil { return head }
    let p = reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    return p
  }
}

extension ReverseLinkedList: Algorithm {
  func doTest() {
    var idx = 0
    let conun = 7

    let l1 = ListNode(Int.random(in: 0...9))
    var p1 = l1
    while idx < conun {
      p1.next = ListNode(Int.random(in: 0...9))
      p1 = p1.next!
      idx += 1
    }
    p1.next = nil
    print(l1)
    
    var l2: ListNode?
    performLogCostTime(self.name + " method1") {
      l2 = reverseList(l1)
      print(l2)
    }
    let l3 = reverseList(l2)
    performLogCostTime(self.name + " method2") {
      print(reverseList_(l3))
    }
  }
}

