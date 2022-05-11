//
//  CodeCTests.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/11.
//

import XCTest
@testable import LeetCode

class CodeCTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let node3 = TreeNode(3)
        let node1 = TreeNode(1)
        let node2 = TreeNode(2, node1, node3)
        let ser = Codec()
        let deser = Codec()
        let tree: String = ser.serialize(node2)
        let ans = deser.deserialize(tree)
        XCTAssertEqual(ans, node2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
