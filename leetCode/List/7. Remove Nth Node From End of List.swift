//
//  7. Remove Nth Node From End of List.swift
//  leetCode
//
//  Created by czw on 7/22/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 示例：
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 
 说明： 给定的 n 保证是有效的。
 
 进阶：
 你能尝试使用一趟扫描实现吗？
 
 分析：
 快慢指针，要删除 倒数第 n 个节点
 那么 得到 倒数 n+1 节点p然后 p.next = p.next.next 就可以删除
 */
class RemoveNthNodeFromEndofList {
//  失败案例
//  输入: [1] 1
//  输出 [1]
//  预期结果 []
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var slow = head
    var fast = head
    
    var step = 0
    while fast != nil {
      fast = fast?.next
      if step >= n {
        slow = slow?.next
      }
      step += 1
    }
    
    slow?.next = slow?.next?.next
    
    return head
  }
  
  // 正确
  func removeNthFromEnd_(_ head: ListNode?, _ n: Int) -> ListNode? {
    var slow = head
    var fast = head
    
    var step = n
    while fast != nil {
      fast = fast?.next
      if step < 0 {
        slow = slow?.next
      }
      step -= 1
    }
    
    if step == 0 { return head?.next }
    slow?.next = slow?.next?.next
    return head
  }
  
  func removeNthFromEnd__(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy: ListNode? = ListNode(0)
    dummy?.next = head
    
    var low = dummy
    var high = dummy
    
    [0..<n].forEach { _ in
      high = high?.next
    }

    while high?.next != nil {
      low = low?.next
      high = high?.next
    }
    
    low?.next = low?.next?.next
    return dummy?.next
  }
}

extension RemoveNthNodeFromEndofList: Algorithm {
  
  func doTest() {
    var p: ListNode? = nil
    var l1: ListNode!
    [1,2]
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
      print(removeNthFromEnd(l1, 1))
    }
  }
}
