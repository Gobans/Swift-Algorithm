//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/22.
//

import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var answer = 0
    let minLength = lines.map{ $0[0]}.min()!
    let maxLength = lines.map{ $0[1]}.max()!
    for i in minLength...maxLength {
        var count = 0
        for line in lines {
            if line[0] ..< line[1] ~= i {
                count += 1
            }
        }
        if count >= 2 {
            answer += 1
        }
    }
    
    return answer
}
