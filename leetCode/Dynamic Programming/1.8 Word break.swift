//
//  1.8 Word break.swift
//  leetCode
//
//  Created by czw on 8/2/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/word-break/
 难度：中等
 给定一个非空字符串 s 和一个包含非空单词列表的字典 wordDict，
 判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。
 
 说明：
 拆分时可以重复使用字典中的单词。
 你可以假设字典中没有重复的单词。
 
 示例 1：
   输入: s = "leetcode", wordDict = ["leet", "code"]
   输出: true
   解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。
 示例 2：
   输入: s = "applepenapple", wordDict = ["apple", "pen"]
   输出: true
   解释: 返回 true 因为 "applepenapple" 可以被拆分成 "apple pen apple"。
             注意你可以重复使用字典中的单词。
 示例 3：
 输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 输出: false
 
 分析：
 将 wordDict 数组存到字典中 key 是每个数组中的值
 loop s, 在 字典中查，如果存在 则返回
 1. 逐一遍历 s,放在 wordDict 中判断
    true 换一个 start 继续跑
    false 遍历 j
 2. 终止条件，start == s.count // 说明之前的子串都是存在的
 
这道题不应该用自顶向下的思考方式来解
 
 */

class WordBreak {
  
  func wordBreak0(_ s: String, _ wordDict: [String]) -> Bool {
    let set = Set(wordDict)
    
    func checkWord(_ s: String, _ set: Set<String>, _ start: Int) -> Bool {
      if start == s.count { return true }// start
      for end in start+1..<s.count {
        let si = s.index(s.startIndex, offsetBy: start)
        let ei = s.index(s.startIndex, offsetBy: end)
        if set.contains(String(s[si...ei])) && checkWord(s, set, end) {
          return true
        }
      }
      return false
    }
    return checkWord(s, set, 0)
  }

  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let set = Set(wordDict)
    var dp = [Bool](repeating: false, count: s.count + 1)
    dp[0] = true
    
    for i in 1...s.count {
      for j in (0...i-1) {
        let ii = s.index(s.startIndex, offsetBy: i)
        let ji = s.index(s.startIndex, offsetBy: j)
        if dp[j] && set.contains(String(s[ji..<ii])) {
          dp[i] = true
        }
      }
    }
    return dp.last!
  }
}

extension WordBreak: Algorithm {
  func doTest() {
    performLogCostTime(self.name+" method") {
      print(wordBreak("leetappleapplecode", ["leet","code","apple"]))
    }
    performLogCostTime(self.name+" method0") {
      print(wordBreak0("leetappleapplecode", ["leet","code","apple"]))
    }

  }
}
