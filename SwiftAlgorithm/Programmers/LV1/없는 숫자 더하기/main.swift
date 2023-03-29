//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/30.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    return (1...9).filter{ !numbers.contains($0) }.reduce(0,+)
}
