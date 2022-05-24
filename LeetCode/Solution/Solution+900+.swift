//
//  Solution+900+.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/17.
//

import Foundation

extension Solution {
    /// 905
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        nums.forEach {
            if $0.isMultiple(of: 2) {
                res.insert($0, at: 0)
            } else {
                res.append($0)
            }
        }
        return res
    }
    
    /// 908
    func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
        let min = nums.min()!
        let max = nums.max()!
        
        return (max - min) > 2 * k ? (max - min) - 2 * k : 0
    }
    
    /// 942
    public func diStringMatch(_ s: String) -> [Int] {
        let n = s.count
        var nums = Array(0...n)
        var ans = [Int]()
        for char in s {
            if char == "I" {
                ans.append(nums.removeFirst())
            } else {
                ans.append(nums.removeLast())
            }
        }
        return ans + nums
    }
    
    /// 944
    public func minDeletionSize(_ strs: [String]) -> Int {
        let n = strs.count
        if n <= 1 { return 0 }
        let m = strs[0].count
        var ans = 0
        for i in 0..<m  {
            for j in 1..<n {
                let pre =  strs[j - 1] as NSString
                let cur = strs[j] as NSString
                if cur.character(at: i) < pre.character(at: i)  {
                    ans += 1
                    break
                }
            }
        }
        return ans
    }
    
    // 954. 二倍数对数组
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        
        var maps: [Int: Int] = [:]
        arr.sorted(by: { abs($0) < abs($1) }).forEach {
            let value = maps[$0] ?? 0
            if value > 0 {
                maps[$0] = value - 1
            } else {
                let need = $0 * 2
                let count = maps[need] ?? 0
                maps[need] = count + 1
            }
            
        }
        return maps.values.filter { $0 > 0 }.isEmpty
    }
    
    /**
     * # 953. 验证外星语词典
     * [LeetCode](https://leetcode.cn/problems/verifying-an-alien-dictionary/)
     */
    public func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let n = words.count
        for i in 1 ..< n {
            let pre = words[i - 1]
            let cur = words[i]
            let m = min(pre.count, cur.count)
            var isEqual = true
            for j in 0 ..< m {
                let preIndex = order.firstIndex(of: pre[j])!
                let curIndex = order.firstIndex(of: cur[j])!
                if preIndex > curIndex {
                    isEqual = false
                    return false
                } else if preIndex == curIndex {
                    continue
                } else {
                    isEqual = false
                    break
                }
            }
            if pre.count > cur.count && isEqual {
                return false
            }
        }
        return true
    }
    
    
    /// # 961. 在长度 2N 的数组中找出重复 N 次的元素
    /// [LeetCode](https://leetcode.cn/problems/n-repeated-element-in-size-2n-array/)
    /// - Parameter nums: 整数数组，长度2 * n
    /// - Returns: 数组中重复n次的元素
    public func repeatedNTimes(_ nums: [Int]) -> Int {
        var maps: [Int: Int] = [:]
        for num in nums {
            if maps[num] == 1 {
                return num
            }
            maps[num] = 1
        }
        return 0
    }
    
    /// # 965. 单值二叉树
    /// [LeetCode](https://leetcode.cn/problems/univalued-binary-tree/)
    public func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let val = root?.val else {
            return true
        }
        var ans = true
        if let left = root?.left?.val {
            ans = ans && (left == val)
        }
        if let right = root?.right?.val {
            ans = ans && (right == val)
        }
        return ans && isUnivalTree(root?.left) && isUnivalTree(root?.right)
    }
}



fileprivate class Log {
    
    enum LogType {
        case number
        case letter
    }
    
    var head: String
    var tail: String
    var type: LogType
    var value: String
    
    init(_ s: String) {
        self.value = s
        let index = s.firstIndex(of: " ") ?? s.startIndex
        self.head = String(s[s.startIndex..<index])
        let tailStartIndex = s.index(after: index)
        self.tail = String(s[tailStartIndex...])
        self.type = "0123456789".contains(tail.first!) ? .number : .letter
    }
}

extension Log: Comparable {
    
    static func < (lhs: Log, rhs: Log) -> Bool {
        switch (lhs.type, rhs.type) {
        case (.number, .number):
            return false
        case (.number, .letter):
            return false
        case (.letter, .number):
            return true
        case (.letter, .letter):
            if lhs.tail != rhs.tail {
                return lhs.tail < rhs.tail
            } else {
                return lhs.head < rhs.head
            }
        }
    }
    
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.value == rhs.value
    }
    
}

extension Solution {
    /// 937
    func reorderLogFiles(_ logs: [String]) -> [String] {
        logs.map { Log($0) }
            .sorted()
            .map { $0.value }
    }
}
