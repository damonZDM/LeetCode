//
//  TreeNode.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/7.
//

import Foundation

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == lhs.right
    }
}
