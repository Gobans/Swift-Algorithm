//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/30.
//

import Foundation

func solution(m: Int, n: Int, puddles: [[Int]]) -> Int {
    var grid: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: m + 1)
    grid[1][1] = 1
    for puddle in puddles {
        grid[puddle[1]][puddle[0]] = -1
    }
    for i in 1...n {
        for j in 1...m {
            if grid[i][j] == -1 {
                grid[i][j] = 0
                continue
            }
            grid[i][j] += (grid[i - 1][j] + grid[i][j - 1]) % 1000000007
        }
    }
    return grid[n][m]
}
