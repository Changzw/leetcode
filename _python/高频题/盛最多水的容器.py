
"""
https://leetcode.cn/problems/container-with-most-water/solution/container-with-most-water-shuang-zhi-zhen-fa-yi-do/
双向指针
"""
class Solution(object):
    def __maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        area = 0
        for (i, x) in enumerate(height[0:-1]):
          for (j, y) in enumerate(height[i+1:], start=i+1):
            area = max(area, (j-i) * min(x, y))
        return area

    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        start = 0
        end = len(height)-1
        area = 0
        while start < end:
          cur_area = min(height[start], height[end]) * (end-start)
          area = max(area, cur_area)
          if height[start] >= height[end]:
            end -= 1
          else:
            start += 1
        return area

    def _maxArea(self, height) -> int:
        i, j, res = 0, len(height) - 1, 0
        while i < j:
            if height[i] < height[j]:
                res = max(res, height[i] * (j - i))
                i += 1
            else:
                res = max(res, height[j] * (j - i))
                j -= 1
        return res

# height = [1,8,6,2,5,4,8,3,7]
# print(height[0:-1])

s = Solution()
print(s._maxArea([1,8,6,2,5,4,8,3,7]))
