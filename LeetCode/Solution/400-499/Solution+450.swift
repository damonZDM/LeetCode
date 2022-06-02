//
//  Solution+450.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/2.
//

import Foundation

extension Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val > key {
            root.left = deleteNode(root.left, key)
            return root
        }
        if root.val < key {
            root.right = deleteNode(root.right, key)
            return root
        }
        if let left = root.left, let right = root.right {
            var minNode = right
            while let l = minNode.left {
                minNode = l
            }
            let node = TreeNode(minNode.val, left, deleteNode(right, minNode.val))
            return node
        } else if let left = root.left, root.right == nil {
            return left
        } else if let right = root.right, root.left == nil {
            return right
        } else {
            return nil
        }
    }
}
 
