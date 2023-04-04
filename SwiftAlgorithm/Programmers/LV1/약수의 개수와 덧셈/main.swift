//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/04.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    (left...right).forEach{ let divCnt = divisorCnt($0); answer += divCnt%2 == 0 ? $0 : -$0}
    return answer
}

func divisorCnt(_ num: Int) -> Int {
    var cnt = 0
    (1...num).forEach{ if num%$0 == 0 { cnt += 1 } }
    return cnt
}

/* other's
 
 func solution(_ left: Int, _ right: Int) -> Int {
     return (left...right).map { i in (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
 }
 
 */
