//
//  SolutionTest_473.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/6/1.
//

import XCTest
@testable import LeetCode

class SolutionTest_473: XCTestCase {
    
    let solution = Solution()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
//        XCTAssertTrue(solution.makesquare([1, 1, 2, 2, 2]))
        XCTAssertTrue(solution.makesquare([5,5,5,5,4,4,4,4,3,3,3,3]))
    }
    
    func testExample2() throws {
        XCTAssertFalse(Solution().makesquare([3, 3, 3, 3, 4]))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
