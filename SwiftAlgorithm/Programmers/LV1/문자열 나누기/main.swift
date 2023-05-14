//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/15.
//

import Foundation

func solution(_ s:String) -> Int {
    let sArr = Array(s).map{String($0)}
    var seperateStart = false
    var xCnt = 0
    var otherCnt = 0
    var x = sArr[0]
    var answer = 0
    for idx in 0..<sArr.count {
        if !seperateStart {
            x = sArr[idx]
            seperateStart = true
        }
        if sArr[idx] == x {
            xCnt += 1
        } else {
            otherCnt += 1
        }
        if xCnt == otherCnt {
            answer += 1
            xCnt = 0
            otherCnt = 0
            seperateStart = false
        }
    }
    if xCnt != otherCnt {
        answer += 1
    }
    return answer
}
