//
//  MyQueue.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/8.
//

import Foundation

/**
 # 面试题 03.04. 化栈为队
 [LeetCode Link](https://leetcode-cn.com/problems/implement-queue-using-stacks-lcci/)
 
 ## Your MyQueue object will be instantiated and called as such:
 ```swift
 let obj = MyQueue()
 obj.push(x)
 let ret_2: Int = obj.pop()
 let ret_3: Int = obj.peek()
 let ret_4: Bool = obj.empty()
 ```
 */
class MyQueue {
    
    private var stackWrite = MyStack()
    private var stackRead = MyStack()

    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        while let top = stackRead.pop() {
            stackWrite.push(top)
        }
        stackWrite.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        while let top = stackWrite.pop() {
            stackRead.push(top)
        }
        return stackRead.pop() ?? 0
    }
    
    /** Get the front element. */
    func peek() -> Int {
        stackWrite.peek() ?? stackRead.top ??  0
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        stackWrite.isEmpty && stackRead.isEmpty
    }
}

class MyStack {
    
    private var list: [Int] = []
    
    var top: Int? { list.last }
    
    var size: Int { list.count }
    
    var isEmpty: Bool { list.isEmpty }
    
    func push(_ x: Int) {
        list.append(x)
    }
    
    func pop() -> Int? {
        if list.isEmpty { return nil }
        return list.removeLast()
    }
    
    func peek() -> Int? {
        list.first
    }
}
