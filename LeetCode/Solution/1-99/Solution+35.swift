//
//  Solution+35.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/2.
//

import Foundation

extension Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var begin = 0
        var end = nums.count
        while begin != end {
            let mid = (begin + end) / 2
            let num = nums[mid]
            if num == target {
                return mid
            } else if num > target {
                end = mid
            } else {
                begin = mid + 1
            }
        }
        return begin
    }
}
