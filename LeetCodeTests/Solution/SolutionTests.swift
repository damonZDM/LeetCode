//
//  SolutionTests.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/9.
//

import XCTest
@testable import LeetCode

class SolutionTests: XCTestCase {
    
    private let solution = Solution()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setup")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("tear down")
    }
    
    func test_10() throws {
        XCTAssertTrue(solution.isMatch("aac", "a.*"))
    }
    
    func test_442() throws {
        let result = solution.findDuplicates([4,3,2,7,8,2,3,1])
        XCTAssertEqual(Set(result), Set([3, 2]), "Test Solution No.442")
    }
    
    func test_546() throws {
        XCTAssertEqual(solution.removeBoxes([1,3,2,2,2,3,4,3,1]), 23)
        XCTAssertEqual(solution.removeBoxes([1,1,1]), 9)
        XCTAssertEqual(solution.removeBoxes([1]), 1)
        XCTAssertEqual(solution.removeBoxes([1,2,2,1,1,1,2,1,1,2,1,2,1,1,2,2,1,1,2,2,1,1,1,2,2,2,2,1,2,1,1,2,2,1,2,1,2,2,2,2,2,1,2,1,2,2,1,1,1,2,2,1,2,1,2,2,1,2,1,1,1,2,2,2,2,2,1,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,1,1,1,1,2,2,1,1,1,1,1,1,1,2,1,2,2,1]), 2758)
    }

    func test_942() throws {
        XCTAssertEqual(solution.diStringMatch("IDID"), [0, 4, 1, 3, 2])
        
        XCTAssertEqual(solution.diStringMatch("III"), [0, 1, 2, 3])
        
        XCTAssertEqual(solution.diStringMatch("DDI"), [3, 2, 0, 1])
    }
    
    func test_1566() throws {
        let arr = [1, 2, 1, 2, 1,3]
        let m =  2
        let k = 3
        let result = solution.containsPattern(arr, m, k)
        XCTAssertFalse(result, "Test Solution No.1566")
    }
    
    func test_1752() throws {
        XCTAssertTrue(solution.check([3, 4, 5, 1, 2]))
        XCTAssertTrue(solution.check([1, 1, 1]))
        XCTAssertFalse(solution.check([2, 1, 3, 4]))
        XCTAssertTrue(solution.check([1, 2, 3]))
        XCTAssertFalse(solution.check([1, 3, 2]))
    }

}
