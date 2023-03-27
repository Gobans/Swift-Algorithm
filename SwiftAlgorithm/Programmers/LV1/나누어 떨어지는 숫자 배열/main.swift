//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/29.
//

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let answer = arr.filter{ $0%divisor == 0}.sorted(by: <)
    return answer.isEmpty ? [-1] : answer
}
