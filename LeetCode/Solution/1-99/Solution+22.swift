//
//  Solution+22.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/30.
//

import Foundation

extension Solution {
    /// [22. 括号生成](https://leetcode.cn/problems/generate-parentheses/)
    func generateParenthesis(_ n: Int) -> [String] {
        func dfs(_ text: String, _ n: Int, _ deep: Int) -> [String] {
            if n == 0 && deep == 0 {
                return [text]
            }
            var ans: [String] = []
            if n > 0 {
                ans.append(contentsOf: dfs(text + "(", n - 1, deep + 1))
            }
            if deep != 0 {
                ans.append(contentsOf: dfs(text + ")", n, deep - 1))
            }
            return ans
        }
        return dfs("", n, 0)
    }
}
