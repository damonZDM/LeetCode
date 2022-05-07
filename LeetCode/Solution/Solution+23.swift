//
//  Solution+23.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/1.
//

import Foundation

extension Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        var nodes: [ListNode] = lists.compactMap({ $0 }).sorted { $0.val < $1.val }
        var res: ListNode?
        var cur: ListNode?
        while let first = nodes.first {
            if res != nil {
                cur?.next = first
                cur =  first
            } else {
                res = first
                cur = res
            }
            cur = first
            nodes.removeFirst()
            if let next = first.next {
                let index = nodes.firstIndex { $0.val > next.val } ?? nodes.count
                nodes.insert(next, at: index)
            }
        }
        return res
    }
}
