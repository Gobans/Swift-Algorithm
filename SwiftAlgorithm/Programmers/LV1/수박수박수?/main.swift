//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/31.
//

import Foundation

func solution(_ n:Int) -> String {
    return (1...n).map{ return $0%2 == 1 ? "수" : "박" }.joined()
}
