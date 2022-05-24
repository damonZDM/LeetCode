//
//  Node.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/20.
//

import Foundation

public class Node {
     public var val: Bool
     public var isLeaf: Bool
     public var topLeft: Node?
     public var topRight: Node?
     public var bottomLeft: Node?
     public var bottomRight: Node?
     public init(_ val: Bool, _ isLeaf: Bool) {
         self.val = val
         self.isLeaf = isLeaf
         self.topLeft = nil
         self.topRight = nil
         self.bottomLeft = nil
         self.bottomRight = nil
     }
}
