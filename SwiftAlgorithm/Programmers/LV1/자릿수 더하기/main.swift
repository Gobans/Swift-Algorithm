//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/14.
//

import Foundation

func solution(_ n:Int) -> Int
{
    let nArray = String(n).map{Int(String($0))!}
    var result = 0
    
    for i in 0..<nArray.count{
        result += nArray[i]
    }
    return result
}
