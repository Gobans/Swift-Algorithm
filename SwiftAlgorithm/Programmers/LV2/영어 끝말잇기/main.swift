//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/24.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var number = 1
    var order = 1
    var previousWord = words[0]
    if previousWord.count == 1 {
        return [1, 1]
    }
    var temp: [String] = []
    temp.append(previousWord)
    
    for i in 1..<words.count {
        number = i % n + 1
        order = i / n + 1
        if previousWord.last != words[i].first || words[i].count == 1 || temp.contains(words[i]) {
            return [number, order]
        }
        temp.append(words[i])
        previousWord = words[i]
    }
    return [0, 0]
}
