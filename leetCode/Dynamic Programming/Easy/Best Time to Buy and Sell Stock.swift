//
//  Best Time to Buy and Sell Stock.swift
//  leetCode
//
//  Created by czw on 12/18/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation
//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
/*
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction
 (i.e., buy one and sell one share of the stock),
 design an algorithm to find the maximum profit.
 
 Note that you cannot sell a stock before you buy one.
 
 Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Not 7-1 = 6, as selling price needs to be larger than buying price.
 Example 2:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 */

class BestTimetoBuyandSellStock {
// thinking: get the solution of max(back - previous)
// brutal
  func maxProfit0(_ prices: [Int]) -> Int {
    var i = 0
    var currentMax = 0
    
    while i < prices.count {
      var j = i + 1
      while j < prices.count {
        let v = prices[j] - prices[i]
        if v > currentMax {
          currentMax = v
        }
        j += 1
      }
      
      i += 1
    }
    
    return currentMax
  }
  
//右边的元素 - 左边最小元素 得到的解
  func maxProfit1(_ prices: [Int]) -> Int {
    var i = 0
    var minPrice = Int.max
    var currentMax = 0
    while i < prices.count {
      if prices[i] < minPrice {
        minPrice = prices[i]
      }else {
        let v = prices[i] - minPrice
        if v > currentMax {
          currentMax = v
        }
      }
      
      i += 1
    }
    
    return currentMax
  }
  
}

extension BestTimetoBuyandSellStock: Algorithm {
  var name: String{
    return "Best Time to Buy and Sell Stock"
  }
  
  func doTest() {
    performLogCostTime(self.name) {
      print(maxProfit1([7,1,5,3,6,4]))
    }
  }
}
