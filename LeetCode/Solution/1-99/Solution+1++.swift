//
//  Solution+9.swift
//  Solution
//
//  Created by 赵典孟 on 2022/4/29.
//

import Foundation

extension Solution {
    
    /// 9
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
    
    /**
     # 10. 正则表达式匹配
     [LeetCode](https://leetcode.cn/problems/regular-expression-matching/)
     ```Java
     public boolean isMatch(String s, String p) {
         int m = s.length();
         int n = p.length();

         boolean[][] f = new boolean[m + 1][n + 1];
         f[0][0] = true;
         for (int i = 0; i <= m; ++i) {
             for (int j = 1; j <= n; ++j) {
                 if (p.charAt(j - 1) == '*') {
                     f[i][j] = f[i][j - 2];
                     if (matches(s, p, i, j - 1)) {
                         f[i][j] = f[i][j] || f[i - 1][j];
                     }
                 } else {
                     if (matches(s, p, i, j)) {
                         f[i][j] = f[i - 1][j - 1];
                     }
                 }
             }
         }
         return f[m][n];
     }

     public boolean matches(String s, String p, int i, int j) {
         if (i == 0) {
             return false;
         }
         if (p.charAt(j - 1) == '.') {
             return true;
         }
         return s.charAt(i - 1) == p.charAt(j - 1);
     }
     ```
     */
    public func isMatch(_ s: String, _ p: String) -> Bool {
        let m = s.count
        let n = p.count
        var f: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: m + 1)
        f[0][0] = true
        
        func matches(_ s: String, _ p: String, _ i: Int, _ j: Int) -> Bool {
            if i == 0 {
                return false
            }
            if p[j - 1] == "." {
                return true
            }
            return s[i - 1] == p[j - 1]
        }
        
