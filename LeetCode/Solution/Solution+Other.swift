//
//  Solution+Other.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/7.
//

import Foundation

extension Solution {
    
    /**
     面试题 04.03. 特定深度节点链表
     [LeetCode](https://leetcode-cn.com/problems/list-of-depth-lcci/)
     */
    func listOfDepth(_ tree: TreeNode?) -> [ListNode?] {
        guard let tree = tree else {
            return []
        }
        var subs: [TreeNode] = [tree]
        var nodes: [ListNode?] = []
        while !subs.isEmpty {
            var listNodeHead: ListNode?
            var listNodeTail: ListNode?
            for node in subs {
                if listNodeHead == nil {
                    listNodeHead = ListNode(node.val)
                    listNodeTail = listNodeHead
                } else {
                    let newNode = ListNode(node.val)
                    listNodeTail?.next = newNode
                    listNodeTail = newNode
                }
            }
            nodes.append(listNodeHead)
            
            var newTreeNodes: [TreeNode] = []
            for node in subs {
                if let left = node.left {
                    newTreeNodes.append(left)
                }
                if let right = node.right {
                    newTreeNodes.append(right)
                }
            }
            subs = newTreeNodes
        }
        return nodes
    }
    
    func countRectangles(_ rectangles: [[Int]], _ points: [[Int]]) -> [Int] {
        var counts: [Int] = [Int](repeating: 0, count: points.count)
        for rect in rectangles {
            var i = 0
            for point in points {
                if rect[0] >= point[0] && rect[1] >= point[1] {
                    counts[i] += 1
                }
                i += 1
            }
            
        }
        
        return counts
    }
    
//    func intersection(_ nums: [[Int]]) -> [Int] {
//        if nums.isEmpty { return [] }
//        var set = Set(nums[0])
//
//        for i in 1..<nums.count {
//            let list = nums[i]
//            set = set.intersection(Set(list))
//        }
//
//        return set.sorted()
//    }
    
//    func countLatticePoints(_ circles: [[Int]]) -> Int {
//
//        func singleCircleSet(_ circle: [Int]) -> Set<DPoint> {
//            let r = circle[2]
//            let x = circle[0]
//            let y = circle[1]
//            var points = [DPoint]()
//            for i in (x - r)...(x + r) {
//                for j in (y - r)...(y + r) {
//                    if (x - i) * (x - i) + (y - j) * (y - j) <= r * r {
//                        points.append(DPoint(x: i, y: j))
//                    }
//                }
//            }
//            return Set(points)
//        }
//
//        var set = Set<DPoint>()
//        for c in circles {
//            set = set.union(singleCircleSet(c))
//        }
//        return set.count
//    }
    
//    func myAtoi(_ s: String) -> Int {
//        var num: Int = 0
//        var prefix: Int = 1
//        var isStart = false
//        for char in s {
//            if isStart {
//                if "1234567890".contains(char) {
//                    num = (num * 10 + Int(String(char))!)
//                } else {
//                    break
//                }
//            } else {
//                switch char {
//                case "0","1", "2", "3", "4", "5", "6", "7", "8", "9":
//                    num = Int(String(char))!
//                    isStart = true
//                case "-":
//                    prefix = -1
//                    isStart = true
//                case "+":
//                    isStart = true
//                case " ":
//                    continue
//                default:
//                    return 0
//                }
//            }
//            if num * prefix <= -2147483648 {
//                return -2147483648
//            } else if num * prefix >= 2147483647 {
//                return 2147483647
//            }
//        }
//        return num * prefix
//    }
    
    // 883. 三维形体投影面积
//    func projectionArea(_ grid: [[Int]]) -> Int {
//        let xy = grid.reduce(0) { $0 + $1.filter { $0 > 0 }.count }
//        let xz = grid.reduce(0) { $0 + $1.max()! }
//        let maxCount = (grid.max { $0.count > $1.count })?.count ?? 0
//        var yzList = [Int](repeating: 0, count: maxCount)
//        for i in 0..<grid.count {
//            for j in 0..<grid[i].count {
//                if grid[i][j] > yzList[j] {
//                    yzList[j] = grid[i][j]
//                }
//            }
//        }
//        let yz = yzList.reduce(0, +)
//        return xy + xz + yz
//    }
    
