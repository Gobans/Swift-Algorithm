//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/14.
//

// 시간초과.. 왜지..?
import Foundation

let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let n = input[0]
let m = input[1]
var dounutMap: [[Int]] = []

for _ in 1...n {
    let dounutline: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    dounutMap.append(dounutline)
}

let directions: [[Int]] = [[1,0], [-1,0], [0,1], [0,-1]]

func searchPath(x:Int, y: Int) {
    var stack: [(Int,Int)] = []
    stack.append((x,y))
    while !stack.isEmpty {
        let coordinate = stack.removeLast()
        let x = coordinate.0
        let y = coordinate.1
        dounutMap[y][x] = 1
        for direction in directions {
            let directionX = direction[0]
            let directionY = direction[1]
            var movedX = x + directionX
            var movedY = y + directionY
            if movedX == m {
                movedX = 0
            } else if movedX < 0 {
                movedX = m - 1
            }
            if movedY == n {
                movedY = 0
            } else if movedY < 0 {
                movedY = n - 1
            }
            if dounutMap[movedY][movedX] == 0 {
                dounutMap[movedY][movedX] = 1
                stack.append((movedX, movedY))
            }
        }
    }
}

var answer = 0
for y in 0..<n {
    for x in 0..<m {
        if dounutMap[y][x] == 0 {
            searchPath(x: x, y: y)
            answer += 1
        }
    }
}
print(answer)
