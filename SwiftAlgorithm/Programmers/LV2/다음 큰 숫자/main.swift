//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/24.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    let nBinaryCnt = String(n, radix: 2).filter{ $0 == "1"}.count
    answer = n + 1
    while true {
        if nBinaryCnt == String(answer, radix: 2).filter({ $0 == "1"}).count{
            break
        }
        answer += 1
    }
    return answer
}
