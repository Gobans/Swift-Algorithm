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
    var costBoard = Array(repeating: Array(repeating: 20000, count: n), count: n)
    var directionBoard = Array(repeating: Array(repeating: 0, count: n), count: n)
    stack.append((x: 0, y: 0, preDirection: direction[0], totalCost: 0))
    costBoard[0][0] = 0
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
                // 코스트가 더 들지만 다른 방향에서 온 경우? (무한루프..)
                if directionBoard[ny][nx] != 0 && directionBoard[ny][nx] != direction[i] && costBoard[ny][nx] <= buildCost {
                    stack.append((x: nx, y: ny, preDirection: direction[i], totalCost: buildCost))
                } else if costBoard[ny][nx] > buildCost {
                    costBoard[ny][nx] = buildCost
                    directionBoard[ny][nx] = direction[i]
                    stack.append((x: nx, y: ny, preDirection: direction[i], totalCost: buildCost))
                }
            }
        }
    }
    board.forEach{ print($0) }
    print("----")
    costBoard.forEach{ print($0) }
    return costBoard[n-1][n-1]
}

print(solution([[0, 0, 0, 0, 0], [0, 1, 1, 1, 0], [0, 0, 1, 0, 0], [1, 0, 0, 0, 1], [0, 1, 1, 0, 0]]))
