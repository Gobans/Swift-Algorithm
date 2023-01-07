//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/07.
//

import Foundation

// 정렬 배열을 새롭게 만드는 방법으로 풀이
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    for command in commands {
        let slicedArray = array[command[0] - 1...command[1] - 1]
        let sortedSlicedArray = slicedArray.sorted(by: < )
        let element = sortedSlicedArray[command[2] - 1]
        answer.append(element)
    }
    
    return answer
}

/* 원본 배열 유지하는 방법으로 풀이
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    for command in commands {
        var slicedArray = array[command[0] - 1...command[1] - 1]
        slicedArray.sort(by: <)
        let bufferIndex = slicedArray.index(command[2] - 1, offsetBy: slicedArray.startIndex)
        let element = slicedArray[bufferIndex]
        answer.append(element)
    }
    
    return answer
}
*/
