//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/15.
//

import Foundation

func deleteRocks(start: Int, end: Int, rocks: [Int], n: Int) -> Bool {
    let mid = (start + end) / 2
    var count = 0
    var prevRock = 0
    for rock in rocks {
        if rock - prevRock < mid {
            count += 1
            if count > n {
                break
            }
        } else {
            prevRock = rock
        }
    }
    return count <= n
}

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted(by: <)
    var start = 0
    var end = distance
    var answer = 0
    while start <= end {
        let mid = (start + end) / 2
        // 삭제된 바위가 n과 같거나 적을 때
        if deleteRocks(start: start, end: end, rocks: rocks, n: n) {
            answer = mid
            start = mid + 1
        }
        // 삭제된 바위가 n보다 더 많을 때
        else {
            end = mid - 1
        }
    }
    return answer
}
