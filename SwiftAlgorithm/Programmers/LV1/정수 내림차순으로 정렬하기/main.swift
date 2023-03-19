//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/19.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    var numString = Array(String(n))
    var answer = ""
    numString.sort(by: >)
    numString.forEach{ answer += String($0) }
    return Int64(answer)!
}

/* other's
 
 func solution(_ n:Int64) -> Int64 {
     var numString = Array(String(n))
     var answer = ""
     numString.sort(by: >)
     numString.forEach{ answer += String($0) }
     return Int64(answer)!
 }
 
 */
