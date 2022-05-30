//
//  Solution+1021.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/28.
//

import Foundation

extension Solution {
    
    /// [1021. 删除最外层的括号](https://leetcode.cn/problems/remove-outermost-parentheses/)
    public func removeOuterParentheses(_ s: String) -> String {
        var ans = ""
        var deep = 0
        for c in s {
            if c == "(" {
                deep += 1
                if deep > 1 {
                    ans.append(c)
                }
            } else {
                deep -= 1
                if deep > 0 {
                    ans.append(c)
                }
            }
        }
        return ans
    }
    
    /// [1022. 从根到叶的二进制数之和](https://leetcode.cn/problems/sum-of-root-to-leaf-binary-numbers/)
    public func sumRootToLeaf(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ val: Int) -> Int {
            guard let node = node else {
                return 0
            }
            let val = (val << 1) | node.val
            if node.left == nil && node.right == nil {
                return val
            }
            return dfs(node.left, val) + dfs(node.right, val)
        }
        return dfs(root, 0)
    }
}
 
