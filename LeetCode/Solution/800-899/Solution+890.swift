//
//  Solution+890.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/12.
//

import Foundation

extension Solution {
    
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        func isMatching(_ word: String) -> Bool {
            var fromMap: [Character: Character] = [:]
            var toMap: [Character: Character] = [:]
            for i in 0 ..< pattern.count {
                let p = pattern[i]
                let w = word[i]
                if fromMap[p] != nil || toMap[w] != nil {
                    if let from = fromMap[p], from != w {
                        return false
                    }
                    if let to = toMap[w], to != p {
                        return false
                    }
                } else {
                    fromMap[p] = w
                    toMap[w] = p
                }
            }
            return true
        }
        var ans = [String]()
        for word in words {
            if isMatching(word) {
                ans.append(word)
            }
        }
        return ans
    }
}
