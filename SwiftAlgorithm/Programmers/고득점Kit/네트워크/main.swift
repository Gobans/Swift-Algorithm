//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/03.
//

import Foundation

// DFS
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var connectMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var isVisited: [Bool] = Array(repeating: false, count: n)
    var cnt = 0
    for i in 0..<n {
        for j in 0..<n {
            if computers[i][j] == 1 {
                connectMap[i][j] = 1
            }
        }
    }
    func DFS(node: Int) {
        for idx in 0..<n  {
            if !isVisited[idx] && connectMap[node][idx] == 1 {
                isVisited[idx] = true
                DFS(node: idx)
            }
        }
    }
    for i in 0..<n {
        if !isVisited[i] {
            isVisited[i] = true
            cnt += 1
            DFS(node: i)
        }
    }
    return cnt
}

/* BFS
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var connectMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var isVisited: [Bool] = Array(repeating: false, count: n)
    var cnt = 0
    for i in 0..<n {
        for j in 0..<n {
            if computers[i][j] == 1 {
                connectMap[i][j] = 1
            }
        }
    }
    var queue: [Int] = []
    for i in 0..<n {
        if !isVisited[i] {
            queue.append(i)
            cnt += 1
            isVisited[i] = true
            while !queue.isEmpty {
                let node = queue.removeFirst()
                for k in 0..<n {
                    if !isVisited[k] && connectMap[node][k] == 1 {
                        isVisited[k] = true
                        queue.append(k)
                    }
                }
            }
        }
    }
    return cnt
}
*/
