//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/04.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var answer: [Int] = []
    var stack: [Int]  = []
    var minScore = 0
    for i in 0..<score.count {
        let day = i + 1
        stack.append(score[i])
        stack.sort(by: >)
        if day > k {
            stack.removeLast()
        }
        minScore = stack.last!
        answer.append(minScore)
    }
    return answer
}
