//
//  Solution+908.swift
//  Solution
//
//  Created by 赵典孟 on 2022/4/30.
//

import Foundation

extension Solution {
    func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
        let min = nums.min()!
        let max = nums.max()!
        
        return (max - min) > 2 * k ? (max - min) - 2 * k : 0
    }
}
