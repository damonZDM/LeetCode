//
//  MyCalendarThree.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/6.
//

import Foundation

/// [732. 我的日程安排表 III](https://leetcode.cn/problems/my-calendar-iii/)
class MyCalendarThree {
    
    private var cnt: [Int: Int] = [:]

    init() {

    }
    
    func book(_ start: Int, _ end: Int) -> Int {
        var ans = 0
        var maxBook = 0
        cnt[start] = (cnt[start] ?? 0) + 1
        cnt[end] = (cnt[end] ?? 0) - 1
        let keys = cnt.keys.sorted()
        for key in keys {
            maxBook += cnt[key]!
            ans = max(maxBook, ans)
        }
        return ans
    }
}
