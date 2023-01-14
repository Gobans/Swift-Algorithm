//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/14.
//

import Foundation

let n = Int(readLine()!)!
let stoneStatue: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var leftAwake: [Int] = []
var rightAwake: [Int] = []
var maxLeft = 0
var maxRight = 0
for direction in stoneStatue {
    if direction == 1 {
        leftAwake.append(1)
        if !rightAwake.isEmpty {
            rightAwake.removeLast()
        }
        if leftAwake.count > maxLeft {
            maxLeft = leftAwake.count
        }
    } else {
        rightAwake.append(1)
        if !leftAwake.isEmpty {
            leftAwake.removeLast()
        }
        if rightAwake.count > maxRight {
            maxRight = rightAwake.count
        }
    }
}
print(max(maxLeft, maxRight))
