//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/24.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    var answer = 0
    if a <= b {
        answer = (a...b).reduce(0,+)
    } else {
        answer = (b...a).reduce(0,+)
    }
    return Int64(answer)
}
