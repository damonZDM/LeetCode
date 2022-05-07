//
//  ListNode.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/5.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
