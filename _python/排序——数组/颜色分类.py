
"""
https://leetcode.cn/problems/sort-colors/
给定一个包含红色、白色和蓝色、共 n 个元素的数组 nums ，**原地对它们进行排序**，
使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
必须在不使用库内置的 sort 函数的情况下解决这个问题
输入：nums = [2,0,2,1,1,0]
输出：[0,0,1,1,2,2]
"""
class Solution(object):
  def sortColors(self, nums):
    """
    :type nums: List[int]
    :rtype: None Do not return anything, modify nums in-place instead.
    """
    x0, x1, x2 = 0, 0, 0
    for i, x in enumerate(nums):
      if x == 0:
        x0 += 1
      elif x == 1:
        x1 += 1
      elif x == 2:
        x2 += 1

    nums[:x0] = [0] * x0
    nums[x0:x0+x1] = [1] * x1
    nums[x0+x1:len(nums)] = [2] * x2

    print(nums)

  def _sortColors(self, nums) -> None:
    n = len(nums)
    p0 = p1 = 0
    for i in range(n):
      if nums[i] == 1:
        nums[i], nums[p1] = nums[p1], nums[i]
        p1 += 1
      elif nums[i] == 0:
        nums[i], nums[p0] = nums[p0], nums[i]
        if p0 < p1:
          nums[i], nums[p1] = nums[p1], nums[i]
        p0 += 1
        p1 += 1
    print(nums)

  def __sortColors(self, nums) -> None:
    n = len(nums)
    p0, p2 = 0, n - 1
    i = 0
    while i <= p2:
      while i <= p2 and nums[i] == 2:
        nums[i], nums[p2] = nums[p2], nums[i]
        p2 -= 1
      if nums[i] == 0:
        nums[i], nums[p0] = nums[p0], nums[i]
        p0 += 1
      i += 1

s = Solution()
s.__sortColors([2,0,2,1,1,0])

