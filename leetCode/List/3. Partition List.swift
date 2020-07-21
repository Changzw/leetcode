//
//  3. Partition List.swift
//  leetCode
//
//  Created by czw on 7/21/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 给定一个链表和一个特定值 x，对链表进行分隔，
 使得所有小于 x 的节点都在大于或等于 x 的节点之前。
 你应当保留两个分区中每个节点的初始相对位置。
 
 示例:
 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5
 
 分析：
 两个链 left， right
 小于 x 的放在left 上，大于 x 放在 right
 记录 headL， headR
 */

class PartitionList {
  func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    var headL: ListNode?
    var headR: ListNode?
    var curL: ListNode?
    var curR: ListNode?
    
    var cur = head
    var res: ListNode?
    while cur != nil {
      if let v = cur?.val {
        if v < x {
          if headL == nil {
            headL = cur
            curL = cur
          }else {
            curL?.next = cur
            curL = cur
          }
        }else{
          if headR == nil {
            headR = cur
            curR = cur
          }else {
            curR?.next = cur
            curR = cur
          }
        }
      }
      cur = cur?.next
    }
    
    curL?.next = headR
    curR?.next = nil
    
    res = headL != nil ? headL : headR
    return res
  }
}

extension PartitionList: Algorithm {
  
  func doTest() {

    performLogCostTime(self.name) {
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
      
      performLogCostTime(self.name + " method1") {
        let a = ListNode(1)
        print(partition(a, 0)!)
      }
    }

  }
}
