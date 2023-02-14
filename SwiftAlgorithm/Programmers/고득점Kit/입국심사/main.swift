//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/14.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var low: Int64 = 1
    var high: Int64 = Int64(times.max()!*n)
    while low < high {
        let mid: Int64 = (low + high) / 2
        var total = 0
        for t in times {
            total += Int(mid) / t
            if total >= n {
                break
            }
        }
        if total >= n {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
