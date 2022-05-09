//
//  Solution+442.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/8.
//

import Foundation

extension Solution {
    /**
     # 442. 数组中重复的数据
     [LeetCode Link](https://leetcode-cn.com/problems/find-all-duplicates-in-an-array/)
     */
    public func findDuplicates(_ nums: [Int]) -> [Int] {
        let n: Int = nums.count + 1
        var mapsArray = [Int](repeating: 0, count: n)
        var ans = [Int]()
        nums.forEach {
            let count = mapsArray[$0]
            if count >= 1 {
                ans.append($0)
            } else {
                mapsArray[$0] = 1
            }
        }
        return ans
    }
}
