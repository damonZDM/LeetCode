//
//  Solution+929.swift
//  LeetCode
//
//  Created by 赵典孟 on 2022/6/4.
//

import Foundation

extension Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var set: Set<String> = []
        func uniqueEmail(_ email: String) -> String {
            var ans = ""
            var state = 0
            for c in email {
                switch (state, c) {
                case (0, "."):
                    continue
                case (0, "+"):
                    state = 1
                case (_, "@"):
                    state = 2
                    ans.append(c)
                case (1, _):
                    continue
                default:
                    ans.append(c)
                }
            }
            return ans
        }
        for email in emails {
            set.insert(uniqueEmail(email))
        }
        return set.count
    }
}
