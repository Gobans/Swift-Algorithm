//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/11.
//

func solution(_ arr:[Int]) -> Double {
    let sum = arr.reduce(0,+)
    return Double(sum) / Double(arr.count)
}
