//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/25.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { lcm(a: $0, b: $1)}
}

func gcd(a: Int, b: Int) -> Int {
    let r = a%b
    if r != 0 {
        return gcd(a: b, b: r)
    } else {
        return b
    }
}

func lcm(a: Int, b: Int) -> Int {
    return a * b / gcd(a: a, b: b)
}
