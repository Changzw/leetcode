
"""
https://leetcode.cn/problems/longest-palindromic-substring/

"""
class Solution(object):
  def longestPalindrome(self, s):
    """
    :type s: str
    :rtype: str
    """
    if len(s) < 2: return s

    def validSubstring(str, left, right):
      i, j = left, right
      while i < j:
        if str[i] != str[j]: return False
        i += 1
        j -= 1
      return True

    maxLen, res = 0, ''
    for i in range(len(s)):
      for j in range(i+1, len(s)):
        if j - i < maxLen: continue
        if validSubstring(s, i, j):
          if j - i > maxLen:
            maxLen = j - i
            res = s[i:j+1]

    if maxLen == 0: res = s[0]
    return res

  def _longestPalindrome(self, s):
    def expandCenter(s, left, right):
      while left >= 0 and right < len(s) and s[left] == s[right]:
          left -= 1
          right += 1
      return left + 1, right - 1
    start, end = 0, 0

    for i in range(len(s)):
      left1, right1 = expandCenter(s, i, i)
      left2, right2 = expandCenter(s, i, i + 1)
      if right1 - left1 > end - start:
        start, end = left1, right1
      if right2 - left2 > end - start:
        start, end = left2, right2
    return s[start: end + 1]

  def _1longestPalindrome(self, s):
    """
    :type s: str
    :rtype: str
    """
    n=len(s)
    if n<2 or s==s[::-1]:
      return s
    res=s[0]
    maxlen=1
    for i in range(1, n):
      odd=s[i-maxlen-1:i+1]
      even=s[i-maxlen:i+1]
      if odd==odd[::-1] and i-maxlen-1>=0:
        res=odd
        maxlen+=2
      elif even==even[::-1] and i-maxlen>=0:
        res=even
        maxlen+=1
    return res
s = Solution()
print(s._1longestPalindrome("bab"))
