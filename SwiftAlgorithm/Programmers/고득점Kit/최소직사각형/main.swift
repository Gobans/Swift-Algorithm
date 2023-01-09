//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/09.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let sortedSizes = sizes.sorted { lhs, rhs in
        return lhs[0]*lhs[1] > rhs[0]*rhs[1]
    }
    let maxSize = sizes.max { lhs, rhs in
        return lhs.max()! <= rhs.max()!
    }!
    let someMax = maxSize.max()!
    var someSize = 0
    while true {
        var isPossible = true
        for size in sortedSizes {
            if (someSize < size[0] && someSize < size[1] ) {
                isPossible = false
                break
            }
        }
        if isPossible {
            return someMax*someSize
        }
        someSize += 1
    }
    return someSize
}
