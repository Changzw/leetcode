"""
https://leetcode.cn/problems/merge-sorted-array/
输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
输出：[1,2,2,3,5,6]
解释：需要合并 [1,2,3] 和 [2,5,6] 。
合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
"""

class Solution(object):
  def merge(self, nums1, m, nums2, n):
    """
    :type nums1: List[int]
    :type m: int
    :type nums2: List[int]
    :type n: int
    :rtype: None Do not return anything, modify nums1 in-place instead.
    """
    sub1 = nums1[0:m]
    sub2 = nums2

    i, j = 0, 0
    step = 0
    while i < m and j < n:
      x = sub1[i]
      y = sub2[j]
      if x < y:
        nums1[step] = x
        i += 1
      else:
        nums1[step] = y
        j += 1
      step += 1

    if i < m:
      nums1[step:] = sub1[i:]
    if j < n:
      nums1[step:] = sub2[j:]
    return nums1


  def _merge(self, nums1, m, nums2, n):
    """
    :type nums1: List[int]
    :type m: int
    :type nums2: List[int]
    :type n: int
    :rtype: None Do not return anything, modify nums1 in-place instead.
    """
    nums1[m:] = nums2
    nums1.sort()

  def __merge(self, nums1, m, nums2, n):
    """
    :type nums1: List[int]
    :type m: int
    :type nums2: List[int]
    :type n: int
    :rtype: None Do not return anything, modify nums1 in-place instead.
    """
    step = m + n
    i, j = m-1, n-1
    # 通解法一


s = Solution()
print(s.merge([1,2,3,0,0,0], 3, [2,5,6], 3))



