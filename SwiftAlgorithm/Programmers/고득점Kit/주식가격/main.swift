//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2022/12/31.
//

import Foundation

func solution(prices: [Int]) -> [Int] {
    var answer: [Int] = []
    let dPrice: [Int] = prices
    var index = dPrice.startIndex
    let lastIndex = dPrice.endIndex
    while (index < lastIndex) {
        let price = dPrice[index]
        var sec = 0
        for q in dPrice[index + 1..<lastIndex] {
            sec += 1
            if price > q {
                break
            }
        }
        index += 1
        answer.append(sec)
    }
    return answer
}
