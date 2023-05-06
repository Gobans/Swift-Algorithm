//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/07.
//

import Foundation

func solution(_ n: Int, _ stages: [Int]) -> [Int] {
    var tries = Array(repeating: 0, count: n + 1)

    for lastStage in stages {
        for stage in 0..<lastStage {
            tries[stage] += 1
        }
    }
    var result = [Int:Double]()
    for i in 0..<n {
        result.updateValue(Double(tries[i] - tries[i + 1]) / Double(tries[i]), forKey: i + 1)
    }

    return result.sorted(by: <).sorted(by: {$0.value > $1.value}).map({ $0.key })
}

/* failed
 import Foundation

 func solution(_ N:Int, _ stages:[Int]) -> [Int] {
     var stageDict: [Int: Int] = [:]
     var clearDict: [Int: Int] = [:]
     var failScoreDict: [Int: Double] = [:]
     for i in 1...N {
         stageDict[i] = 0
         clearDict[i] = 0
         failScoreDict[i] = 0
     }
     for stage in stages {
         let stageCnt = stage == N+1 ? N : stage
         if stage != N+1 {
             clearDict[stageCnt]! += 1
         }
         for i in 1...stageCnt {
             stageDict[i]! += 1
         }
     }
     for i in 1...N {
         let failScore = Double(clearDict[i]!) / Double(stageDict[i]!)
         failScoreDict[i] = failScore
     }
     let sortedFailScore = failScoreDict.sorted { (lhs, rhs) in
         if lhs.value > rhs.value {
             return true
         } else if lhs.value == rhs.value {
             return lhs.key < rhs.key
         } else {
             return false
         }
     }.map{ Int($0.key) }
     return sortedFailScore
 }
 */
