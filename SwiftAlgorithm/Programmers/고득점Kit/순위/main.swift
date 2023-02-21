//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/20.
//

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    var win:[[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    
    results.forEach{ win[$0[0]][$0[1]] = 1 }
    
    checkMiddleByFloyd(win: &win, n: n)
    
    return canKnowRankCount(results: results, win: win, n: n)
}

func checkMiddleByFloyd(win:inout [[Int]],n:Int) {
    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                if  win[i][j] == 1 && win[k][i] == 1 {
                    win[k][j] = 1
                }
            }
        }
    }
}

func canKnowRankCount(results:[[Int]],win:[[Int]],n:Int) -> Int {
    var total:Int =  0
    for i in 1...n {
        var count:Int = 0
        for j in 1...n {
            if win[i][j] == 1 || win[j][i] == 1 {
                count += 1
            }
        }
        if count == n-1 {
            total += 1
        }
    }
    return total
}

