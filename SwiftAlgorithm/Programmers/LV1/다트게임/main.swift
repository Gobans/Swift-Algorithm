//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/07.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    let powDict: [Character: Double] = ["S": 1, "D": 2, "T": 3]
    var scores: [Double] = []
    var score: Double = 0
    for c in dartResult {
        if c.isNumber {
            score = score * 10 + Double(String(c))!
        } else if c.isLetter {
            let powScore = pow(score, powDict[c]!)
            scores.append(powScore)
            score = 0
        } else {
            if c == "*" {
                for index in [scores.endIndex - 1, scores.endIndex - 2] where index >= 0 {
                    scores[index] *= 2
                }
            }
            if c == "#" {
                let target = scores.removeLast()
                scores.append(target * -1)
            }
        }
    }
    return Int(scores.reduce(0,+))
}
