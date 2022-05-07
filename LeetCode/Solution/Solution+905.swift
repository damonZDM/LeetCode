//
//  Solution+905.swift
//  test
//
//  Created by 赵典孟 on 2022/4/28.
//

import Foundation

extension Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        nums.forEach {
            if $0.isMultiple(of: 2) {
                res.insert($0, at: 0)
            } else {
                res.append($0)
            }
        }
        return res
    }
}
