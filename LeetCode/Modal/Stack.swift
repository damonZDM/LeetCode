//
//  Stack.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/30.
//

import Foundation

public class Stack<T> {
    
    private var elements: [T] = []
    
    public var isEmpty: Bool { elements.isEmpty }
    
    public var top: T? { elements.last }
    
    public func push(_ element: T) {
        elements.append(element)
    }
    
    public func pop() -> T? {
        if isEmpty { return nil }
        return elements.removeLast()
    }
}
