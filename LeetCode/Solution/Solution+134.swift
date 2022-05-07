//
//  Solution+134.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/6.
//

import Foundation

extension Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let n = gas.count
        if n == 0 { return -1 }
        
        var i = 0
        while i < n {
            var surplus = 0
            var j = 0
            while j < n {
                let index = (j + i) % n
                surplus = surplus + gas[index] - cost[index]
                if surplus < 0 {
                    break
                }
                j += 1
            }
            if j == n {
                return i
            } else {
                i = i + j + 1
            }
        }
        return -1
    }
}
