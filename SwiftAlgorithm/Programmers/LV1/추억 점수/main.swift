//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/30.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let nyZip = zip(name, yearning)
    let nyDict: [String: Int] = Dictionary(uniqueKeysWithValues: nyZip)
    var answer: [Int] = []
    for album in photo {
        let score = album.compactMap{ name in
                  if let num = nyDict[name] {
                      return num
                  }
                  return nil
        }.reduce(0,+)
        answer.append(score)
    }
    return answer
}
