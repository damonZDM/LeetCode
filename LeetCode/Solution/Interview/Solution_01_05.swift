//
//  Solution_01_05.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/13.
//

import Foundation

extension Solution {
    /**
     * # 面试题 01.05. 一次编辑
     * [LeetCode](https://leetcode.cn/problems/one-away-lcci/)
     *
     * 字符串有三种编辑操作:插入一个字符、删除一个字符或者替换一个字符。 给定两个字符串，编写一个函数判定它们是否只需要一次(或者零次)编辑。
     */
    public func oneEditAway(_ first: String, _ second: String) -> Bool {
        var first = first
        var second = second
        while let firstPrefix = first.first, let secondPrefix = second.first, firstPrefix == secondPrefix {
            first.removeFirst()
            second.removeFirst()
        }
        while let firstSuffix = first.last, let secondSuffix = second.last, firstSuffix == secondSuffix {
            first.removeLast()
            second.removeLast()
        }
        return first.count <= 1 && second.count <= 1
    }
}
