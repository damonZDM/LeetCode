//
//  Solution+546.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/5/9.
//

import Foundation

extension Solution {
    /**
    # 546. 移除盒子
     [LeetCode](https://leetcode.cn/problems/remove-boxes/)
     
     ```Java
     // Java解法
     class Solution {
         int[][][] dp;

         public int removeBoxes(int[] boxes) {
             int length = boxes.length;
             dp = new int[length][length][length];
             return calculatePoints(boxes, 0, length - 1, 0);
         }

         public int calculatePoints(int[] boxes, int l, int r, int k) {
             if (l > r) {
                 return 0;
             }
             if (dp[l][r][k] == 0) {
                 int r1 = r, k1 = k;
                 while (r1 > l && boxes[r1] == boxes[r1 - 1]) {
                     r1--;
                     k1++;
                 }
                 dp[l][r][k] = calculatePoints(boxes, l, r1 - 1, 0) + (k1 + 1) * (k1 + 1);
                 for (int i = l; i < r1; i++) {
                     if (boxes[i] == boxes[r1]) {
                         dp[l][r][k] = Math.max(dp[l][r][k], calculatePoints(boxes, l, i, k1 + 1) + calculatePoints(boxes, i + 1, r1 - 1, 0));
                     }
                 }
             }
             return dp[l][r][k];
         }
     }
     ```
     */
    public func removeBoxes(_ boxes: [Int]) -> Int {
        
        let len = boxes.count
        var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: len), count: len), count: len)
        
        func calculatePoints(_ boxes: [Int], _ l: Int, _ r: Int, _ k: Int) -> Int {
            if l > r {
                return 0
            }
            if dp[l][r][k] == 0 {
                var r1 = r
                var k1 = k
                while r1 > r && boxes[r1] == boxes[r1 - 1] {
                    r1 -= 1
                    k1 += 1
                }
                dp[l][r][k] = calculatePoints(boxes, l, r1 - 1, 0) + (k1 + 1) * (k1 + 1)
                for i in l..<r1 {
                    if boxes[i] == boxes[r1] {
                        dp[l][r][k] = max(dp[l][r][k], calculatePoints(boxes, l, i, k1 + 1) + calculatePoints(boxes, i + 1, r1 - 1, 0))
                    }
                }
            }
            return dp[l][r][k]
        }
        
        return calculatePoints(boxes, 0, len - 1, 0)
    }
}
