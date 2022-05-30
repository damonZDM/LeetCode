//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by 赵典孟 on 2022/5/7.
//

import XCTest
@testable import LeetCode

class LeetCodeTests: XCTestCase {
    
    let solution = Solution()
    
    func testFindLadders() throws {
        
        if true {
            
            let beginWord = "hit"
            let endWord = "cog"
            let wordList = ["hot","dot","dog","lot","log","cog"]
            let res = solution.findLadders(beginWord, endWord, wordList)
            XCTAssertEqual(res, ["hit", "hot", "dot", "dog", "log", "cog"])
        }
        
//        if true {
//            let beginWord = "qa"
//            let endWord = "sq"
//            let wordList =   ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"]
//            let res = solution.findLadders(beginWord, endWord, wordList)
//            print(res)
//        }
    }
    
}
