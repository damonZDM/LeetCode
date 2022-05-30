//
//  Solution+27.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/3.
//

import Foundation

extension Solution {
    /// 29
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let symbol = (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0)
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        var ans: Int32 = 0
        while dividend > divisor {
            dividend -= divisor
            ans += 1
        }
        return symbol ? Int(ans) : Int(-ans)
    }
}
