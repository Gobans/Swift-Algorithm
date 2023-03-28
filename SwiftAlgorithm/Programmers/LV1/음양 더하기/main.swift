//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/30.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0
    for (a,s) in zip(absolutes, signs) {
        var num = s ? a : -a
        answer += num
    }
    return answer
}

/* other's
 
 func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
     return (0..<absolutes.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
 }
 
 */
