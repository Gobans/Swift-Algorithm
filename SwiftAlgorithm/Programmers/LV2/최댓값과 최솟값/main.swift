//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/24.
//

import Foundation

func solution(_ s:String) -> String {
    let sArray = s.components(separatedBy: " ")
    let sIntArray = sArray.map{ Int($0)! }
    var answer = "\(String(sIntArray.min()!)) \(String(sIntArray.max()!))"
    return answer
}
