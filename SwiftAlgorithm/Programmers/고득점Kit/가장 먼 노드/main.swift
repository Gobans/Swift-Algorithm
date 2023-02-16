//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/16.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n + 1)
    var isVisited = Array(repeating: false, count: n + 1)
    edge.forEach{ graph[$0[0]].append($0[1]);graph[$0[1]].append($0[0]) }
    
    var currentNodes:Set = [1]
    var nodeCnt = 0
    while !currentNodes.isEmpty {
        var nodes = Set<Int>()
        var isStepIn = false
        currentNodes.forEach{ isVisited[$0] = true }
        for node in currentNodes {
            for number in graph[node] {
                if !isVisited[number] {
                    if !isStepIn {
                        isStepIn = true
                        nodeCnt = 0
                    }
                    isVisited[number] = true
                    nodes.insert(number)
                    nodeCnt += 1
                }
            }
        }
        currentNodes = nodes
    }
    return nodeCnt
}

/* BFS 시간초과
func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // 간선을 따라 탐색 (BFS)
    // depth 가 낮은 쪽으로 그래프를 업데이트
    var graph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    var isVisited = Array(repeating: false, count: n + 1)
    for i in 0..<edge.count {
        let e = edge[i]
        graph[e[0]][e[1]] = 1
        graph[e[1]][e[0]] = 1
    }
    var farNodeDepth = 0
    var farNodeCnt = 0
    var queue: [(Int, Int)] = []
    queue.append((1,0))
    isVisited[1] = true
    while !queue.isEmpty {
        let (num, depth) = queue.removeFirst()
        if farNodeDepth < depth {
            farNodeDepth = depth
            farNodeCnt = 1
        } else {
            farNodeCnt += 1
        }
        for i in 1...n {
            if !isVisited[i] && graph[num][i] == 1 {
                isVisited[i] = true
                queue.append((i, depth + 1))
            }
        }
    }
    return farNodeCnt
}
*/
