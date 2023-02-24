//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/24.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var excutionCnt = 0
    var deleteCnt = 0
    while s != "1" {
        var cnt = 0
        (s, cnt) = binaryConvert(s)
        excutionCnt += 1
        deleteCnt += cnt
    }
    return [excutionCnt, deleteCnt]
}

func binaryConvert(_ s: String) -> (String, Int) {
    var convertedString = ""
    var deleteCnt = 0
    for c in s {
        if c == "0" {
            deleteCnt += 1
        }
    }
    let binaryCnt = s.count - deleteCnt
    convertedString = String(binaryCnt, radix: 2)
    return (convertedString, deleteCnt)
}
