//
//  Solution+Other.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/7.
//

import Foundation

extension Solution {
    
    /**
     面试题 04.03. 特定深度节点链表
     [LeetCode](https://leetcode-cn.com/problems/list-of-depth-lcci/)
     */
    func listOfDepth(_ tree: TreeNode?) -> [ListNode?] {
        guard let tree = tree else {
            return []
        }
        var subs: [TreeNode] = [tree]
        var nodes: [ListNode?] = []
        while !subs.isEmpty {
            var listNodeHead: ListNode?
            var listNodeTail: ListNode?
            for node in subs {
                if listNodeHead == nil {
                    listNodeHead = ListNode(node.val)
                    listNodeTail = listNodeHead
                } else {
                    let newNode = ListNode(node.val)
                    listNodeTail?.next = newNode
                    listNodeTail = newNode
                }
            }
            nodes.append(listNodeHead)
            
            var newTreeNodes: [TreeNode] = []
            for node in subs {
                if let left = node.left {
                    newTreeNodes.append(left)
                }
                if let right = node.right {
                    newTreeNodes.append(right)
                }
            }
            subs = newTreeNodes
        }
        return nodes
    }
}
