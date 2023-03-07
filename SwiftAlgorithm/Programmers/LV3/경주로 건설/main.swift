//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/06.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    // board의 돈을 갱신하면서 BFS 로 가장 적은 돈이드는 경로 찾기.
    // '코너'와 '직선'이라는 케이스를 대응하기 위해서 이전에 왔던 방향이 필요함.
    var stack: [(x: Int, y: Int, preDirection: Int, totalCost: Int)] = []
    // none, 상하좌우
    let direction = [0, 1, 2, 3, 4]
    let dx = [0, 0, 0, -1, 1]
    let dy = [0, 1, -1, 0, 0]
    let n = board.count
    var costBoard = Array(repeating: Array(repeating: Array(repeating: Int.max, count: n), count: n), count: 4)
    stack.append((x: 0, y: 0, preDirection: direction[0], totalCost: 0))
    for i in 0..<4 {
        costBoard[i][0][0] = 0
    }
    while !stack.isEmpty {
        let now = stack.removeFirst()
        for i in 1...4 {
            var cost = 600
            if now.preDirection == 0 || now.preDirection == direction[i] {
                cost = 100
            }
            let nx = now.x + dx[i]
            let ny = now.y + dy[i]
            let buildCost = now.totalCost + cost
            if 0..<n ~= nx && 0..<n ~= ny && board[ny][nx] == 0 {
                if costBoard[i-1][ny][nx] > buildCost {
                    costBoard[i-1][ny][nx] = buildCost
                    stack.append((x: nx, y: ny, preDirection: direction[i], totalCost: buildCost))
                }
            }
        }
    }
    return costBoard.map { $0[n-1][n-1] }.min()!
}
