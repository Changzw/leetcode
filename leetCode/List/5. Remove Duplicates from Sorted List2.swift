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
 
 分析:
 使用hash map 缓存处理
 
 1. 遍历两边
 2. 第一遍 标记缓存
 3. 第二遍 遍历所有，如果个数超过 2 就跳过
 */
class RemoveDuplicatesfromSortedList2 {
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var map: [Int: Int] = [:]
    var cur = head
    while cur != nil {
      if map[cur!.val] != nil {
        map[cur!.val]! += 1
      }else {
        map[cur!.val] = 1
      }
      cur = cur?.next
    }
    
    var head_ = head
    while head_ != nil && map[head_!.val]! != 1 {
      head_ = head_?.next
    }
    
    var prev = head_
    cur = prev?.next
    while prev != nil && cur != nil {
      if map[cur!.val]! > 1 {
        cur = cur?.next
        prev?.next = cur
      }else {
        cur = cur?.next
        prev = prev?.next
      }
    }
    
    return head_
  }
  
  func deleteDuplicates_(_ head: ListNode?) -> ListNode? {
    let top = ListNode(0)
    top.next = head
    var prev = top
    var current = head
    while let cur = current, var next = cur.next {
      if cur.val == next.val{
        while let end = next.next{ //求出next指向最后一个相等的
          if cur.val == end.val {
            next = end
          }else{
            break
          }
        }
        prev.next = next.next
        current = next.next
      }else{
        prev = cur
        current = next
      }
    }
    return top.next
  }
}

extension RemoveDuplicatesfromSortedList2: Algorithm {
  func doTest() {
    let l1 = ListNode(1)
    var p = l1
    [1].forEach { (i) in
      p.next = ListNode(i)
      p = p.next!
    }
    p.next = nil
    performLogCostTime(self.name) {
      print(deleteDuplicates_(l1))
    }
  }
}
