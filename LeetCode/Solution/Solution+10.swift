//
//  Solution+0.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/9.
//

import Foundation

extension Solution {
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
}