    // 整数反转
//    func reverse(_ x: Int) -> Int {
//        var nums = [Int]()
//        var num = abs(x)
//        while num != 0 {
//            let n = num % 10
//            num = num / 10
//            nums.append(n)
//        }
//        let result = nums.reduce(0) { $0 * 10 + $1 } * (x > 0 ? 1 : -1)
//        guard result >= Int32.min && result <= Int32.max else { return 0 }
//        return result
//    }
    
//    398. 随机数索引
//    var numsMap: [Int: [Int]] = [:]
//
//    init(_ nums: [Int]) {
//        nums.enumerated().forEach {
//            let indexs = numsMap[$0.element] ?? [Int]()
//            numsMap[$0.element] = indexs + [$0.offset]
//        }
//    }
//
//    func pick(_ target: Int) -> Int {
//        numsMap[target]?.randomElement() ?? 0
//    }
    
//    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
//        let charSet: CharacterSet = ["!", "?", ",", ";", "'", ".", " "]
//        let words = paragraph.components(separatedBy: charSet).filter { !$0.isEmpty }
//        var wordsMap: [String: Int] = [:]
//        var maxWord: String = ""
//        var maxCount = 0
//        words.forEach {
//            let word = $0.lowercased()
//            let count = (wordsMap[word] ?? 0) + 1
//            wordsMap[word] = count
//            if maxCount < count && !banned.contains(word) {
//                maxWord = word
//                maxCount = count
//            }
//        }
//        return maxWord
//    }
//
//    // 两数之和
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var targetMap: [Int: Int] = [:]
//        for e in nums.enumerated() {
//            let num = e.element
//            let key = target - num
//            if let value = targetMap[key] {
//                return [value, e.offset]
//            } else {
//                targetMap[num] = e.offset
//            }
//        }
//        return []
//    }
//
//    // 两数相加
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var result: [ListNode] = []
//        var carry: Int = 0
//        var list1 = l1
//        var list2 = l2
//        repeat {
//            let l1Value = list1?.val ?? 0
//            let l2Value = list2?.val ?? 0
//            let val = (l1Value + l2Value + carry) % 10
//            carry = (l1Value + l2Value + carry) / 10
//            let node = ListNode(val)
//            if let previous = result.last {
//                previous.next = node
//            }
//            result.append(node)
//            list1 = list1?.next
//            list2 = list2?.next
//        } while list1 != nil || list2 != nil || carry != 0
//        return result.first
//    }
//
//    // 4. 寻找两个正序数组的中位数
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        let totalCount = nums1.count + nums2.count
//        var m = 0
//        var n = 0
//        var center: Double = 0
//        for i in 0...(totalCount / 2) {
//            let value: Int = min(nums1[safe: m], nums2[safe: n])
//            if totalCount % 2 == 0 {
//                if i == totalCount / 2 - 1 {
//                    center = Double(value)
//                } else if i == totalCount / 2 {
//                    center = (Double(center) + Double(value)) / 2
//                }
//            } else {
//                if i == totalCount / 2 {
//                    center = Double(value)
//                }
//            }
//            if nums1[safe: m] < nums2[safe: n] {
//                m += 1
//            } else {
//                n += 1
//            }
//        }
//        return center
//    }
//
//    func lexicalOrder(_ n: Int) -> [Int] {
//        var nums: [Int] = []
//        var num = 1
//        for _ in 1...n {
//            nums.append(num)
//            if num * 10 <= n {
//                num *= 10
//            } else {
//                while num % 10 == 9 || num + 1 > n {
//                    num = Int(floor(Double(num) / 10))
//                }
//                num += 1
//            }
//
//        }
//        return nums
//    }
    
