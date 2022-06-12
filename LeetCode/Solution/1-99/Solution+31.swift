//
//  Solution+31.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/3.
//

import Foundation

extension Solution {
    ///  31
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        if n < 2 { return }
        for i in (0 ..< (n - 1)).reversed() {
            for j in (i ..< n).reversed() {
                if nums[i] < nums[j] {
                    nums.swapAt(i, j)
                    nums[(i + 1)...].sort()
                    return
                }
            }
        }
        nums = nums.reversed()
    }
}
