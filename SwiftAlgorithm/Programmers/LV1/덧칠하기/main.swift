//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/09.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var painted = 0
    var answer = 0
    for s in section {
        if painted < s {
            painted = s + m - 1
            answer += 1
        }
    }
    return answer
}
