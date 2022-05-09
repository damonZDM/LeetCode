//
//  String.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/2.
//

import Foundation

extension StringProtocol {
    
    subscript(_ index: Int) -> Character {
        return self[self.index(startIndex, offsetBy: index)]
    }
    
    subscript(safe index: Int) -> Character? {
        if index >= count { return nil }
        return self[index]
    }
    
    subscript(_ range: Range<Int>) -> String {
        let begin = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[begin..<end])
    }
    
    subscript(_ range: ClosedRange<Int>) -> String {
        let begin = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[begin...end])
    }
    
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        self[index(startIndex, offsetBy: range.lowerBound)...]
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        self[...index(startIndex, offsetBy: range.upperBound)]
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        self[..<index(startIndex, offsetBy: range.upperBound)]
    }
}
