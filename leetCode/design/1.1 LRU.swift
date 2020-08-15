//
//  1.1 LRU.swift
//  leetCode
//
//  Created by czw on 8/9/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/lru-cache/
 中等
 
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
 获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。
 当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
 
 进阶:
 你是否可以在 O(1) 时间复杂度内完成这两种操作？
 示例:
 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得关键字 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得关键字 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4
 */

class LRUCache {
  class Node: Equatable, CustomStringConvertible {
    var val: Int?
    var key: Int?
    var prev: Node?
    var next: Node?
    
    static func == (lhs: Node, rhs: Node) -> Bool {
      return lhs.val == rhs.val
    }
    
    var description: String {
      if let _ = key,
        let v = val{
        return "\(v) "
      }else {
        return "head-tail"
      }
    }
  }
  
  var map: [Int: Node]!
  let head = Node()
  let tail = Node()
  let capacity: Int
  
  init(_ capacity: Int) {
    self.capacity = capacity
    map = [Int: Node].init(minimumCapacity: capacity)
    head.next = tail
    tail.prev = head
  }
  
  private func moveToHead(_ n: Node) {
    n.prev?.next = n.next
    n.next?.prev = n.prev
    
    n.next = head.next
    head.next = n
    n.next?.prev = n
    n.prev = head
  }
  
  private func deleteNode(_ n: Node){
    n.prev?.next = n.next
    n.next?.prev = n.prev
    n.prev = nil; n.next = nil
  }
  
  private func addNodeToCache(_ n: Node) {
    map[n.key!] = n
    moveToHead(n)
    
    if map.count > capacity {// 超出缓存拿走
      if let n = tail.prev,
        let k = n.key {
        map.removeValue(forKey: k)
        deleteNode(n)
      }
    }
  }
  
  func get(_ key: Int) -> Int {
    if let n = map[key] {
      moveToHead(n)
      return n.val!
    }else {
      return -1
    }
  }
  
  func put(_ key: Int, _ value: Int) {
    if let n = map[key] { // update value
      n.val = value
      moveToHead(n)
    } else {
      let n = Node()
      n.key = key
      n.val = value
      addNodeToCache(n)
    }
  }
}


extension LRUCache: CustomStringConvertible {
  var description: String {
    var cur = head.next
    var res = ""
    while cur != nil {
      res += cur!.description
      cur = cur!.next
    }
    return res
  }
}

extension LRUCache: Algorithm {
  func doTest() {
    
    put(1, 1);
    put(2, 2);
    print( get(1))       // 返回  1
    put(3, 3);    // 该操作会使得关键字 2 作废
    print( get(2))       // 返回 -1 (未找到)
    put(4, 4);    // 该操作会使得关键字 1 作废
    print( get(1))       // 返回 -1 (未找到)
    print( get(3))       // 返回  3
    print( get(4))       // 返回  4
    
    performLogCostTime(self.name + "new") {
      print(self)
    }
  }

}
