//
//  Solution+1566.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/7.
//

import Foundation

extension Solution {
    /**
     # 1566. 重复至少 K 次且长度为 M 的模式
     [LeetCode Link](https://leetcode-cn.com/problems/detect-pattern-of-length-m-repeated-k-or-more-times/)
     */
     public func containsPattern(_ arr: [Int], _ m: Int, _ k: Int) -> Bool {
        let n = arr.count - m * k
        if n < 0 {
            return false
        }
        
        for i in 0...n {
            let nums = Array(arr[i..<i+m])
            var result = true
            for j in 1..<k {
                let begin = i + m * j
                let end = begin + m
                let newNums = Array(arr[begin..<end])
                if newNums != nums {
                    result = false
                    break
                }
            }
            if result {
                return true
            }
        }
        return false
    }
}
