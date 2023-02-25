
# https://leetcode.cn/problems/reverse-integer/
"""
示例 1：

输入：x = 123
输出：321
示例 2：

输入：x = -123
输出：-321
示例 3：

输入：x = 120
输出：21
示例 4：

输入：x = 0
输出：0
"""
class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        if x == 0:
          return x
        negative = True if x < 0 else False

        res = 0
        min_ = -pow(2, 31)
        max_ = pow(2,31) - 1
        reminder = abs(x)
        while reminder:
          if res < min_ or res > max_:
            return 0
          res *= 10
          res += reminder % 10
          reminder //= 10
        return res * (-1 if negative else 1)

class Solution_(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        # 数学
        INT_MIN, INT_MAX = -2**31, 2**31 - 1
        rev = 0
        while x != 0:
            if rev < INT_MIN // 10 + 1 or rev > INT_MAX // 10:
                return 0
            digit = x % 10
            # Python3 的取模运算在 X 为负数时也会返回[0, 9)以内的结果, 因此这里需要特殊判断
            if x < 0 and digit > 0:
                digit -= 10
            # 同理, 整数除法在 X 为负数时会向下取整, 因此不能写成 x //= 10
            x = (x - digit) // 10
            rev = rev * 10 + digit
        return rev

s = Solution()
print(s.reverse(123))
