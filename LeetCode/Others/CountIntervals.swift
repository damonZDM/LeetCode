//
//  CountIntervals.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/21.
//

import Foundation

public class CountIntervals {
    typealias CountRange = (left: Int, right: Int)
    
    var ranges: [CountRange] = []

    public init() {
        
    }
    
    public func add(_ left: Int, _ right: Int) {
        if ranges.isEmpty {
            ranges.append((left, right))
            return
        }
        if let last = ranges.last, left > last.right {
            ranges.append((left, right))
            return
        }
        var i = 0
        var isMerge = false
        while i < ranges.count {
            let preRight = i == 0 ? 0 : ranges[i - 1].right
            if preRight < left && ranges[i].left > right {
                ranges.insert((left, right), at: i)
                break
            }
            if ranges[i].right >= left && ranges[i].left <= right {
                ranges[i] = (min(ranges[i].left, left), max(ranges[i].right, right))
                isMerge = true
                break
            }
            i += 1
        }
        
        while i < ranges.count - 1 && isMerge {
            let newRange = merge(ranges[i], range2: ranges[i + 1])
            if newRange.count == 1 {
                ranges[i] = newRange[0]
                ranges.remove(at: i + 1)
            } else {
                break
            }
        }
        
        print(ranges)
    }
    
    func merge(_ range1: CountRange, range2: CountRange) -> [CountRange] {
        if range1.right >= range2.left && range1.left <= range2.right {
            return [(min(range1.left, range2.left), max(range1.right, range2.right))]
        } else {
            return [range1, range2]
        }
    }
    
    public func count() -> Int {
        ranges.reduce(0) { $0 + ($1.right - $1.left + 1) }
    }
}
