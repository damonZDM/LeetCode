//
//  Solution+11.swift
//  Solution
//
//  Created by 赵典孟 on 2022/4/30.
//

import Foundation

extension Solution {
    func maxArea(_ height: [Int]) -> Int {
        if height.count <= 1 { return 0 }
        var i = 0
        var j = height.count - 1
        var maxArea = 0
        while i != j {
            let left = height[i]
            let right = height[j]
            let area = (j - i) * min(left, right)
            maxArea = max(area, maxArea)
            if left > right {
                j -= 1
            } else {
                i += 1
            }
        }
        return maxArea
    }
}
