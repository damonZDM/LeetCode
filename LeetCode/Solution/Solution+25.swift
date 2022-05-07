//
//  Solution+25.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/1.
//

import Foundation

extension Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var nodesHead: ListNode?
        var node = head
        var nodes: [ListNode] = []
        var previousNode: ListNode?
        while let n = node {
            nodes.append(n)
            node = n.next
            if nodes.count == k {
                nodes = nodes.reversed()
                if nodesHead == nil {
                    nodesHead = nodes.first
                }
                previousNode?.next = nodes.first
                for i in 0..<k-1 {
                    nodes[i].next = nodes[i + 1]
                }
                previousNode = nodes[k - 1]
                nodes.removeAll()
            }
        }
        previousNode?.next = nodes.first
        return nodesHead
    }
}
