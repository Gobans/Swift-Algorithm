//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/11.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zeroCnt = 0
    var correctCnt = 0
    for lotto in lottos {
        if lotto == 0 {
            zeroCnt += 1
        } else {
            if win_nums.contains(lotto) {
                correctCnt += 1
            }
        }
    }
    let rank = [6,6,5,4,3,2,1]
    return [rank[zeroCnt + correctCnt], rank[correctCnt]]
}
