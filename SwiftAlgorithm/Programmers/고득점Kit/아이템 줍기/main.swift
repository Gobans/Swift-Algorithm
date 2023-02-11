//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/11.
//

import Foundation

func solution(_ rectangle: [[Int]], _ characterX:Int, characterY:Int, itemX: Int, itemY: Int) -> Int {
    var answer = 0
    var field = Array(repeating: Array(repeating: -1, count: 102), count: 102)
    
    for r in rectangle {
        let coordinates = r.map{ $0*2 }
        let x1 = coordinates[0]
        let y1 = coordinates[1]
        let x2 = coordinates[2]
        let y2 = coordinates[3]
        
        for i in y1...y2 {
            for j in x1...x2 {
                if x1 < j && j < x2 && y1 < i && i < y2 {
                    field[i][j] = 0
                } else if field[i][j] != 0 {
                    field[i][j] = 1
                }
            }
        }
    }
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    var stack: [(Int, Int)] = []
    stack.append((characterX * 2, characterY * 2))
    var visited = Array(repeating: Array(repeating: 1, count: 102), count: 102)
    
    while !stack.isEmpty {
        let (x, y) = stack.removeFirst()
        if x == itemX * 2 && y == itemY * 2 {
            answer = visited[y][x] / 2
            break
        }
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            if field[ny][nx] == 1 && visited[ny][nx] == 1 {
                stack.append((nx, ny))
                visited[ny][nx] = visited[y][x] + 1
            }
        }
    }
    return answer
}
