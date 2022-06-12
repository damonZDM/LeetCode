//
//  Solution+875.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/7.
//

import Foundation

extension Solution {
    
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = piles.max()!
        if piles.count >= h {
            return right
        }
        let leftH = piles.reduce(0, +)
        if leftH <= h {
            return left
        }
        while left < right - 1 {
            let center = (right - left) / 2 + left
            let centerH = piles.reduce(0) { $0 + Int(ceil(Double($1) / Double(center))) }
            if centerH <= h {
                right = center
            } else {
                left = center
            }
        }
        return right
    }
}

