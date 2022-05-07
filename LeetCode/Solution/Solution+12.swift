//
//  Solution+12.swift
//  Solution
//
//  Created by 赵典孟 on 2022/4/30.
//

import Foundation

extension Solution {
    func intToRoman(_ num: Int) -> String {
        let nums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romes = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var value = num
        
        func getNumIndex(_ num: Int) -> Int {
            for i in 0..<nums.count {
                if num >= nums[i] {
                    return i
                }
            }
            return 0
        }
        var result = ""
        while value != 0 {
            let index = getNumIndex(value)
            let count = value / nums[index]
            value = value % nums[index]
            result += String(repeating: romes[index], count: count)
        }
        return result
    }
    
    func romanToInt(_ s: String) -> Int {
        let nums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romes = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var value = s
        
        func getRomanIndex(_ s: String) -> Int {
            for i in 0..<romes.count {
                if s.hasPrefix(romes[i]) {
                    return i
                }
            }
            return 0
        }
        var result = 0
        while value.count != 0 {
            let index = getRomanIndex(value)
            let count = romes[index].count
            value.removeSubrange(s.startIndex..<s.index(s.startIndex, offsetBy: count))
            result += nums[index]
        }
        return result
    }
}
