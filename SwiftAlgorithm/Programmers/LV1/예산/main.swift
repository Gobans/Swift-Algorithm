//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/20.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var answer = 0
    var budget = budget
    let sortedD = d.sorted(by: <)
    sortedD.forEach{ price in
        if budget - price >= 0 {
            budget -= price
            answer += 1
        } else {
            return
            // return으로 forEach 문을 나가지 않음.
            // 이렇게 사용하는 것은 좋은 방법이 아님!
        }
    }
    return answer
}

/* other's

func solution(_ d:[Int], _ budget:Int) -> Int {
 var budget = budget

 return d.sorted().filter{
     budget = budget - $0
     return budget >= 0
 }.count
}
 
 */
