//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/24.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let t = Array(t)
    let sliceCnt = p.count - 1
    var answer = 0
    for i in 0..<t.count {
        if i + sliceCnt >= t.count {
            break
        }
        let concatedStr = t[i...i+sliceCnt].map{ String($0)}.joined()
        if Int(concatedStr)! <= Int(p)! {
            answer += 1
        }
    }
    return answer
}
