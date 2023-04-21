//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/21.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    let binaryArr1 = arr1.map{ String($0, radix: 2) }
    let binaryArr2 = arr2.map{ String($0, radix: 2) }
    for (m1, m2) in zip(binaryArr1, binaryArr2) {
        var m1Arr = Array(m1)
        var m2Arr = Array(m2)
        while m1Arr.count < n {
            m1Arr.insert("0", at:0)
        }
        while m2Arr.count < n {
            m2Arr.insert("0", at:0)
        }
        var rStr = ""
        for (r1, r2) in zip(m1Arr, m2Arr) {
            if r1 == "1" || r2 == "1" {
                rStr += "#"
            } else {
                rStr += " "
            }
        }
        answer.append(rStr)
    }
    return answer
}

/* other's

 func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {

     return (0..<n).map {
         let binary = String(arr1[$0] | arr2[$0], radix: 2)
         let padded = String(repeating: "0", count: n - binary.count) + binary
         return padded.reduce("") { $0 + ($1 == "0" ? " " : "#") }
     }
 }

 */
