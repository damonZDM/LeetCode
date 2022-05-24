//
//  Solution_1800+.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/13.
//

import Foundation

extension Solution {
    /**
     * # 1812. 判断国际象棋棋盘中一个格子的颜色
     * [LeetCode](https://leetcode.cn/problems/determine-color-of-a-chessboard-square/)
     */
    public func squareIsWhite(_ coordinates: String) -> Bool {
        let nums = [1, -1, 1, -1, 1, -1, 1, -1]
        let index1 = Int(coordinates.first!.asciiValue! - Character("a").asciiValue!)
        let index2 = Int(String(coordinates.last!))! - 1
        
        return nums[index1] * nums[index2] < 0
    }
}
