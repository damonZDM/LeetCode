//
//  Solution+24.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/30.
//

import Foundation

extension Solution {
    /// [24. 两两交换链表中的节点](https://leetcode.cn/problems/swap-nodes-in-pairs/)
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let one = head
        let two = head?.next
        let three = two?.next
        two?.next = one
        one?.next = swapPairs(three)
        return two
    }
}
