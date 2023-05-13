//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/13.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    let pronunce = ["aya", "ye", "woo", "ma"]
    var answer = 0
    for bab in babbling {
        var idx = 0
        var beforeWord = ""
        let bArr = Array(bab).map{ String($0) }
        while idx < bArr.count-1 {
           if idx+1 < bArr.count {
               let range = idx...idx+1
               let currentWord = bArr[range].joined()
               if currentWord == beforeWord {
                   break
               }
               if pronunce.contains(currentWord) {
                   idx += 2
                   beforeWord = currentWord
                   continue
               }
           }
           if idx+2 < bArr.count {
               let range = idx...idx+2
               let currentWord = bArr[range].joined()
               if currentWord == beforeWord {
                   break
               }
               if pronunce.contains(bArr[range].joined()) {
                   idx += 3
                   beforeWord = currentWord
                   continue
               }
           }
           break
        }
        if idx == bab.count{
            answer += 1
        }
    }
    return answer
}
