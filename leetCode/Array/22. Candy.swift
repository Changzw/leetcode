//
//  22. Candy.swift
//  leetCode
//
//  Created by czw on 7/21/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

/*
 hard
 
 老师想给孩子们分发糖果，有 N 个孩子站成了一条直线，
 老师会根据每个孩子的表现，预先给他们评分。
 你需要按照以下要求，帮助老师给这些孩子分发糖果：
 
 每个孩子至少分配到 1 个糖果。
 相邻的孩子中，评分高的孩子必须获得更多的糖果。
 那么这样下来，老师至少需要准备多少颗糖果呢？
 
 示例 1:
 输入: [1,0,2]
 输出: 5
 解释: 你可以分别给这三个孩子分发 2、1、2 颗糖果。
 
 示例 2:
 输入: [1,2,2]
 输出: 4
 解释: 你可以分别给这三个孩子分发 1、2、1 颗糖果。
 第三个孩子只得到 1 颗糖果，这已满足上述两个条件。
 
 分析：
 类似收集雨水的问题，收集雨水是要找到 maxIndex
 该题是要找到 minIndex，然后沿着
 */

class Candy {
  func candy(_ ratings: [Int]) -> Int {
    
    return 0
  }
}

extension Candy: Algorithm {
  func doTest() {
    performLogCostTime(self.name + " method1") {
      print()
    }
  }
}
