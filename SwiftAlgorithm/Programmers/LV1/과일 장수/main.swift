//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/05.
//

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let sortedScore = score.sorted(by: >)
    var answer = 0
    var minValue = k
    var count = 0
    for i in 0..<score.count {
        minValue = sortedScore[i]
        count += 1
        if count == m {
            answer += minValue*m
            count = 0
        }
    }
    return answer
}
