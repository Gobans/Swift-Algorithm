//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/11.
//

import Foundation

func solution(_ n:Int) -> Int {
    var k = 1
    var answer = 0
    while k <= n {
        if n % k == 0 {
            answer += k
        }
        k += 1
    }
    return answer
}
