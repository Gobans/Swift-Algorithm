//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/29.
//

import Foundation

func solution(triangle:[[Int]]) -> Int {
    var answer = 0
    var nTriangle = triangle.map { [0] + $0 + [0] }
    for i in 1..<nTriangle.count {
        for j in 1...i+1 {
            nTriangle[i][j] += max(nTriangle[i-1][j-1], nTriangle[i-1][j])
        }
    }
    answer = nTriangle[nTriangle.endIndex - 1].max()!
    return answer
}
