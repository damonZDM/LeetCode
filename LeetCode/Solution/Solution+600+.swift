//
//  Solution+600+.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/14.
//

import Foundation

extension Solution {
    
    /**
     * # 691. 贴纸拼词
     * [LeetCode](https://leetcode.cn/problems/stickers-to-spell-word/)
     */
//    public func minStickers(_ stickers: [String], _ target: String) -> Int {
//        let chars = target
//        
//        func updateTarget(_ target: String, _ sticker: String) -> String {
//            var temp = target
//            for c in sticker {
//                if let index = temp.firstIndex(of: c) {
//                    temp.remove(at: index)
//                }
//            }
//            return temp
//        }
//        
//        var minCount = stickers.count
//        
//        var target = target
//        while !target.isEmpty {
//            var sum = 0
//            for s in stickers {
//                let temp = target
//                target = updateTarget(target, s)
//                if target != temp {
//                    sum += 1
//                }
//            }
//        }
//        
//        for s in stickers {
//            
//        }
//    }
    
    
    /// # 668. 乘法表中第k小的数
    /// [LeetCode](https://leetcode.cn/problems/kth-smallest-number-in-multiplication-table/)
    /// - Parameters:
    ///   - m: 行数
    ///   - n: 列数
    ///   - k: 目标
    /// - Returns: 乘法表中第k小的数字
    public func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var left = 1, right = m * n
        while left < right {
            let x = left + (right - left) / 2
            let count = ((x / n + 1) ... m).reduce(x / n * n) {
                $0 + x / $1
            }
            if count >= k {
                right = x
            } else {
                left = x + 1
            }
        }
        return left
    }
    
    /// # 675. 为高尔夫比赛砍树
    /// [LeetCode](https://leetcode.cn/problems/cut-off-trees-for-golf-event/)
    public func cutOffTree(_ forest: [[Int]]) -> Int {
        let dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        let row = forest.count
        let col = forest[0].count
        var trees = Array<[Int]>()
        for i in 0 ..< row {
            for j in 0  ..< col {
                if forest[i][j] > 1 {
                    trees.append([i, j])
                }
            }
        }
        trees.sort {
            forest[$0[0]][$0[1]] < forest[$1[0]][$1[1]]
        }
        
        func bfs(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int)  -> Int {
            if sx == tx  && sy == ty {
                return 0
            }
            var step = 0
            var queue = Array<[Int]>()
            var visited: [[Bool]] = Array(repeating: [Bool](repeating: false, count: col), count: row)
            queue.append([sx, sy])
            visited[sx][sy] = true
            while queue.count > 0 {
                step += 1
                let sz = queue.count
                for _ in 0 ..< sz {
                    let cell = queue.removeFirst()
                    let cx = cell[0]
                    let cy = cell[1]
                    for j in 0 ..< 4 {
                        let nx = cx  + dirs[j][0]
                        let ny = cy + dirs[j][1]
                        if nx >= 0 && nx < row && ny >= 0 &&  ny < col {
                            if !visited[nx][ny] && forest[nx][ny] > 0 {
                                if nx == tx && ny == ty {
                                    return step
                                }
                                queue.append([nx, ny])
                                visited[nx][ny] = true
                            }
                        }
                    }
                }
            }
            
            return -1
        }
        
        var cx = 0
        var cy = 0
        var ans = 0
        for tree in trees {
            let steps = bfs(cx, cy, tree[0], tree[1])
            if steps == -1 {
                return -1
            }
            ans += steps
            cx = tree[0]
            cy = tree[1]
        }
        
        return ans
    }
}

extension Solution {
    
    private struct MyRange: Hashable {
        var left: Int
        var right: Int
        var height: Int
    }
    
    /// # 699. 掉落的方块
    /// [LeetCode](https://leetcode.cn/problems/falling-squares/)
    public func fallingSquares(_ positions: [[Int]]) -> [Int] {
        var ranges: [MyRange] = []
        var ans: [Int] = []
        var maxHeight = 0
        for position in positions {
            let left = position[0]
            let height = position[1]
            let right = left + height
            var curHeight = height
            
            for range in ranges {
                if range.right > left && range.left < right {
                    curHeight = max(curHeight, height + range.height)
                }
            }
            ranges.append(MyRange(left: left, right: right, height: curHeight))
            maxHeight = max(curHeight, maxHeight)
            ans.append(maxHeight)
        }
        return ans
    }
}
