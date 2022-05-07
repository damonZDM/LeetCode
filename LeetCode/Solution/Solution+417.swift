//
//  Solution+417.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/7.
//

import Foundation

extension Solution {
    // 417. 太平洋大西洋水流问题
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let ds = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        
        let m = heights.count
        let n = heights[0].count
        
        func dfs(_ row: Int, _ col: Int, _ ocean: inout [[Bool]]) {
            if ocean[row][col] { return }
            ocean[row][col] = true
            for d in ds {
                let r = row + d[0]
                let c = col + d[1]
                if r >= 0 && r < m && c >= 0 && c < n && heights[r][c] >= heights[row][col] {
                    dfs(r, c, &ocean)
                }
            }
        }
        
        var pacific: [[Bool]] = Array(repeating: [Bool](repeating: false, count: n), count: m)
        var atlantic: [[Bool]] = Array(repeating: [Bool](repeating: false, count: n), count: m)
        
        for i in 0..<m {
            dfs(i, 0, &pacific)
        }
        
        for j in 1..<n {
            dfs(0, j, &pacific)
        }
        
        for i in 0..<m {
            dfs(i, n - 1, &atlantic)
        }
        
        for j in 0..<(n - 1) {
            dfs(m - 1, j, &atlantic)
        }
        
        var list: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                if pacific[i][j] && atlantic[i][j] {
                    list.append([i, j])
                }
            }
        }
        return list
    }
}