        for i in 0...m {
            for j in 1...n {
                let char = p[j - 1]
                if char == "*" {
                    f[i][j] = f[i][j - 2]
                    if matches(s, p, i, j - 1) {
                        f[i][j] = f[i][j] || f[i - 1][j]
                    }
                } else {
                    if matches(s, p, i, j) {
                        f[i][j] = f[i - 1][j - 1]
                    }
                }
            }
        }
        return f[m][n]
    }
    
    /// 11
    func maxArea(_ height: [Int]) -> Int {
        if height.count <= 1 { return 0 }
        var i = 0
        var j = height.count - 1
        var maxArea = 0
        while i != j {
            let left = height[i]
            let right = height[j]
            let area = (j - i) * min(left, right)
            maxArea = max(area, maxArea)
            if left > right {
                j -= 1
            } else {
                i += 1
            }
        }
        return maxArea
    }
    
    /// 12
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
    
    /// 13
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
    
    /// 19
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var i = 0
        var j = 0
        var previousNode: ListNode? = nil
        var leftNode = head
        var rightNode = head
        while rightNode != nil  {
            if j >= n {
                i += 1
                previousNode = leftNode
                leftNode = leftNode?.next
            }
            j +=  1
            rightNode = rightNode?.next
        }
        if i == 0 {
            return head?.next
        } else {
            previousNode?.next = leftNode?.next
        }
        return head
    }
    
    /// 20
    public func isValid_20(_ s: String) -> Bool {
        var stack: [Character] =  []
        var top: Character?
        func updateTop() {
            top = stack.last
        }
        func isMatch(_ left: Character, _ right: Character) -> Bool {
            switch (left, right) {
            case ("{", "}"):  return true
            case ("(", ")"): return true
            case ("[", "]"): return true
            default: return false
            }
        }
        for c in s {
            if "{([".contains(c) {
                stack.append(c)
            } else {
                if let top = top, isMatch(top, c) {
                    stack.removeLast()
                } else {
                    return false
                }
            }
            updateTop()
        }
        return stack.isEmpty
    }
    
    /// 14
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        if strs.count == 1 { return strs[0] }
        func getCommonPrefix(_ s1: String,  _ s2: String) -> String {
            var count = 0
            for i in (0..<min(s1.count, s2.count)) {
                let index1 = s1.index(s1.startIndex, offsetBy: i)
                let index2 = s2.index(s2.startIndex, offsetBy: i)
                if s1[index1] == s2[index2] {
                    count += 1
                } else {
                    break
                }
            }
            return String(s1.prefix(count))
        }
        
        var s = strs[0]
        for i in 1..<strs.count {
            s = getCommonPrefix(s, strs[i])
        }
        return s
    }
    
    /// [15. 三数之和](https://leetcode.cn/problems/3sum/)
    public func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        let nums = nums.sorted()
        let n = nums.count
        
        if n <= 2 { return ans }
        
        for i in 0 ..< n - 2  {
            let num = nums[i]
            if num > 0 { break }
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var left = i + 1
            var right = n - 1
            let target = -num
            while left < right {
                let sum = nums[left] + nums[right]
                if sum == target {
                    ans.append([num, nums[left], nums[right]])
                    left += 1
                    right -= 1
                    while left < right && nums[left] == nums[left - 1] { left += 1 }
                    while left < right && nums[right] == nums[right + 1] { right -= 1 }
                } else if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return ans
    }
    
    /// [16. 最接近的三数之和](https://leetcode.cn/problems/3sum-closest/)
    public func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        let nums = nums.sorted()
        let n = nums.count
        
        var closestNum = nums[0] + nums[1] + nums[2]
        
        for i in 0 ..< n - 2  {
            let num = nums[i]
            if num > 0 { break }
            var left = i + 1
            var right = n - 1
            while left < right {
                let threeSum = nums[left] + nums[right] + num
                if abs(threeSum - target) < abs(closestNum - target) {
                    closestNum = threeSum
                }
                if threeSum > target {
                    right -= 1
                } else if threeSum < target {
                    left += 1
                } else {
                    return target
                }
            }
        }
        return closestNum
    }
    
    /// [17. 电话号码的字母组合](https://leetcode.cn/problems/letter-combinations-of-a-phone-number/)
    public func letterCombinations(_ digits: String) -> [String] {
        let keyboardMap: [Character: [String]] = ["2": ["a", "b", "c"], "3": ["d", "e", "f"],
                          "4": ["g", "h", "i"], "5": ["j", "k", "l"], "6": ["m", "n", "o"],
                          "7": ["p", "q", "r", "s"], "8": ["t", "u", "v"], "9": ["w", "x", "y", "z"]
                        ]
        var ans: [String] = []
        
        func updateAns(_ letters: [String]) {
            var temp: [String] = []
            if ans.isEmpty {
                ans = letters
            } else {
                for letter in letters {
                    for w in ans {
                        temp.append(w + letter)
                    }
                }
                ans = temp
            }
        }
        for letters in digits.compactMap({ return keyboardMap[$0] }) {
            updateAns(letters)
        }
        return ans
    }
    
    /// [18. 四数之和](https://leetcode.cn/problems/4sum/)
    public func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        let n =  nums.count
        let nums = nums.sorted()
        
        var ans: [[Int]] = []
        
        for i in 0 ..< n - 3 {
            let target = target - nums[i]
            for j in i + 1 ..< n - 2  {
                var left = j + 1
                var right = n - 1
                let target = target - nums[j]
                while left < right {
                    let sum = nums[left] + nums[right]
                    if sum == target {
                        let arr = [nums[i], nums[j], nums[left], nums[right]]
                        if !ans.contains(arr) {
                            ans.append([nums[i], nums[j], nums[left], nums[right]])
                        }
                        left += 1
                        right -= 1
                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        
        return ans
    }
    
    /// 21
    public func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let root: ListNode? = ListNode(0)
        var list1 = list1
        var list2 = list2
        var cur = root
        while let l1 = list1, let l2 = list2 {
            let node: ListNode?
            if l1.val < l2.val {
                node = ListNode(l1.val)
                list1 = list1?.next
            } else {
                node = ListNode(l2.val)
                list2 = list2?.next
            }
            cur?.next = node
            cur = node
        }
        cur?.next = list1 ?? list2
        return root?.next
    }
    
    /// 23
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        var nodes: [ListNode] = lists.compactMap({ $0 }).sorted { $0.val < $1.val }
        var res: ListNode?
        var cur: ListNode?
        while let first = nodes.first {
            if res != nil {
                cur?.next = first
                cur =  first
            } else {
                res = first
                cur = res
            }
            cur = first
            nodes.removeFirst()
            if let next = first.next {
                let index = nodes.firstIndex { $0.val > next.val } ?? nodes.count
                nodes.insert(next, at: index)
            }
        }
        return res
    }
    
    /// 25
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var nodesHead: ListNode?
        var node = head
        var nodes: [ListNode] = []
        var previousNode: ListNode?
        while let n = node {
            nodes.append(n)
            node = n.next
            if nodes.count == k {
                nodes = nodes.reversed()
                if nodesHead == nil {
                    nodesHead = nodes.first
                }
                previousNode?.next = nodes.first
                for i in 0..<k-1 {
                    nodes[i].next = nodes[i + 1]
                }
                previousNode = nodes[k - 1]
                nodes.removeAll()
            }
        }
        previousNode?.next = nodes.first
        return nodesHead
    }
    
}


