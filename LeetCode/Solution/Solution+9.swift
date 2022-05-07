//
//  Solution+9.swift
//  Solution
//
//  Created by 赵典孟 on 2022/4/29.
//

import Foundation

extension Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let s = String(x)
        for i in 0..<s.count / 2 {
            let index = s.index(s.startIndex, offsetBy: i)
            let index2 = s.index(s.startIndex, offsetBy: s.count - i - 1)
            if s[index] != s[index2] {
                return false
            }
        }
        return true
    }
}
