//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/19.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var sortedLost = lost.sorted(by: < )
    var suitDict: [Int:Bool] = [:]
    var count = 0
    for suitNum in reserve {
        if sortedLost.contains(suitNum) {
            let removeIndex = sortedLost.firstIndex(of: suitNum)
            sortedLost.remove(at: removeIndex!)
            count += 1
            continue
        }
        suitDict[suitNum] = true
    }
    for lostNum in sortedLost {
        if let suit = suitDict[lostNum - 1], suit == true {
            suitDict[lostNum - 1] = false
            count += 1
            continue
        }
        if let suit = suitDict[lostNum + 1], suit == true {
            suitDict[lostNum + 1] = false
            count += 1
            continue
        }
    }
    let answer = n - lost.count + count
    return answer
}
