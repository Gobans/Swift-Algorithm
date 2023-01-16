//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/16.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // DFS, 전선을 하나 끊었을 떄 하나의 간선이 몇개 이어져있는지 확인
    // 전체 송전탑 - 이어진 송전탑 = 또 다른 송전탑의 갯수
    // 두개의 송전탑 개수의 차이
    var minDiff = 100
    func BFS(towerGraph: [[Bool]], k: Int) {
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
        BFS(towerGraph: towerGraph, k: i + 1)
    }
    
    return minDiff
}
