//
//  main.swift
//  Add Two Numbers
//
//  Created by czw on 11/20/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

//Definition for singly-linked list.
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
    
    return value
  }
}

class AddTwoNumbers {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard
      var l1_ = l1,
      var l2_ = l2
    else { return nil }
    
    if l1 == nil && l2 == nil {
      return nil
    }
    if l1 == nil {
      return l2
    }
    if l2 == nil {
      return l1
    }
    
    var fowardOne = false
    
    repeat {
      l1_.val = l1_.val + l2_.val + (fowardOne ? 1 : 0)
      
      if l1_.val >= 10 {
        l1_.val = l1_.val % 10
        fowardOne = true
      }else {
        fowardOne = false
      }
      
      guard
        let next1 = l1_.next,
        let next2 = l2_.next else {
          break
      }
      l1_ = next1
      l2_ = next2
      
    } while true

    if l1_.next == nil {
      l1_.next = l2_.next
    }
      
    while fowardOne {
      var node = l1_.next
      if node == nil {
        node = ListNode(1)
        l1_.next = node
        fowardOne = false
      }else {
        node!.val = node!.val + 1
        if node!.val >= 10 {
          node!.val = node!.val % 10
          fowardOne = true
          if l1_.next != nil {
            l1_ = l1_.next!
          }
        }else {
          fowardOne = false
        }
      }
      
    }
    
    return l1
  }
  
  func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil {
      return nil
    }
    if l1 == nil {
      return l2
    }
    if l2 == nil {
      return l1
    }
    
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
      if l1_ != nil {
        l1_ = l1_!.next
      }
      if l2_ != nil {
        l2_ = l2_!.next
      }
    }
    
    if (carry > 0) {
      curr.next = ListNode(carry);
    }
    return dummyHead.next
  }
  
  func addTwoNumbers3(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
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
      
      node.next = addTwoNumbers3(l1!.next, l2!.next, nextCarry)
    }
    
    return node
  }
}

extension AddTwoNumbers: Algorithm{
  var name: String {
    return "AddTwoNumbers"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      let l1 = ListNode(2)
      l1.next = ListNode(4)
      l1.next!.next = ListNode(3)
      print(l1)
      
      let l2 = ListNode(4)
      l2.next = ListNode(6)
      l2.next!.next = ListNode(5)
      
      print(l2)
      let l = self.addTwoNumbers3(l1, l2, 0)
      print(l!)
    }
  }
}

