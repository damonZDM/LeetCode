//
//  Solution+926.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/11.
//

import Foundation

extension Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var dp0 = 0, dp1 =  0
        for c in s {
            var dp0New = dp0
            var dp1New = min(dp0, dp1)
            if c == "1" {
                dp0New += 1
            } else {
                dp1New += 1
            }
            dp0 = dp0New
            dp1 = dp1New
        }
        return min(dp0, dp1)
    }
}
