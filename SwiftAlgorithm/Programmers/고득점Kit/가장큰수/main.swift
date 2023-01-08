//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/07.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    var answer = ""
    var stringNumbers = numbers.map({ String($0)})
    stringNumbers.sort { lhs, rhs in
        return isLhsBigger(lhs: lhs, rhs: rhs)
    }
    stringNumbers.forEach { stringNumber in
        answer += stringNumber
    }
    if Int(answer) == 0{
        return "0"
    }
    return answer
}

// compare one by one
//func isLhsBigger(lhs: String, rhs: String) -> Bool {
//    let lhsFirst = lhs + rhs
//    let rhsFirst = rhs + lhs
//    let lhsArray: [Int] = lhsFirst.compactMap{ $0.wholeNumberValue }
//    let rhsArray: [Int] = rhsFirst.compactMap{ $0.wholeNumberValue }
//    for (lhsNum, rhsNum) in zip(lhsArray, rhsArray) {
//        if lhsNum > rhsNum {
//            return true
//        } else if lhsNum < rhsNum{
//            return false
//        }
//    }
//    return true
//}

// better method
func isLhsBigger(lhs: String, rhs: String) -> Bool {
    let lhsFirst = lhs + rhs
    let rhsFirst = rhs + lhs
    return lhsFirst > rhsFirst
}
