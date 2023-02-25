
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def __addTwoNumbers(self, l1, l2):
        if not l1:
            return l2
        if not l2:
            return l1

        l1.val += l2.val # 将两数相加，赋值给 l1 节点
        if l1.val >= 10:
            l1.next = self.addTwoNumbers(ListNode(l1.val // 10), l1.next)
            l1.val %= 10

        l1.next = self.addTwoNumbers(l1.next, l2.next)
        return l1
# [2]
# [5,1]
    def addTwoNumbers(self, l1, l2):
      head = ListNode(0)
      p_cur = head
      over1 = False
      while l1 or l2 or over1:
        sum = 0 + 1 if over1 else 0
        if l1:
          sum += l1.val
          l1 = l1.next
        if l2:
          sum += l2.val
          l2 = l2.next

        if sum < 10:
          over1 = False
        else:
          sum %= 10
          over1 = True
        p_cur.next = ListNode(sum)
        p_cur = p_cur.next

      return head.next

l1 = ListNode(2, ListNode(4, ListNode(3)))
l2 = ListNode(5, ListNode(6, ListNode(4)))

s = Solution()
s.addTwoNumbers(l1, l2)
