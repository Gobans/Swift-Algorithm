//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/01.
//

import Foundation

func solution(_ money: [Int]) -> Int {
    var dp1 = Array(repeating: 0, count: money.count)
    var dp2 = Array(repeating: 0, count: money.count)
    dp1[0] = money[0]
    for i in 1..<money.count - 1 {
        guard i-2 >= 0 else {
            dp1[i] = max(dp1[i-1], dp1[dp1.endIndex - 1] + money[i])
            continue
        }
        dp1[i] = max(dp1[i-1], dp1[i-2] + money[i])
    }
    for i in 1..<money.count {
        guard i-2 >= 0 else {
            dp2[i] = max(dp2[i-1], dp2[dp2.endIndex - 1] + money[i])
            continue
        }
        dp2[i] = max(dp2[i-1], dp2[i-2] + money[i])
    }
    return max(dp1[dp1.endIndex - 2], dp2[dp2.endIndex - 1])
}
