//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/31.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a,b).map{ $0*$1 }.reduce(0,+)
}

/* other's
 
import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
 return zip(a, b).map(*).reduce(0, +)
}
 
 */
