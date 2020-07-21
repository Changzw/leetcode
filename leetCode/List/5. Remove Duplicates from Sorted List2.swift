//
//  5. Remove Duplicates from Sorted List.swift
//  leetCode
//
//  Created by czw on 7/21/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。
 
 示例 1:
 输入: 1->2->3->3->4->4->5
 输出: 1->2->5
 示例 2:
 
 输入: 1->1->1->2->3
 输出: 2->3
 */
class RemoveDuplicatesfromSortedList2 {
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var prev = head
    var cur = head.next
    
    while cur != nil {
      
    }
    return head
  }
}

extension RemoveDuplicatesfromSortedList2: Algorithm {
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
    
    performLogCostTime(self.name) {
      print(deleteDuplicates(l1)!)
    }
  }
}
