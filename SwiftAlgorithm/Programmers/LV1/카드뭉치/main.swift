//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/05/09.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1Idx = 0
    var cards2Idx = 0
    for word in goal {
        if cards1Idx < cards1.count && cards1[cards1Idx] == word {
            cards1Idx += 1
        } else if cards2Idx < cards2.count && cards2[cards2Idx] == word {
            cards2Idx += 1
        } else {
            return "No"
        }
    }
    return "Yes"
}
