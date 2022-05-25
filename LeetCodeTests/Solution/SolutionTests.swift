//
//  SolutionTests.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/9.
//

import XCTest
@testable import LeetCode

class SolutionTests: XCTestCase {
    
    let solution = Solution()

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
    
    func test_436() throws {
        XCTAssertEqual(solution.findRightInterval([[1, 2]]), [-1])
        XCTAssertEqual(solution.findRightInterval([[3,4],[2,3],[1,2]]), [-1,0,1])
        XCTAssertEqual(solution.findRightInterval([[1,4],[2,3],[3,4]]), [-1,2,-1])
    }
    
    func test_442() throws {
        let result = solution.findDuplicates([4,3,2,7,8,2,3,1])
        XCTAssertEqual(Set(result), Set([3, 2]), "Test Solution No.442")
    }
    
    func test_461() throws {
        XCTAssertEqual(solution.hammingDistance(1, 4), 2)
        XCTAssertEqual(solution.hammingDistance(3, 1), 1)
    }
    
    func test_462() throws {
        XCTAssertEqual(solution.minMoves2([1, 2, 3]), 2)
        XCTAssertEqual(solution.minMoves2([1, 10, 2, 9]), 16)
    }
    
    func test_467() throws {
        XCTAssertEqual(solution.findSubstringInWraproundString("a"), 1)
        XCTAssertEqual(solution.findSubstringInWraproundString("cac"), 2)
        XCTAssertEqual(solution.findSubstringInWraproundString("zab"), 6)
        XCTAssertEqual(solution.findSubstringInWraproundString("cdefghefghijklmnopqrstuvwxmnijklmnopqrstuvbcdefghijklmnopqrstuvwabcddefghijklfghijklmabcdefghijklmnopqrstuvwxymnopqrstuvwxyz"), 339)
        let promise = expectation(description: "Test 467 Suceess")
        DispatchQueue.main.async { [self] in
            XCTAssertEqual(self.solution.findSubstringInWraproundString("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"), 33475)
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5.0)
        
    }
    
    func test_546() throws {
        XCTAssertEqual(solution.removeBoxes([1,3,2,2,2,3,4,3,1]), 23)
        XCTAssertEqual(solution.removeBoxes([1,1,1]), 9)
        XCTAssertEqual(solution.removeBoxes([1]), 1)
        XCTAssertEqual(solution.removeBoxes([1,2,2,1,1,1,2,1,1,2,1,2,1,1,2,2,1,1,2,2,1,1,1,2,2,2,2,1,2,1,1,2,2,1,2,1,2,2,2,2,2,1,2,1,2,2,1,1,1,2,2,1,2,1,2,2,1,2,1,1,1,2,2,2,2,2,1,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,1,1,1,1,2,2,1,1,1,1,1,1,1,2,1,2,2,1]), 2758)
    }
    
    func test_668() throws {
        XCTAssertEqual(solution.findKthNumber(3, 3, 5), 3)
        XCTAssertEqual(solution.findKthNumber(2, 3, 6), 6)
        XCTAssertEqual(solution.findKthNumber(30000, 30000, 5), 3)
    }
    
    func test_675() throws {
        XCTAssertEqual(solution.cutOffTree([[1,2,3],[0,0,0],[7,6,5]]), -1)
        XCTAssertEqual(solution.cutOffTree([[54581641,64080174,24346381,69107959],[86374198,61363882,68783324,79706116],[668150,92178815,89819108,94701471],[83920491,22724204,46281641,47531096],[89078499,18904913,25462145,60813308]]), 57)
    }
    
    func test_812() throws {
        XCTAssertEqual(solution.largestTriangleArea([[1,0],[0,0],[0,1]]), 0.5)
        XCTAssertEqual(solution.largestTriangleArea([[0,0],[0,1],[1,0],[0,2],[2,0]]), 2)
    }

    func test_942() throws {
        XCTAssertEqual(solution.diStringMatch("IDID"), [0, 4, 1, 3, 2])
        
        XCTAssertEqual(solution.diStringMatch("III"), [0, 1, 2, 3])
        
        XCTAssertEqual(solution.diStringMatch("DDI"), [3, 2, 0, 1])
    }
    
    func test_944() throws {
        XCTAssertEqual(solution.minDeletionSize(["cba","daf","ghi"]), 1)
        XCTAssertEqual(solution.minDeletionSize(["a", "b"]), 0)
        XCTAssertEqual(solution.minDeletionSize(["zyx","wvu","tsr"]), 3)
    }
    
    func test_953() throws {
        XCTAssertTrue(solution.isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
        XCTAssertFalse(solution.isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz"))
        XCTAssertFalse(solution.isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz"))
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
    
    func test_1812() throws {
        XCTAssertTrue(solution.squareIsWhite("a1") == false)
        XCTAssertTrue(solution.squareIsWhite("h3") == true)
        XCTAssertTrue(solution.squareIsWhite("c7") == false)
    }
    
    func test_2191() throws {
        XCTAssertEqual(solution.sortJumbled([8,9,4,0,2,1,3,5,7,6], [991,338,38]), [338,38,991])
        XCTAssertEqual(solution.sortJumbled([0,1,2,3,4,5,6,7,8,9], [789,456,123]), [123,456,789])
        XCTAssertEqual(solution.sortJumbled([9,8,7,6,5,4,3,2,1,0], [0,1,2,3,4,5,6,7,8,9]), [9,8,7,6,5,4,3,2,1,0])
        
    }

}
