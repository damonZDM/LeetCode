//
//  Solution+19.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/5.
//

import Foundation

extension Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var i = 0
        var j = 0
        var previousNode: ListNode? = nil
        var leftNode = head
        var rightNode = head
        while rightNode != nil  {
            if j >= n {
                i += 1
                previousNode = leftNode
                leftNode = leftNode?.next
            }
            j +=  1
            rightNode = rightNode?.next
        }
        if i == 0 {
            return head?.next
        } else {
            previousNode?.next = leftNode?.next
        }
        return head
    }
}
