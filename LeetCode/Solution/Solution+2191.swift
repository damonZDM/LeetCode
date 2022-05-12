//
//  Solution+2191.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/12.
//

import Foundation

extension Solution {
    /**
     * #  2191. 将杂乱无章的数字排序
     * 【LeetCode】(https://leetcode.cn/problems/sort-the-jumbled-numbers/)
     */
    public func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        func toMap(_ value: Int) -> Int {
            var ans = ""
            for c in String(value) {
                let index = Int(String(c))!
                ans += String(mapping[index])
            }
            return Int(ans)!
        }
        let sortedNums = nums.map(toMap)
        return nums.enumerated().sorted { sortedNums[$0.offset] < sortedNums[$1.offset] }.map(\.element)
    }
}
