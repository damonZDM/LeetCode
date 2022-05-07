//
//  Solution+41.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/3.
//

import Foundation

extension Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var ranges: [[Int]] = [[1, Int.max]]
        for n in nums {
            for i  in 0..<ranges.count {
                let range = ranges[i]
                if n >= range[0] && n <= range[1] {
                    ranges.remove(at: i)
                    if n + 1 <= range[1] {
                        ranges.insert([n + 1,  range[1]], at: i)
                    }
                    if n - 1 >= range[0] {
                        ranges.insert([range[0], n - 1], at: i)
                    }
                    break
                }
            }
        }
        return ranges.first?.first ?? 1
    }
}
