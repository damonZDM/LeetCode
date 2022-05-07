//
//  Solution+50.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/4.
//

import Foundation

extension Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x
        var n = n
        if n == 0 {
            return  1
        }
        if n < 0 {
            x = 1 / x
            n = -n
        }
        if n == 1 {
            return x
        }
        let num = myPow(x, n / 2)
        if n % 2 == 0 {
            return num * num
        } else {
            return num * num * x
        }
    }
}
