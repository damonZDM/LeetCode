//
//  Solution+14.swift
//  Solution
//
//  Created by 赵典孟 on 2022/4/30.
//

import Foundation

extension Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        if strs.count == 1 { return strs[0] }
        func getCommonPrefix(_ s1: String,  _ s2: String) -> String {
            var count = 0
            for i in (0..<min(s1.count, s2.count)) {
                let index1 = s1.index(s1.startIndex, offsetBy: i)
                let index2 = s2.index(s2.startIndex, offsetBy: i)
                if s1[index1] == s2[index2] {
                    count += 1
                } else {
                    break
                }
            }
            return String(s1.prefix(count))
        }
        
        var s = strs[0]
        for i in 1..<strs.count {
            s = getCommonPrefix(s, strs[i])
        }
        return s
    }
}
