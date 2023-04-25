//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/25.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var sumArr: [Int] = []
    for i in 0..<numbers.count - 1 {
        for j in i+1..<numbers.count {
            let sum = numbers[i] + numbers[j]
            if !sumArr.contains(sum) {
                sumArr.append(sum)
            }
        }
    }
    return sumArr.sorted(by:<)
}

/* other's
 
 func solution(_ numbers:[Int]) -> [Int] {

     var arr:[Int] = []

     for i in 0..<numbers.count {
         for j in i+1..<numbers.count {
             arr.append(numbers[i]+numbers[j])
         }
     }

     return Set(arr).sorted()
 }

 */
