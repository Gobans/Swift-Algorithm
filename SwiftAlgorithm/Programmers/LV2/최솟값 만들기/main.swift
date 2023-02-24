//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/24.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    var A = A
    var B = B
    A.sort(by: <)
    B.sort(by: >)
    for i in 0..<A.count {
        ans += A[i] * B[i]
    }

    return ans
}
