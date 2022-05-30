//
//  ListNode.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/5.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode {
    
    convenience init?(_ list: [Int]) {
        var node: ListNode?
        for n in list.reversed() {
            let newNode = ListNode(n, node)
            node = newNode
        }
        guard let node = node else {
            return nil
        }
        self.init(node.val, node.next)
    }
}
