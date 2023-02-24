//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/24.
//

import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    var s = Array(s)
    var now = s[0]
    stack.append(now)
    
    for c in s[1...] {
        if now == c {
            stack.removeLast()
            if !stack.isEmpty {
                now = stack[stack.endIndex - 1]
            } else {
                now = "?"
            }
        } else {
            now = c
            stack.append(c)
        }
    }
    if stack.isEmpty {
        return 1
    }
    
    return 0
}
