/**
 * # 449. 序列化和反序列化二叉搜索树
 * [LeetCode](https://leetcode.cn/problems/serialize-and-deserialize-bst/)
 *
 * ```
 * // Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 * ```
 */
public class Codec {
    // Encodes a tree to a single string.
    public func serialize(_ root: TreeNode?) -> String {
        func postOrder(_ root: TreeNode?, _ list: inout [Int]) {
            guard let root = root else { return }
            postOrder(root.left, &list)
            postOrder(root.right, &list)
            list.append(root.val)
        }
        
        var list = [Int]()
        postOrder(root, &list)
        return list.map { String($0) }.joined(separator: ",")
    }
    
    // Decodes your encoded data to tree.
    public func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        var list = data.components(separatedBy: ",").map { Int($0)! }
        func construct(_ lower: Int, _ upper: Int) -> TreeNode? {
            guard let last = list.last, last >= lower && last <= upper else {
                return nil
            }
            list.removeLast()
            let root = TreeNode(last)
            root.right = construct(last, upper)
            root.left = construct(lower, last)
            return root
        }
        return construct(Int.min, Int.max)
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
*/
