//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/03.
//

import Foundation

func solution(_ s:String) -> String {
    return s.sorted { $0 > $1 }.reduce("") { String($0) + String($1) }
}

/* other's
 
 func solution(_ s:String) -> String {
     return String(s.sorted { $0 > $1 })
 }
 
 */
