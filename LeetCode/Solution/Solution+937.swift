//
//  Solution+937.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/3.
//

import Foundation

fileprivate class Log {
    
    enum LogType {
        case number
        case letter
    }
    
    var head: String
    var tail: String
    var type: LogType
    var value: String
    
    init(_ s: String) {
        self.value = s
        let index = s.firstIndex(of: " ") ?? s.startIndex
        self.head = String(s[s.startIndex..<index])
        let tailStartIndex = s.index(after: index)
        self.tail = String(s[tailStartIndex...])
        self.type = "0123456789".contains(tail.first!) ? .number : .letter
    }
}

extension Log: Comparable {
    
    static func < (lhs: Log, rhs: Log) -> Bool {
        switch (lhs.type, rhs.type) {
        case (.number, .number):
            return false
        case (.number, .letter):
            return false
        case (.letter, .number):
            return true
        case (.letter, .letter):
            if lhs.tail != rhs.tail {
                return lhs.tail < rhs.tail
            } else {
                return lhs.head < rhs.head
            }
        }
    }
    
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.value == rhs.value
    }
    
}

extension Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        logs.map { Log($0) }
            .sorted()
            .map { $0.value }
    }
}
