//
//  Solution+827.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/3.
//

import Foundation

extension Solution {
    func consecutiveNumbersSum(_ n: Int) -> Int {
        var ans = 0
        var k = 1
        while k * (k + 1) <= 2 * n  {
            defer { k += 1 }
            if k % 2  == 0 {
                if n % k != 0 && 2 * n % k == 0 {
                    ans += 1
                }
            } else {
                if n % k == 0 {
                    ans += 1
                }
            }
        }
        return ans
    }
}
