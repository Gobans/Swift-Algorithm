//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/18.
//

import Foundation

var count = 0
var isSearched = false

func solution(_ word:String) -> Int {
    DFS(combString: "", targetWord: word)
    return count
}

func DFS(combString: String, targetWord: String) {
    if combString == targetWord {
        isSearched = true
        return
    } else if combString.count == 5 {
        return
    } else {
        let letters = ["A", "E", "I", "O", "U"]
        for letter in letters {
            count += 1
            if !isSearched {
                DFS(combString: combString + letter, targetWord: targetWord)
            }
        }
    }
}
