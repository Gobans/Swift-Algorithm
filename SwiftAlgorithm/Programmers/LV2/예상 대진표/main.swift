//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/25.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var round = 0
    var a = a
    var b = b
    while true {
        round += 1
        if a % 2 == 1 && a == b - 1{
            break
        } else if a % 2 == 0 && a == b + 1 {
            break
        }
        a = a%2 == 1 ? a/2 + 1 : a/2
        b = b%2 == 1 ? b/2 + 1 : b/2
    }

    return round
}