    // 最长回文子串 解法1：动态规划 O(n^2)
//    func longestPalindrome(_ s: String) -> String {
//        let len = s.count
//        if len == 1 { return s }
//        var dp = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: len), count: len)
//        for i in 0..<len {
//            dp[i][i] = true
//        }
//        var begin = 0
//        var maxLen = 1
//        for L in 2...len {
//            for i in 0..<len {
//                let j = i + L - 1
//                if j >= len {
//                    break
//                }
//                let iIndex = s.index(s.startIndex, offsetBy: i)
//                let jIndex = s.index(s.startIndex, offsetBy: j)
//                if s[iIndex] != s[jIndex] {
//                    dp[i][j] = false
//                } else {
//                    if j - i < 3 {
//                        dp[i][j] = true
//                    } else {
//                        dp[i][j] = dp[i+1][j-1]
//                    }
//                }
//                if dp[i][j] && j - i + 1 > maxLen {
//                    maxLen = j - i + 1
//                    begin = i
//                }
//            }
//        }
//
//        return (s as NSString).substring(with: NSMakeRange(begin, maxLen))
//    }
    
    /// 最长回文子串 解法2：中心扩散 O(n^2)
//    func longestPalindrome(_ s: String) -> String {
//
//        let startIndex = s.startIndex
//        func expand(_ left: Int, _ right: Int) -> Int {
//            var i = left
//            var j = right
//            var len = 0
//            if i == j {
//                i -= 1
//                j += 1
//                len += 1
//            }
//            while i >= 0, j < s.count, s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)]  {
//                len += 2
//                i -= 1
//                j += 1
//            }
//            return len
//        }
//
//        let len = s.count
//        var start = 0
//        var end = 0
//        for i in 0..<(len - 1) {
//            let len1 = expand(i, i)
//            let len2 = expand(i, i + 1)
//            let length = max(len1, len2)
//            if length > end - start {
//                start = i - (length - 1) / 2
//                end = i + length / 2
//            }
//        }
//        return String(s[s.index(startIndex, offsetBy: start)...s.index(startIndex, offsetBy: end)])
//    }
//
//    // 字符最短距离
//    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
//        if s.isEmpty { return [] }
//        // 获取所有c的下标
//        var indexs = [Int]()
//        s.enumerated().forEach {
//            if c == $0.element {
//                indexs.append($0.offset)
//            }
//        }
//        var answer = [Int]()
//
//        var begin: Int = -1
//
//        for index in indexs {
//            defer { begin = index }
//            if begin == -1 {
//                // 特殊处理 first
//                if index >= 1 {
//                    answer += Array(1...index).reversed()
//                }
//            } else {
//                answer.append(0)
//
//                let distance = (index - begin) / 2
//
//                if distance >= 1 {
//                    answer += Array(1...distance)
//                    if (index - begin + 1) % 2 == 0 {
//                        answer += Array(1...distance).reversed()
//                    } else {
//                        answer += Array(1..<distance).reversed()
//                    }
//                }
//            }
//        }
//        // 特殊处理结尾
//        if begin >= 0, s.count > begin {
//            answer += Array(0..<(s.count - begin))
//        }
//        return answer
//    }
//
//    // 219. 存在重复元素
//    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
//        typealias Value = [Int]
//        var maps: [Int: Int] = [:]
//        for i in 0..<nums.count {
//            let num = nums[i]
//            if let value = maps[num], i - value <= k {
//                 return true
//            } else {
//                maps[num] = i
//            }
//        }
//        return false
//    }
//
//    // 388. 文件的最长绝对路径
//    func lengthLongestPath(_ input: String) -> Int {
//
//        func isFile(_ name: String) -> Bool { name.contains(".") }
//        func depthAndName(_ name: String) -> (Int, String) {
//            var depth = 0
//            var fileName = name
//            while fileName.hasPrefix("\t"), let range = fileName.range(of: "\t") {
//                depth += 1
//                fileName.removeSubrange(range)
//            }
//            return (depth, fileName)
//        }
//
//
//        let components = input.components(separatedBy: "\n")
//        var maxLen = 0
//        var levels = [String]()
//        var levelsLen = 0
//
//        func updateLevelsLength() { levelsLen = levels.joined(separator: #"\"#).count }
//
//        for element in components {
//            let (depth, name) = depthAndName(element)
//            if levels.count > depth {
//                levels.removeSubrange(depth...)
//                updateLevelsLength()
//            }
//
//            if isFile(name) {
//                let len = levelsLen + name.count + (depth == 0 ? 0 : 1)
//                maxLen = max(maxLen, len)
//            } else {
//                levels.append(name)
//                updateLevelsLength()
//            }
//        }
//        return maxLen
//    }
//
//    // 824. 山羊拉丁文
//    func toGoatLatin(_ sentence: String) -> String {
//        var result = ""
//        let vowels: [String] = ["a", "e", "i", "o", "u"]
//        var word = ""
//        var prefix = ""
//        var isWordBegin: Bool = true
//        let ma = "ma"
//        var i = 1
//        for char in sentence {
//            if char == " " {
//                result.append(word + prefix + ma + String(repeating: "a", count: i) + " ")
//                i += 1
//                prefix = ""
//                word = ""
//                isWordBegin = true
//                continue
//            }
//
//            if isWordBegin {
//                if vowels.contains(char.lowercased()) {
//                    word.append(char)
//                } else {
//                    prefix = String(char)
//                }
//                isWordBegin = false
//            } else {
//                word.append(char)
//            }
//        }
//        return result + word + prefix + ma + String(repeating: "a", count: i)
//    }
//
//    // 396. 旋转函数
//    func maxRotateFunction(_ nums: [Int]) -> Int {
//        let n = nums.count
//        let numSum = nums.reduce(0, +)
//        var f = nums.enumerated().reduce(0) { $0 + $1.element * $1.offset }
//        var maxSum = f
//        for k in 1..<n {
//            f = f + numSum - n * nums[n - k]
//            maxSum = max(f, maxSum)
//        }
//        return maxSum
//    }
//
//    // 587. 安装栅栏
//    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
//        if trees.count <= 3 { return trees }
//        func cross(_ p: [Int], _ q: [Int], _ r: [Int]) -> Int { (q[0] - p[0]) * (r[1] - q[1]) - (q[1] - p[1]) * (r[0] - q[0]) }
//        let sortedTrees = trees.sorted {
//            return $0[0] == $1[0] ? ($0[1] < $1[1]) : ($0[0] < $1[0])
//        }
//        var stock: [Int] = []
//        stock.append(0)
//        var used = [Bool](repeating: false, count: trees.count)
//        for i in 1..<sortedTrees.count {
//            while stock.count > 1 && cross(sortedTrees[stock[stock.count - 2]], sortedTrees[stock[stock.count - 1]], sortedTrees[i]) < 0 {
//                used[stock.last!] = false
//                stock.removeLast()
//            }
//            used[i] = true
//            stock.append(i)
//        }
//        let m = stock.count
//        for i in (0...sortedTrees.count - 2).reversed() {
//            if !used[i] {
//                while stock.count > m && cross(sortedTrees[stock[stock.count - 2]], sortedTrees[stock[stock.count - 1]], sortedTrees[i]) < 0 {
//                    stock.removeLast()
//                }
//                stock.append(i)
//            }
//
//        }
//        stock.removeLast()
//        return stock.map { sortedTrees[$0] }
//    }
    
    // 868. 二进制间距
//    func binaryGap(_ n: Int) -> Int {
//        let str = String(n, radix: 2)
//        var previous = 0
//        var maxDistance = 0
//        for e in str.enumerated() {
//            if e.element == "1" {
//                maxDistance = max(e.offset - previous, maxDistance)
//                previous = e.offset
//            }
//        }
//        return maxDistance
//    }
    
    // 6. Z 字形变换
//    func convert(_ s: String, _ numRows: Int) -> String {
//        if s.count < 3 || numRows == 1 { return s }
//        let n = numRows * 2 - 2
//        let num = Int(ceil(Double(s.count) / Double(n)))
//        var array: [[String]] = [[String]](repeating: [String](repeating: "", count: num * (numRows - 1)), count: numRows)
//        var i = 0
//        for char in s {
//            let j = i % n
//            switch j {
//            case 0..<numRows:
//                array[j][i / n * (numRows - 1)] = String(char)
//            default:
//                let x = 2 * numRows - 2 - j
//                let y = i / n * (numRows - 1) + (j - numRows) + 1
//                array[x][y] = String(char)
////                print(x, y, char)
//                break
//            }
//            i += 1
//        }
//        return array.reduce("") { $0 + $1.reduce("", + ) }
//    }
}
