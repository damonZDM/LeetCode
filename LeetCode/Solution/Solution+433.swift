//
//  Solution+433.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/7.
//

import Foundation

extension Solution {
    
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end {
            return 0
        }
        guard bank.contains(end) else {
            return -1
        }
        
        var minSteps = Int.max
        
        func backtracking(_ start: String, _ end: String, bank: [String], _ steps: Int) {
            if start == end {
                minSteps = min(minSteps, steps)
            }
            for i in 0..<bank.count {
                let s = bank[i]
                if difference(s, start) == 1 {
                    var temp  = bank
                    temp.remove(at: i)
                    backtracking(s, end, bank: temp, steps + 1)
                }
            }
        }
        
        backtracking(start, end, bank: bank, 0)
        
        return minSteps == Int.max ? -1 : minSteps
    }
    
    private func difference(_ s1: String, _ s2: String) -> Int {
        let n = s1.count
        var sum = 0
        for i in 0..<n {
            if s1[i] != s2[i] {
                sum += 1
            }
        }
        return sum
    }
}
