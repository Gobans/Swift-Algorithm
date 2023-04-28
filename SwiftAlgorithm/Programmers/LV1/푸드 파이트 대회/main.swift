//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/28.
//

import Foundation

func solution(_ food:[Int]) -> String {
    var leftStr = ""
    var rightStr = ""
    for i in 0..<food.count {
        var foodCnt = food[i]
        let foodNumStr = String(i)
        if foodCnt % 2 == 1 {
            foodCnt -= 1
        }
        foodCnt = foodCnt / 2
        for _ in 0..<foodCnt {
            leftStr += foodNumStr
            rightStr = foodNumStr + rightStr
        }
    }
    let answer = leftStr + "0" + rightStr
    return answer
}

/* other's
 
func solution(_ food:[Int]) -> String {
    var result = ""
    for i in food.indices {
        result += String(repeating: String(i), count: food[i] / 2)
    }
    return result + "0" + result.reversed()
}
 
 */
