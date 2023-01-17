//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/16.
//

import Foundation

// BFS
func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var minDiff = 100
    func BFS(towerGraph: [[Bool]]) {
        var visited = Array(repeating: false, count: n + 1)
        var stack: [Int] = []
        stack.append(1)
        visited[1] = true
        while !stack.isEmpty {
            let checkPoint = stack.removeLast()
            for i in 1...n {
                if !visited[i] && towerGraph[checkPoint][i] {
                    visited[i] = true
                    stack.append(i)
                }
            }
        }
        let firstTowers = visited.filter{ $0 == true }.count
        let secondTowers = n - firstTowers
        let diff = abs(firstTowers - secondTowers)
        if diff < minDiff {
            minDiff = diff
        }
    }
    for i in 0..<wires.count {
        var cWires = wires
        cWires.remove(at: i)
        let towerGraphLine = Array(repeating: false, count: n + 1)
        var towerGraph: [[Bool]] = Array(repeating: towerGraphLine, count: n + 1)
        for wire in cWires {
            let startPoint = wire[0]
            let endPoint = wire[1]
            towerGraph[startPoint][endPoint] = true
            towerGraph[endPoint][startPoint] = true
        }
        BFS(towerGraph: towerGraph)
    }

    return minDiff
}

/* DFS
func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var minDiff = 100
    func DFS(towerGraph: [[Bool]], lineIndex: Int, visited: inout [Bool], towerCount: inout Int) {
        for i in 1...n {
            if !visited[i] && towerGraph[lineIndex][i] {
                visited[i] = true
                towerCount += 1
                DFS(towerGraph: towerGraph, lineIndex: i, visited: &visited, towerCount: &towerCount)
            }
        }
    }
    for i in 0..<wires.count {
        var cWires = wires
        cWires.remove(at: i)
        let towerGraphLine = Array(repeating: false, count: n + 1)
        var towerGraph: [[Bool]] = Array(repeating: towerGraphLine, count: n + 1)
        for wire in cWires {
            let startPoint = wire[0]
            let endPoint = wire[1]
            towerGraph[startPoint][endPoint] = true
            towerGraph[endPoint][startPoint] = true
        }
        var visited = Array(repeating: false, count: n + 1)
        var towerCount = 0
        DFS(towerGraph: towerGraph, lineIndex: 1, visited: &visited, towerCount: &towerCount)
        let secondTowers = n - towerCount
        let diff = abs(towerCount - secondTowers)
        if diff < minDiff {
            minDiff = diff
        }
    }

    return minDiff
}
 */
