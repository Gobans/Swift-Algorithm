//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/10.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let supoja:[[Int]] = [[1,2,3,4,5],[2,1,2,3,2,4,2,5],[3,3,1,1,2,2,4,4,5,5]]
    var supojaCorrects: [Int] = []
    var answer: [Int] = []
    for supojaIndex in 0...2 {
        var pickIndex = 0
        var correctCnt = 0
        for answer in answers {
            if answer == supoja[supojaIndex][pickIndex] {
                correctCnt += 1
            }
            pickIndex += 1
            if pickIndex == supoja[supojaIndex].count {
                pickIndex = 0
            }
        }
        supojaCorrects.append(correctCnt)
    }
    let maxCorrect = supojaCorrects.max()!
    for supojaNum in 0...2 {
        if supojaCorrects[supojaNum] == maxCorrect {
            answer.append(supojaNum + 1)
        }
    }
    
    return answer
}
