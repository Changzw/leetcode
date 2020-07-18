//
//  StringIndex+extension.swift
//  leetCode
//
//  Created by czw on 1/19/20.
//  Copyright © 2020 czw. All rights reserved.
//

import Foundation

extension String {
  func intIndex(index: String.Index?) -> Int {
    guard let index = index else { return -1 }
    return distance(from: startIndex, to: index)
  }
}
