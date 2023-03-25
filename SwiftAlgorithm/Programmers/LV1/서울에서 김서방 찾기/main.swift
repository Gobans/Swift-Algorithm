//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/24.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    var index = 0
    for i in seoul {
        if i == "Kim" {
            break
        }
        index += 1
    }
    return "김서방은 \(index)에 있다"
}

/* other method
 func solution(_ seoul:[String]) -> String {
     return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
 }
*/


