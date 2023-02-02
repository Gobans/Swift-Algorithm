//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/02.
//

import Foundation

func solution(_ maps: [[Int]]) -> Int {
    var maps = maps
    let n = maps[0].count
    let m = maps.count
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [1,-1,0,0]
    var queue: [(Int, Int)] = []
    queue.append((0,0))
    maps[0][0] = 1
    while !queue.isEmpty {
        let element = queue.removeFirst()
        let x = element.0
        let y = element.1
        for i in 0...3 {
            let dx = x + dx[i]
            let dy = y + dy[i]
            if dx >= 0 && dx < n && dy >= 0 && dy < m {
                if maps[dy][dx] == 0 {
                    continue
                }
                if maps[dy][dx] == 1 {
                    maps[dy][dx] = maps[y][x] + 1
                    queue.append((dx,dy))
                }
            }
        }
    }
    return maps[maps.endIndex - 1][maps.endIndex - 1] == 1 ? -1 : maps[maps.endIndex - 1][maps.endIndex - 1]
}
