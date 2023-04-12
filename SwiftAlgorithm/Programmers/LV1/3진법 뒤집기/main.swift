//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/13.
//

import Foundation

func solution(_ n:Int) -> Int {
    let radixStr = String(n, radix: 3)
    let answer = Int(String(radixStr.reversed()), radix: 3)!
    return answer
}


