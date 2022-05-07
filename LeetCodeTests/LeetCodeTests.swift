//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/7.
//

import XCTest
@testable import LeetCode

class LeetCodeTests: XCTestCase {
    
    let solution = Solution()
    
    func test1566Example() throws {
        let arr = [1, 2, 1, 2, 1,3]
        let m =  2
        let k = 3
        let result = solution.containsPattern(arr, m, k)
        XCTAssertFalse(result, "Test Solution No.1566")
    }

}
