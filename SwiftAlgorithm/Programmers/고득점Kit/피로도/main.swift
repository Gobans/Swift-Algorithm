//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/15.
//

import Foundation

// DFS
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let visited = Array(repeating: false, count: dungeons.count)
    var maxDepth = 0
    func DFS(visited: [Bool], fatigue: Int, depth: Int) {
        if depth > maxDepth {
            maxDepth = depth
        }
        for (i, dungeon) in dungeons.enumerated() {
            let enterFatigue = dungeon[0]
            let consumeFatigue = dungeon[1]
            if !visited[i] && fatigue >= enterFatigue {
                var cVisited = visited
                cVisited[i] = true
                DFS(visited: cVisited, fatigue: fatigue - consumeFatigue, depth: depth + 1)
            }
        }
    }
    DFS(visited: visited, fatigue: k, depth: 0)
    return maxDepth
}

/* 순열
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let dungeonPermutaion = permutation(dungeons, dungeons.count)
    var maxEnterTimes = 0
    for dungeonList in dungeonPermutaion {
        var userFatigue = k
        var enterTimes = 0
        for dungeon in dungeonList {
            let enterFatigue = dungeon[0]
            let consumeFatigue = dungeon[1]
            if userFatigue >= enterFatigue {
                userFatigue -= consumeFatigue
                enterTimes += 1
            } else {
                break
            }
        }
        if enterTimes > maxEnterTimes {
            maxEnterTimes = enterTimes
        }
    }
    return maxEnterTimes
}
*/
