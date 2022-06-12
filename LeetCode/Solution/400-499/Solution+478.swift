//
//  Solution+478.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/5.
//

import Foundation

class Solution478 {
    
    private let center: [Double]
    
    private let radius: Double

    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        self.center = [x_center, y_center]
    }
    
    func randPoint() -> [Double] {
        let x = Double.random(in: -radius ... radius)
        let y = Double.random(in: -radius ... radius)
        if x * x + y * y > radius * radius {
            return randPoint()
        }
        return [x, y]
    }
}
