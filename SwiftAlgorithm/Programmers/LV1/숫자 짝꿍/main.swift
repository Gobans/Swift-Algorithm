//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/12.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var dictX: [String:Int] = [:]
    var dictY: [String:Int] = [:]
    var numList: [String] = []
    
    for x in X.map({ String($0) }) {
        dictX[x] = (dictX[x] ?? 0) + 1
    }
    
    for y in Y.map({ String($0) }) {
        dictY[y] = (dictY[y] ?? 0) + 1
    }
    
    for key in dictX.keys {
        numList += Array(repeating: key, count: min((dictX[key] ?? 0), (dictY[key] ?? 0)))
    }
    
    if numList.isEmpty { return "-1" }
    
    if numList.filter({ $0 == "0" }).count == numList.count { return "0" }

    return numList.sorted(by: >).joined()
}
