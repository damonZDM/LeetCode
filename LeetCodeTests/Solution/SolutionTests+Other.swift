//
//  SolutionTests+Other.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/12.
//

import XCTest
@testable import LeetCode

extension SolutionTests {
    
    func testPatternMatching() throws {
        XCTAssertTrue(solution.patternMatching("abba", "dogcatcatdog"))
        XCTAssertFalse(solution.patternMatching("abbaa", "dogdogdogdogdog"))
    }
}
