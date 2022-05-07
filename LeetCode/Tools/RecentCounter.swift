//
//  RecentCounter.swift
//  Solution
//
//  Created by 赵典孟 on 2022/5/6.
//

import Foundation

class RecentCounter {
    
    var miniTime: Int = 0
    
    var pings: [Int] = []

    init() {

    }
    
    func ping(_ t: Int) -> Int {
        pings.append(t)
        updateMiniTime(t)
        return pings.count
    }
    
    private func updateMiniTime(_ t: Int) {
        miniTime = t - 3000
        pings = pings.filter { $0 >= miniTime }
    }
}
