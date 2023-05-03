//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/03.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                if isPrime(nums[i]+nums[j]+nums[k]) {
                    answer += 1
                }
            }
        }
    }

    return answer
}

func isPrime(_ num: Int) -> Bool {
    for i in stride(from: 2, through: sqrt(Double(num)), by: 1) {
        if num % Int(i) == 0 {
            return false
        }
    }
    return true
}
