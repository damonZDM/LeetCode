//
//  Solution+49.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/4.
//

import Foundation

extension Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var maps: [String: [Int]] = [:]
        for e in strs.enumerated() {
            let key = String(e.element.sorted())
            let indexs = maps[key] ?? []
            maps[key] = indexs + [e.offset]
        }
        return maps.values.map {
            $0.map {
                strs[$0]
            }
        }
    }
}
