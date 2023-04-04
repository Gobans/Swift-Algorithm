//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/04.
//

import Foundation

func solution(_ s:String) -> Bool {
    if  s.count != 6 && s.count != 4 {
        return false
    }
    for i in "qwertyuiopasdfghjklzxcvbnm" {
        if s.contains(String(i)) {
            return false
        }
    }
    for i in "qwertyuiopasdfghjklzxcvbnm".uppercased() {
        if s.contains(String(i)) {
            return false
        }
    }
    
    return true
}

/* other's
 
 func solution(_ s:String) -> Bool {
     return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
 }

 */
