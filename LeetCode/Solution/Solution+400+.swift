//
//  Solution+442.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/8.
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
    
    enum Direction {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }

    /// 427
    func construct(_ grid: [[Int]]) -> Node? {
        
        let (isLeaf, val) = getIsLeafAndVal(grid)
        
        let node = Node(val, isLeaf)
        
        if !isLeaf {
            node.topLeft = construct(getGrid(grid, .topLeft))
            node.topRight = construct(getGrid(grid, .topRight))
            node.bottomLeft = construct(getGrid(grid, .bottomLeft))
            node.bottomRight = construct(getGrid(grid, .bottomRight))
        }
        
        return node
    }
    
    func getIsLeafAndVal(_ grid: [[Int]]) -> (Bool, Bool) {
        let value = grid[0][0]
        if grid.count <= 1 { return (true, value == 1) }
        for row in grid {
            for n in row {
                if n != value {
                    return (false, n == 1)
                }
            }
        }
        return (true, value == 1)
    }
    
    func getGrid(_ origin: [[Int]], _ direction: Direction) -> [[Int]] {
        let rows = origin.count
        let newCount = rows / 2
        let startRow: Int
        let startCol: Int
        switch direction {
        case .topLeft:
            startRow = 0
            startCol = 0
        case .topRight:
            startRow = 0
            startCol = newCount
        case .bottomLeft:
            startRow = newCount
            startCol = 0
        case .bottomRight:
            startRow = newCount
            startCol = newCount
        }
        
        var grid = [[Int]]()
        for i in 0..<newCount {
            let gridRow = origin[i + startRow]
            var list = [Int]()
            for j in 0..<newCount {
                list.append(gridRow[startCol + j])
            }
            grid.append(list)
        }
        return grid
    }
    
    /// 433
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end {
            return 0
        }
        guard bank.contains(end) else {
            return -1
        }
        
        var minSteps = Int.max
        
        func backtracking(_ start: String, _ end: String, bank: [String], _ steps: Int) {
            if start == end {
                minSteps = min(minSteps, steps)
            }
            for i in 0..<bank.count {
                let s = bank[i]
                if difference(s, start) == 1 {
                    var temp  = bank
                    temp.remove(at: i)
                    backtracking(s, end, bank: temp, steps + 1)
                }
            }
        }
        
        backtracking(start, end, bank: bank, 0)
        
        return minSteps == Int.max ? -1 : minSteps
    }
    
    private func difference(_ s1: String, _ s2: String) -> Int {
        let n = s1.count
        var sum = 0
        for i in 0..<n {
            if s1[i] != s2[i] {
                sum += 1
            }
        }
        return sum
    }
    
    /**
     # 436. 寻找右区间
     [LeetCode Link](https://leetcode.cn/problems/find-right-interval/)
     */
    public func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        var cache: [Int: Int] = [:]
        var ans: [Int] = []
        for i in 0 ..< intervals.count {
            let end = intervals[i][1]
            if let index = cache[end] {
                ans.append(index)
            } else {
                var result = -1
                var value = Int.max
                for j in 0 ..<  intervals.count {
                    let start = intervals[j][0]
                    if start >= end && start < value {
                        result = j
                        value = start
                    }
                }
                ans.append(result)
                cache[end] = result
            }
        }
        return ans
    }
    
    /**
     # 442. 数组中重复的数据
     [LeetCode Link](https://leetcode-cn.com/problems/find-all-duplicates-in-an-array/)
     */
    public func findDuplicates(_ nums: [Int]) -> [Int] {
        let n: Int = nums.count + 1
        var mapsArray = [Int](repeating: 0, count: n)
        var ans = [Int]()
        nums.forEach {
            let count = mapsArray[$0]
            if count >= 1 {
                ans.append($0)
            } else {
                mapsArray[$0] = 1
            }
        }
        return ans
    }
    
    
    /// # 461. 汉明距离
    /// [LeetCode](https://leetcode.cn/problems/hamming-distance/)
    public func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var x = x, y = y
        var sum = 0
        while x > 0 || y > 0 {
            let n = x % 2
            x = x / 2
            let m = y % 2
            y = y / 2
            if m != n {
                sum += 1
            }
        }
        return sum
    }
    
    
    /// # 462. 最少移动次数使数组元素相等 II
    /// [LeetCode](https://leetcode.cn/problems/minimum-moves-to-equal-array-elements-ii/)
    /// - Parameter nums: 一个长度为 n 的整数数组 nums
    /// - Returns: 返回使所有数组元素相等需要的最少移动数
    public func minMoves2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        let center = nums[(n - 1) / 2]
        return nums.reduce(0) { $0 + abs($1 - center) }
    }
    
    
    /// # 464. 我能赢吗
    /// [LeetCode](https://leetcode.cn/problems/can-i-win/)
    /// - Parameters:
    ///   - maxChoosableInteger: 整数池中可选择的最大数
    ///   - desiredTotal: 累计和
    /// - Returns: 若先出手的玩家是否能稳赢则返回 true ，否则返回 false
    public func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        if (1 +  maxChoosableInteger)  * maxChoosableInteger / 2 < desiredTotal {
            return false
        }
        var memo: [Int: Bool] = [:]
        func dfs(_ usedNumbers: Int, _ currentTotal: Int) -> Bool {
            if let value = memo[usedNumbers] {
                return value
            }
            var res = false
            for i in 0  ..< maxChoosableInteger {
                guard (usedNumbers >> i) & 1 == 0 else {
                    continue
                }
                if i + 1 + currentTotal >= desiredTotal {
                    res = true
                    break
                }
                if !dfs(usedNumbers | (1 << i), currentTotal + i + 1) {
                    res =  true
                    break
                }
            }
            memo[usedNumbers] = res
            return res
        }
        return dfs(0, 0)
    }
    
    /// # 467. 环绕字符串中唯一的子字符串
    /// [LeetCode](https://leetcode.cn/problems/unique-substrings-in-wraparound-string/)
    public func findSubstringInWraproundString(_ p: String) -> Int {
        let n = p.count
        if n <= 1 { return n }
        var maps: [String: Int] = [:]
        var i = 0
        var pre = (p as NSString).character(at: 0)
        maps["\(pre)"] = 1
        for j in 1 ..< n {
            let cur = (p as NSString).character(at: j)
            if (Int(cur) - Int(pre) + 26) % 26 == 1 {
                let key = "\(cur)"
                maps[key] = max(j - i + 1, maps[key] ?? 0)
            } else {
                i = j
                let key = "\(cur)"
                maps[key] = max(maps[key] ?? 0, 1)
            }
            pre = cur
        }
        return maps.reduce(0) { $0 + $1.value }
    }
}
