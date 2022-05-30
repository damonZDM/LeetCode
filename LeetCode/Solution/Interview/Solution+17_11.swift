//
//  Solution+17_11.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/27.
//

import Foundation

extension Solution {
    
    public func findClosest(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var index1 = -1
        var index2 = -1
        var minDistance = Int.max
        for i in 0 ..< words.count {
            let word = words[i]
            if word == word1 {
                index1 = i
            } else if word == word2 {
                index2 = i
            }
            if index1 != -1 && index2 != -1 {
                minDistance = min(abs(index2 - index1), minDistance)
            }
        }
        return minDistance
    }
}
