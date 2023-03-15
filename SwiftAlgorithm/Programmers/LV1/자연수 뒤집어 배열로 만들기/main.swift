//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/15.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    return String(n).map{ Int(String($0))! }.reversed()
}

/* other's

 func solution(_ n:Int64) -> [Int] {
     return String(n).reversed().compactMap { Int(String($0)) }
 }
 
 */
