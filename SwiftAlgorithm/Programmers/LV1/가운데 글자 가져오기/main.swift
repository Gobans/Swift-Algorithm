//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/31.
//

import Foundation

func solution(_ s:String) -> String {
    let s = Array(s)
    var answer = ""
    if s.count%2 == 0 {
        answer += String(s[s.count/2-1]) + String(s[s.count/2])
    } else {
        answer += String(s[s.count/2])
    }
    return answer
}

/* other's
 
func solution(_ s:String) -> String {
 return String(s[String.Index(encodedOffset: (s.count-1)/2)...String.Index(encodedOffset: s.count/2)])
}

 
 */
