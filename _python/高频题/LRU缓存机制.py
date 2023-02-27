
"""
https://leetcode.cn/problems/lru-cache/
为什么要用双向链表做缓存，单链表不行吗？
因为LRU 有压栈出栈的过程，push 的时候需要next 指针，pop 的时候用到 previous指针
使用 单链表找不 previous
"""

class Node:
  def __init__(self, value, previous=None, next=None):
    self.value = value
    self.previous = previous
    self.next = next

class DoubleLinkList:
  def __init__(self):
    self.first = None
    self.last = None
    self.count = 0

  def add(self, node):
    if not self.last:
      self.last = node
      self.first = node
    else:
      self.last.next = node
      node.previous = self.last
    self.count += 1

  def remove(self, node):
    if node.previous and node.previous.next:
        node.previous.next = node.next
    if node.next and node.next.previous:
      node.next.previous = node.previous
    if node == self.last:
      self.last = node.previous
    if node == self.first:
      self.first = node.next
    node.next = None
    node.previous = None
    self.count -= 1

def remove_last() -> int:
  return 0

class LRUCache:
  def __init__(self, capacity):
    self.capacity = capacity
    self.mapping = {}# value: node
    self.list = DoubleLinkList()

  def get(self, key: int) -> int:
    if key in self.mapping:
      node = self.mapping[key]
      self.list.remove(node)
      self.list.add(node)
      return node.value
    else:
      return -1

  def put(self, key: int, value: int) -> None:
    if self.capacity == self.list.count:
      key_ = self.list.remove_last()
      self.mapping.pop(key_)
    if key in self.mapping:
      self.list.remove(self.mapping[key])
    node = Node(value)
    self.mapping[key] = node
    self.list.add(node)

lRUCache = LRUCache(2)
lRUCache.put(1, 1)
lRUCache.put(2, 2)
print(lRUCache.get(1))
lRUCache.put(3, 3)
print(lRUCache.get(2))
lRUCache.put(4, 4)
print(lRUCache.get(1))
print(lRUCache.get(3))
print(lRUCache.get(4))
