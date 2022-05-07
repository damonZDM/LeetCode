//
//  Solution+427.swift
//  Solution
//
//  Created by 赵典孟 on 2022/4/29.
//

import Foundation

public class Node {
     public var val: Bool
     public var isLeaf: Bool
     public var topLeft: Node?
     public var topRight: Node?
     public var bottomLeft: Node?
     public var bottomRight: Node?
     public init(_ val: Bool, _ isLeaf: Bool) {
         self.val = val
         self.isLeaf = isLeaf
         self.topLeft = nil
         self.topRight = nil
         self.bottomLeft = nil
         self.bottomRight = nil
     }
}

enum Direction {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

extension Solution {
    
    /**
     * Definition for a QuadTree node.
     * public class Node {
     *     public var val: Bool
     *     public var isLeaf: Bool
     *     public var topLeft: Node?
     *     public var topRight: Node?
     *     public var bottomLeft: Node?
     *     public var bottomRight: Node?
     *     public init(_ val: Bool, _ isLeaf: Bool) {
     *         self.val = val
     *         self.isLeaf = isLeaf
     *         self.topLeft = nil
     *         self.topRight = nil
     *         self.bottomLeft = nil
     *         self.bottomRight = nil
     *     }
     * }
     */

    func construct(_ grid: [[Int]]) -> Node? {
        
        let (isLeaf, val) = getIsLeafAndVal(grid)
        
        let node = Node(val, isLeaf)
        
        if !isLeaf {
            node.topLeft = construct(getGrid(grid, .topLeft))
            node.topRight = construct(getGrid(grid, .topRight))
            node.bottomLeft = construct(getGrid(grid, .bottomLeft))
            node.bottomRight = construct(getGrid(grid, .bottomRight))
        }
        
        return node
    }
    
    func getIsLeafAndVal(_ grid: [[Int]]) -> (Bool, Bool) {
        let value = grid[0][0]
        if grid.count <= 1 { return (true, value == 1) }
        for row in grid {
            for n in row {
                if n != value {
                    return (false, n == 1)
                }
            }
        }
        return (true, value == 1)
    }
    
    func getGrid(_ origin: [[Int]], _ direction: Direction) -> [[Int]] {
        let rows = origin.count
        let newCount = rows / 2
        let startRow: Int
        let startCol: Int
        switch direction {
        case .topLeft:
            startRow = 0
            startCol = 0
        case .topRight:
            startRow = 0
            startCol = newCount
        case .bottomLeft:
            startRow = newCount
            startCol = 0
        case .bottomRight:
            startRow = newCount
            startCol = newCount
        }
        
        var grid = [[Int]]()
        for i in 0..<newCount {
            let gridRow = origin[i + startRow]
            var list = [Int]()
            for j in 0..<newCount {
                list.append(gridRow[startCol + j])
            }
            grid.append(list)
        }
        return grid
    }
}
