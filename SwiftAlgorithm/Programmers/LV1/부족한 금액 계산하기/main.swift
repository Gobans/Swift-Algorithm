//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/04.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let sum = (1...count).map{ $0*price }.reduce(0,+)
    return money >= sum ? Int64(0) : Int64(abs(money-sum))
}
