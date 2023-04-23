//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/24.
//

import Foundation

func solution(_ s:String) -> Int {
    let numberDict: [String: String] = [
        "zero": "0",
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9",
    ]
    var components: [String] = []
    var currentComponent = ""
    let strNumbers = numberDict.keys.map{ String($0) }
    let numbers = numberDict.values.map{ String($0) }
    let stringToSplit = Array(s)
    for c in stringToSplit {
        if numbers.contains(String(c)) {
            components.append(String(c))
        } else {
            currentComponent.append(c)
        }
        if strNumbers.contains(currentComponent) {
            components.append(numberDict[currentComponent]!)
            currentComponent = ""
        }
    }
    return Int(components.joined())!
}

/* other's
 
 func solution(_ s:String) -> Int {
     let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
     var str = s
     for i in 0..<arr.count {
         str = str.replacingOccurrences(of: arr[i], with: String(i))
     }
     return Int(str)!
 }

 
 */
