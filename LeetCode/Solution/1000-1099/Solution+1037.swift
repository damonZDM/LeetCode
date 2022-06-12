//
//  Solution+1037.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/8.
//

import Foundation

extension Solution {
    func isBoomerang(_ points: [[Int]]) -> Bool {
        typealias Point = (x: Int, y: Int)
        let a: Point = (points[0][0], points[0][1])
        let b: Point = (points[1][0], points[1][1])
        let c: Point = (points[2][0], points[2][1])
        let ab = [b.x - a.x, b.y - a.y]
        let ac = [c.x - a.x, c.y - a.y]
        return ab[0] * ac[1] - ab[1] * ac[0] != 0
    }
}
