//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/30.
//

import Foundation

func solution(_ phone_number:String) -> String {
    var phone_number = Array(phone_number)
    var answer = ""
    for _ in 0..<phone_number.count-4 {
        answer += "*"
    }
    for i in phone_number.count-4..<phone_number.count {
        answer += String(phone_number[i])
    }
    return answer
}

/* other's
 
 func solution(_ phone_number:String) -> String {
     return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
 }
 
 */
