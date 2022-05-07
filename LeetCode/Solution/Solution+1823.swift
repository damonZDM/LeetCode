//
//  Solution+1823.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/4.
//

import Foundation

extension Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        if n <= 1 { return n }
        var nums = Array(1...n)
        var cur = 0
        while nums.count > 1 {
            let count = nums.count
            let removeIndex = ((k + cur) % count - 1) == -1 ? count - 1 : (k + cur) % count - 1
            let r = nums.remove(at: removeIndex)
            cur = removeIndex
            
            print("remove num is ", r)
        }
        return nums.first ?? 1
    }
}
