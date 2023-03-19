//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/19.
//

import Foundation

func solution(_ s:String) -> Int {
    var sArr = Array(s)
    var answer = ""
    var isNegative = false
    if sArr[0] == "+" {
        sArr.removeFirst()
    } else if sArr[0] == "-" {
        sArr.removeFirst()
        isNegative = true
    }
    sArr.forEach{ answer += String($0) }
    return isNegative ? -Int(answer)! : Int(answer)!
}

/* other's
 
 func solution(_ s:String) -> Int {
     return Int(s)!
 }
 
 그냥 Int(String) 해주면 앞의 '+', '-' 문자열도 처리가 되는듯..!
 
 */
