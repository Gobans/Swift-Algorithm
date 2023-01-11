//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/11.
//

import Foundation

func solution(_ numbers:String) -> Int {
    var answer = 0
    var madePermuString = Set<String>()
    let splitedNumbers = numbers.map{ $0 }
    for targetNum in 1...splitedNumbers.count {
        let permuByTargetNum = permutation(splitedNumbers, targetNum)
        for combArray in permuByTargetNum {
            let combString = combArray.reduce("") { String($0) + String($1)}
            if combString.first == "0" || madePermuString.contains(combString) {
                continue
            }
            madePermuString.insert(combString)
            if isPrime(Int(combString)!) {
                answer += 1
            }
        }
    }
    
    return answer
}

func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false }
    guard n != 2     else { return true  }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}
