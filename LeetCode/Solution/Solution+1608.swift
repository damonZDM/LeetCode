//
//  Solution+1608.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/6.
//

import Foundation

extension Solution {
    
    func specialArray(_ nums: [Int]) -> Int {
        var sorted = nums.sorted(by: <)
        guard var i = sorted.last else { return -1 }
        var sum = 0
        while i >= 0 {
            let count = sorted.count
            for j in 0..<count {
                let n = sorted[count - j - 1]
                if n >= i {
                    sum += 1
                    sorted.removeLast()
                } else {
                    break
                }
            }
            if sum == i {
                return i
            } else {
                i -= 1
            }
        }
        return -1
    }
}
