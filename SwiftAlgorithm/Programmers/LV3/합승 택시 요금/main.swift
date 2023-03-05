//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/03.
//

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var answer = Int.max
    var graph = Array(repeating: Array(repeating: 200*100000, count: n + 1), count: n + 1)
    fares.forEach { fare in
        let (c, d, f) = (fare[0], fare[1], fare[2])
        graph[c][d] = f
        graph[d][c] = f
    }
    for i in 1...n {
        graph[i][i] = 0
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
    for mid in 1...n {
        answer = min(answer, graph[s][mid] + graph[mid][a] + graph[mid][b] )
    }
    return 0
}
