//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/15.
//

import Foundation

var answer = 0
var stack: [Int] = []

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boxArr: [[Int]] = Array(repeating: [], count: board.count+1)
    for box in board.reversed() {
        for i in 0..<box.count {
            if box[i] != 0 {
                boxArr[i+1].append(box[i])
            }
        }
    }
    for move in moves {
        if !boxArr[move].isEmpty {
            let doll = boxArr[move].removeLast()
            stack.append(doll)
            popingDoll()
        }
    }
    return answer
}

func popingDoll() {
    while stack.count >= 2 {
        if stack[stack.endIndex-2] == stack.last! {
            stack.removeLast()
            stack.removeLast()
            answer += 2
        } else {
            break
        }
    }
}
