//
//  Solution+812.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/15.
//

import Foundation

extension Solution {
    /**
     * # 812. 最大三角形面积
     * [LeetCode](https://leetcode.cn/problems/largest-triangle-area/)
     */
    public func largestTriangleArea(_ points: [[Int]]) -> Double {
        func area(_ point1: [Int], _ point2: [Int], _ point3: [Int]) -> Double {
            abs(Double(point1[0] * point2[1] + point2[0] * point3[1] + point3[0] * point1[1] - point1[0] * point3[1] - point2[0] * point1[1] - point3[0] * point2[1])) * 0.5
        }
        
        var maxArea = 0.0
        for i in 0..<(points.count-2) {
            for j in (i + 1)..<(points.count - 1) {
                for k in (j + 1)..<points.count {
                    let area = area(points[i], points[j], points[k])
                    maxArea = max(maxArea, area)
                }
            }
        }
        return maxArea
    }
}
