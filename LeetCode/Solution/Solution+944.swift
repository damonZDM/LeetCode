//
//  Solution+944.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/12.
//

import Foundation

extension Solution {
    public func minDeletionSize(_ strs: [String]) -> Int {
        let n = strs.count
        if n <= 1 { return 0 }
        let m = strs[0].count
        var ans = 0
        for i in 0..<m  {
            for j in 1..<n {
                let pre =  strs[j - 1] as NSString
                let cur = strs[j] as NSString
                if cur.character(at: i) < pre.character(at: i)  {
                    ans += 1
                    break
                }
            }
        }
        return ans
    }
}
