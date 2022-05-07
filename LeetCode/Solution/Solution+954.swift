//
//  Solution+954.swift
//  test
//
//  Created by 赵典孟 on 2022/4/27.
//

import Foundation

extension Solution {
    // 954. 二倍数对数组
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        
        var maps: [Int: Int] = [:]
        arr.sorted(by: { abs($0) < abs($1) }).forEach {
            let value = maps[$0] ?? 0
            if value > 0 {
                maps[$0] = value - 1
            } else {
                let need = $0 * 2
                let count = maps[need] ?? 0
                maps[need] = count + 1
            }
            
        }
        return maps.values.filter { $0 > 0 }.isEmpty
    }
}
