
"""
标签：哈希映射
这道题本身如果通过暴力遍历的话也是很容易解决的，时间复杂度在
利用哈希容器 map 降低时间复杂度
遍历数组 nums，i 为当前下标，每个值都判断map中是否存在 target-nums[i] 的 key 值
如果存在则找到了两个值，如果不存在则将当前的 (nums[i],i) 存入 map 中，继续遍历直到找到为止
"""
class Solution(object):
  #  o(n), o(1)
  def maxTwoSum(self, nums, target):
    count = len(nums)
    for i in range(count):
      for j in range(count-1):
        if nums[i] + nums[j] == target:
          return [i, j]
  # o(1), o(n)
  def twoSum(self, nums, target):
    """
    :type nums: List[int]
    :type target: int
    :rtype: List[int]

    使用字典 cache
      key: target - num[i]
      value: index

    if cache[target - num[i]]:
    """
    dic={}
    for i,x in enumerate(nums):
      cp = target -x #cp 值
      if cp in dic:
        return [dic[cp],i]
      else:
        dic[x]=i



s = Solution()
print(s.twoSum([3,4,5], 9))
