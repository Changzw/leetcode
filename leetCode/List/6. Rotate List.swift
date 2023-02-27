//
//  6. Rotate List.swift
//  leetCode
//
//  Created by czw on 7/22/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 Given a linked list, rotate the list to the right by k places,
 where k is non-negative.
 
 Example 1:
 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:
 
 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
 
 分析：
 k 次，每一次都是把最后一个元素放到最前面
 last.next = head
 last.prev = nil
 可是以每一 prev 都需要重新遍历一遍才能有结果
 
 把图画出来，如果把 last.next = head,成一个环
 cur = head
 prev = last
 然后逆时针走 k 步后，逆时针不了就顺时针 走 n - k
 prev.next = nil
 return cur
 */

class RotateList {
  func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    // 成环
    var count = 0
    var prev = head
    var cur = head
    while prev?.next != nil {
      prev = prev?.next
      count += 1
    }
    count += 1
    prev?.next = cur

    var times = count
    let step = k % count
    while times - step > 0 {
      cur = cur?.next
      prev = prev?.next
      times -= 1
    }
    
    //拆环
    prev?.next = nil
    return cur
  }
}

extension RotateList: Algorithm {
  
  func doTest() {
    var p: ListNode? = nil
    var l1: ListNode!
    [1,2,3,4,5]
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
      print(rotateRight(l1, 2))
    }
  }
}
