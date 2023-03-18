//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/18.
//

import Foundation

func solution(_ n:Int) -> Int {
    var x = 1
    while n%x != 1 {
        x += 1
    }
    return x
}
