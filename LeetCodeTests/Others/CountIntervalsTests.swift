//
//  CountIntervalsTests.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/21.
//

import XCTest
@testable import LeetCode
 
class CountIntervalsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let countIntervals = CountIntervals()
        countIntervals.add(571, 770)
        XCTAssertEqual(countIntervals.count(), 200)
        countIntervals.add(920, 996)
        XCTAssertEqual(countIntervals.count(), 277)
        countIntervals.add(65, 512)
        XCTAssertEqual(countIntervals.count(), 725)
        countIntervals.add(959, 959)
        XCTAssertEqual(countIntervals.count(), 725)
        countIntervals.add(313, 330)
        countIntervals.add(473, 928)
        XCTAssertEqual(countIntervals.count(), 932)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
