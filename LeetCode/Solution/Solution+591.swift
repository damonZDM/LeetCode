//
//  Solution+591.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/2.
//

import Foundation

extension Solution {
    
    func isValid(_ code: String) -> Bool {
        var tags: [String] = []
        
        var i = 0
        while i < code.count {
            let char = code[code.index(code.startIndex, offsetBy: i)]
            switch char {
            case "<":
                let index = code.index(code.startIndex, offsetBy: i)
                let tail = String(code[index...])
                if tail.hasPrefix("</") {
                    let tag = getCloseTag(tail)
                    if let last = tags.last, last == tag {
                        tags.removeLast()
                        i += (tag.count + 3)
                        if tags.count == 0 && i != code.count {
                            return false
                        }
                    } else {
                        return false
                    }
                } else if tail.hasPrefix("<![CDATA[") {
                    if tags.count == 0 { return false }
                    let cdata = getCDataString(tail)
                    if cdata.count > 0 {
                        i += cdata.count
                    } else {
                        return false
                    }
                } else {
                    let tag = getStartTag(tail)
                    if tag.count > 0 && tag.count <= 9 {
                        tags.append(tag)
                        i += tag.count + 2
                    } else {
                        return false
                    }
                }
            default:
                if tags.count > 0 {
                    i += 1
                } else {
                    return false
                }
            }
        }
        return tags.isEmpty
    }
    
    private func getStartTag(_ s: String) -> String {
        if s.count < 3 { return "" }
        if let first = s.first, first == "<" {
            var name = ""
            for i in 1..<s.count {
                let c = s[s.index(s.startIndex, offsetBy: i)]
                if ("A"..."Z").contains(c) {
                    name.append(c)
                } else if c == ">" {
                    return name
                } else {
                    return ""
                }
            }
        }
        return ""
    }
    
    private func getCloseTag(_ s: String) -> String {
        if s.count < 4 { return "" }
        if s.hasPrefix("</") {
            var name = ""
            for i in 2..<s.count {
                let c = s[s.index(s.startIndex, offsetBy: i)]
                if ("A"..."Z").contains(c) {
                    name.append(c)
                } else if c == ">" {
                    return name
                } else {
                    return ""
                }
            }
        }
        return ""
    }
    
    private func getCDataString(_ s: String) -> String {
        if s.count < 13 { return "" }
        if s.hasPrefix("<![CDATA[") {
            for i in 9..<s.count - 2 {
                let begin = s.index(s.startIndex, offsetBy: i)
                let end = s.index(s.startIndex, offsetBy: i + 2)
                if s[begin...end] == "]]>" {
                    return String(s[s.startIndex...end])
                }
            }
        }
        return ""
    }
}
