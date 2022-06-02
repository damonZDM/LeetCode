//
//  Solution+473.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/1.
//

import Foundation

extension Solution {
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let sum = matchsticks.reduce(0, +)
        guard sum % 4 == 0 else {
            return false
        }
        let len = sum / 4
        var edges = [Int](repeating: 0, count: 4)
        rootLoop: for m in matchsticks {
            for i in 0 ..< edges.count {
                if edges[i] + m < len {
                    edges[i] += m
                    break
                } else if edges[i] + m > len {
                    if i == edges.count - 1 {
                        break rootLoop
                    }
                    continue
                } else {
                    edges.remove(at: i)
                    break
                }
            }
        }
        
        if !edges.isEmpty {
            let n = matchsticks.count
            let size = 1 << n
            var dp = [Int](repeating: -1, count: size)
            dp[0] = 0
            for s in  1 ..< size {
                for k in 0 ..< n {
                    if s & (1 << k) == 0 {
                        continue
                    }
                    let s1 = s & ~(1 << k)
                    if dp[s1] >= 0 && dp[s1] + matchsticks[k] <= len {
                        dp[s] = (dp[s1] + matchsticks[k]) % len
                        break
                    }
                }
            }
            return dp[(1 << n) - 1] == 0
        }
        
        return true
    }
}
