//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/20.
//

import Foundation

func solution(_ name:String) -> Int {
    // 조이스틱의 이동을 코드로 작성.
    // 조이스틱의 커서 이동 시 "A" 라면 카운트를 무시함
    // A 에서 아래로 이동 or 위로 이동, 더 짧은 것을 문자 변경 횟수로 사용함.
    let targetArray: [String] = name.map{ String($0) }
    var currentAray: [String] = Array(repeating: "A", count: targetArray.count)
    var index = 0
    let totalMoveCnt = searchMinimumPath(current: currentAray, target: targetArray)
    var answer = 0

    while currentAray != targetArray {
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
        index += 1
    }
    
    return answer + totalMoveCnt
}

func searchMinimumPath(current: [String], target: [String]) -> Int {
    var rightPath = 0
    var leftPath = 1
    if current.count == 1 {
        return 0
    }
    for c in 1...current.endIndex - 1 {
        if current[c] != target[c] {
            rightPath = c
        }
    }
    var cnt = 1
    for c in stride(from: current.endIndex - 1, to: 0, by: -1) {
        if current[c] != target[c] {
            leftPath = cnt
        }
        cnt += 1
    }
    return min(rightPath, leftPath)
}

let name = "GTAAAABAASKKAE"
// "가장 많이 A를 제외할 수 있을 떄?"
print(solution(name))
