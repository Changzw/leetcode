//
//  4. Remove Duplicates from Sorted List.swift
//  leetCode
//
//  Created by czw on 7/21/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 输入: 1->1->2
 输出: 1->2
 示例 2:
 输入: 1->1->2->3->3
 输出: 1->2->3
 
 分析：
 遍历链表，使用一个 set 保存元素
 如果有就跳过
 
 因为是有序的。所以可以不需要set ，跳跃节点就好
 
 */
class RemoveDuplicatesfromSortedList {
  func deleteDuplicates_(_ head: ListNode?) -> ListNode? {
    var cur = head
    while cur != nil {
      if cur?.val == cur?.next?.val {
        cur?.next = cur?.next?.next
      }else {
        cur = cur?.next
      }
    }
    
    return head
  }
  
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head?.next == nil { return head }
    var set = Set<Int>()
    
    var prev = head
    var cur = head?.next
    set.insert(prev!.val)
    while cur != nil {
      if !set.contains(cur!.val) {
        set.insert(cur!.val)
        prev = prev?.next
      }else {// jump
        prev?.next = cur?.next
      }
      
      cur = cur?.next
    }
    
    return head
  }
}

extension RemoveDuplicatesfromSortedList: Algorithm {
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
      print(deleteDuplicates_(l1)!)
    }
  }
}
