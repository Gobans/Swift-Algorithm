//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/30.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    let minNum = arr.min()!
    let answer = arr.filter{ $0 != minNum }
    return answer.isEmpty ? [-1] : answer
}
