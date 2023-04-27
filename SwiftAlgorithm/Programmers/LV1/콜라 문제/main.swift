//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/27.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var remain = n
    var answer = 0
    while remain >= a {
        remain -= a
        answer += b
        remain += b
    }
    return answer
}
