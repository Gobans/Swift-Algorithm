//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/18.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    var x = 0
    var squreX = 0
    while squreX < n {
        x += 1
        squreX = x*x
    }
    return squreX > n ? Int64(-1) : Int64((x+1)*(x+1))
}

/* other's
 
func solution(_ n:Int64) -> Int64 {
 let t = Int64(sqrt(Double(n)))
 return t * t == n ? (t+1)*(t+1) : -1
}
 
 */
