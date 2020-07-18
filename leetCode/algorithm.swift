//
//  algorithm.swift
//  leetCode
//
//  Created by czw on 12/2/19.
//  Copyright © 2019 czw. All rights reserved.
//

import Foundation

protocol Algorithm {
  var name: String { get }
//  var isOpen = false
  func doTest()
}

extension Algorithm {
  var name: String { String(describing: Self.self) }
  
}
