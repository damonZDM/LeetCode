//
//  SolutionTest_890.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/6/12.
//

import XCTest

@testable import LeetCode

class SolutionTest_890: XCTestCase {

    let solution = Solution()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual(solution.findAndReplacePattern(["abc","deq","mee","aqq","dkd","ccc"], "abb"), ["mee", "aqq"])
    }


}
