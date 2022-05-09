//
//  MyQueueTests.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/8.
//

import XCTest
@testable import LeetCode

class MyQueueTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var ans = [Int?]()
        let queue = MyQueue()
        queue.push(1)
        ans.append(nil)
        queue.push(2)
        ans.append(nil)
        ans.append(queue.pop())
        queue.push(3)
        ans.append(nil)
        queue.push(4)
        ans.append(nil)
        ans.append(queue.pop())
        ans.append(queue.peek())
        XCTAssertEqual(ans, [nil, nil, 1, nil, nil, 2, 3])
    }

}
