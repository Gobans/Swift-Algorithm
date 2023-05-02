//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/02.
//

import Foundation
func solution(_ n:Int) -> Int {
    var count = 0
    var isPrime = true
    for target in stride(from: 1, through: n, by: 2) {
        isPrime = true
        
        for i in stride(from: 2, through: sqrt(Double(target)), by: 1) {
            if target % Int(i) == 0 {
                isPrime = false
                break
            }
        }
        
        if isPrime { count += 1 }
    }
    
    return count
}
