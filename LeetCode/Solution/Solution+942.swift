//
//  Solution+942.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/9.
//

import Foundation

extension Solution {
    public func diStringMatch(_ s: String) -> [Int] {
        let n = s.count
        var nums = Array(0...n)
        var ans = [Int]()
        for char in s {
            if char == "I" {
                ans.append(nums.removeFirst())
            } else {
                ans.append(nums.removeLast())
            }
        }
        return ans + nums
    }
}
