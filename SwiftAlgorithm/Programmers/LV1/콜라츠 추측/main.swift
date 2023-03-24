//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/24.
//

import Foundation

func solution(_ num:Int) -> Int {
    var workCnt = 0
    var guessNum = num
    if guessNum == 1 {
        return 0
    }
    while workCnt < 500 {
        workCnt += 1
        if guessNum%2 == 0 {
            guessNum = guessNum/2
        } else {
            guessNum = guessNum*3 + 1
        }
        if guessNum == 1 {
            return workCnt
        }
    }
    return -1
}
