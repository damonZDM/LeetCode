//
//  Solution+1752.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/9.
//

import Foundation

extension Solution {
    /**
     # 1752. 检查数组是否经排序和轮转得到
     [LeetCode](https://leetcode.cn/problems/check-if-array-is-sorted-and-rotated/)
     */
    public func check(_ nums: [Int]) -> Bool {
        guard let first = nums.first else { return false }
        let len = nums.count
        var status = 0
        for i in 1..<len {
            switch status {
            case 0:
                if nums[i] < nums[i - 1] {
                    if nums[i] > first {
                        return false
                    }
                    status = 1
                }
            case 1:
                if nums[i] < nums[i - 1] || nums[i] > first {
                    return false
                }
            default:
                break
            }
        }
        return true
    }
}
