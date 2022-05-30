//
//  Solution+26.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/2.
//

import Foundation

extension Solution {
    /// 26
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var i = 1
        var num = nums[0]
        while i < nums.count {
            if nums[i] == num {
                nums.remove(at: i)
            } else {
                i += 1
                num = nums[i - 1]
            }
        }
        return i
    }
}
