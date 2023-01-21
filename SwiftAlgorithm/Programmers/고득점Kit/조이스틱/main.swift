//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/20.
//

import Foundation

func solution(_ name:String) -> Int {
    let targetArray: [String] = name.map{ String($0) }
    var currentAray: [String] = Array(repeating: "A", count: targetArray.count)
    var minMove = targetArray.count - 1
    var answer = 0

    for index in 0..<targetArray.count {
        if currentAray[index] != targetArray[index] {
            var currentChar = currentAray[index]
            var updownCnt = 0
            while currentChar != targetArray[index] {
                currentChar = String(UnicodeScalar(UnicodeScalar(currentChar)!.value + 1)!)
                updownCnt += 1
            }
            currentAray[index] = currentChar
            answer += min(updownCnt, 26 - updownCnt)
        }

        var endIdx = index + 1
        while endIdx < targetArray.count && targetArray[endIdx] == "A" {
            endIdx += 1
        }

        let moveFront = index * 2 + (currentAray.count - endIdx)
        let moveBack = (currentAray.count - endIdx) * 2 + index

        minMove = min(minMove, moveFront)
        minMove = min(minMove, moveBack)
    }
    return answer + minMove
}
