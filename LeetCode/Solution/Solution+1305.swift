//
//  Solution+1305.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/1.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

extension Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        func getAllElements(_ node: TreeNode?) -> [Int] {
            guard let node = node else {
                return []
            }
            return getAllElements(node.left) + [node.val] + getAllElements(node.right)
        }
        
        let nums1 = getAllElements(root1)
        let nums2 = getAllElements(root2)
        var result = [Int]()
        var i = 0
        var j = 0
        while i < nums1.count || j < nums2.count {
            if i >= nums1.count {
                result.append(nums2[j])
                j += 1
                continue
            }
            if j >= nums2.count {
                result.append(nums1[i])
                i += 1
                continue
            }
            if nums1[i] > nums2[j] {
                result.append(nums2[j])
                j += 1
            } else {
                result.append(nums1[i])
                i += 1
            }
        }
        return result
    }
}
