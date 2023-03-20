//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/20.
//

import Foundation

func solution(_ x:Int) -> Bool {
    return x%String(x).map{ Int(String($0))! }.reduce(0,+) == 0
}
