//
//  SolutionTest+22.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/30.
//

import XCTest
@testable import LeetCode

class SolutionTest_22: XCTestCase {
    
    let solution = Solution()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let n = 3
        let result: Set<String> = ["((()))","(()())","(())()","()(())","()()()"]
        XCTAssertEqual(Set(solution.generateParenthesis(n)), result)
    }

}
