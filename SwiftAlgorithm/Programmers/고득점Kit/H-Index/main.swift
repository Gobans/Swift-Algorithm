//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/08.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    var hIndex = 0
    guard let maxCitation = citations.max(), maxCitation != 0 else {
        return 0
    }
    let sortedCitations = citations.sorted(by: >)
    for index in 1...maxCitation {
        var citationCount = 0
        for citation in sortedCitations {
            if citation >= index {
                citationCount += 1
            } else {
                break
            }
        }
        if citationCount >= index {
            hIndex = index
        } else {
            break
        }
    }
    return hIndex
}
