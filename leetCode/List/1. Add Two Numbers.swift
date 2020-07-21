//
//  main.swift
//  Add Two Numbers
//
//  Created by czw on 11/20/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

/*
 给出两个 非空 的链表用来表示两个非负的整数。
 其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */
public class ListNode: CustomStringConvertible {
  public var val: Int
  public var next: ListNode?
  
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
  
  public var description: String{
    var node = self
    var value = ""
    
    repeat {
      value = String(node.val) + value
      if node.next == nil {
        break
      }
      node = node.next!
    } while true
    
    return String(value.reversed())
  }
}

class AddTwoNumbers {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil { return nil }
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    let dummyHead = ListNode(0)
    var curr = dummyHead
    var l1_ = l1
    var l2_ = l2
    
    var carry = 0
    while l1_ != nil || l2_ != nil {
      let x = (l1_ != nil) ? l1_!.val : 0
      let y = (l2_ != nil) ? l2_!.val : 0
      let sum = carry + x + y
      carry = sum / 10
      curr.next = ListNode(sum % 10)
      curr = curr.next!
      
      if l1_ != nil { l1_ = l1_!.next }
      if l2_ != nil { l2_ = l2_!.next }
    }
    
    if (carry > 0) {
      curr.next = ListNode(carry);
    }
    return dummyHead.next
  }
  
  func addTwoNumbers_(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
    let sum = l1!.val + l2!.val + carry
    let nextCarry = sum / 10
    
    let node = ListNode(sum % 10)
    if l1?.next != nil || l2?.next != nil || nextCarry != 0 {
      if l1?.next == nil {
        l1!.next = ListNode(0)
      }
      if l2?.next == nil {
        l2!.next = ListNode(0)
      }
      
      node.next = addTwoNumbers_(l1!.next, l2!.next, nextCarry)
    }
    
    return node
  }
}

extension AddTwoNumbers: Algorithm{
  var name: String {
    return "AddTwoNumbers"
  }
  
  func doTest() {
    var idx = 0
    let conun1 = 7
    let count2 = 8
    
    let l1 = ListNode(2)
    var p1 = l1
    while idx < conun1 {
      p1.next = ListNode(Int.random(in: 0...9))
      p1 = p1.next!
      idx += 1
    }
    p1.next = nil
    print(l1)
    
    idx = 0
    let l2 = ListNode(4)
    var p2 = l2
    while idx < count2 {
      p2.next =  ListNode(Int.random(in: 0...9))
      p2 = p2.next!
      idx += 1
    }
    p2.next = nil
    print(l2)
    
    print("start......")
    
    performLogCostTime(self.name + "method1") {
      let l = self.addTwoNumbers_(l1, l2, 0)
      print(l!)
    }
    
    performLogCostTime(self.name + "method2") {
      let l = self.addTwoNumbers(l1, l2)
      print(l!)
    }
  }
}

