//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/17.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    let lowerStr = Array("abcdefghijklmnopqrstuvwxyz")
    let upperStr = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    var result = ""
    let s = Array(s)
    for c in s {
        if lowerStr.contains(c) {
            var index = lowerStr.firstIndex(of: c)! + n
            if index > 25 {
                index = index - 26
            }
            result.append(lowerStr[index])
        } else if upperStr.contains(c) {
            var index = upperStr.firstIndex(of: c)! + n
            if index > 25 {
                index = index - 26
            }
            result.append(upperStr[index])
        } else {
            result.append(c)
        }
    }
    return result
}

/* other's
 
 func solution(_ s:String, _ n:Int) -> String {
     let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
     return String(s.map {
         guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
         let letter = alphabets[(index + n) % alphabets.count]
         return $0.isUppercase ? Character(letter.uppercased()) : letter
     })
 }
 
 */
