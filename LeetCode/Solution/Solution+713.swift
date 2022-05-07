//
//  Solution+713.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/5.
//

import Foundation

extension Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        for i in 0..<nums.count {
            var surplus = Double(k)
            for j in i..<nums.count {
                let n = nums[j]
                surplus /= Double(n)
                if surplus <= 1 {
                    break
                } else {
                    count += 1
                }
            }
        }
        return count
    }
}
