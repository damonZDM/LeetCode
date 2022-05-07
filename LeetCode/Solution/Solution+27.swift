//
//  Solution+27.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/3.
//

import Foundation

extension Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = 0
        while j < nums.count {
            let n = nums[i]
            if n == val {
                if nums[j] == val {
                    j += 1
                } else {
                    nums[i] = nums[j]
                    nums[j] = val
                    i += 1
                }
            } else {
                i += 1
                j = max(j, i)
            }
        }
        return i
    }
}
