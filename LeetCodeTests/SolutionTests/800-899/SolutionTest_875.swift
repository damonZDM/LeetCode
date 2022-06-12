//
//  Solution_875.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/6/7.
//

import XCTest
@testable import LeetCode

class SolutionTest_875: XCTestCase {

    let solution = Solution()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
//        XCTAssertEqual(solution.minEatingSpeed([3,6,7,11], 8), 4)
//        XCTAssertEqual(solution.minEatingSpeed([30,11,23,4,20], 5), 30)
//        XCTAssertEqual(solution.minEatingSpeed([30,11,23,4,20], 6), 23)
        XCTAssertEqual(solution.minEatingSpeed([312884470], 968709470), 1)
    }


}
