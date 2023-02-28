//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/28.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var a = a.sorted(by: < )
    var b = b.sorted(by: < )
    var point = 0
    while !a.isEmpty {
        let aNum = a.removeLast()
        let bNum = b.removeLast()
        if aNum < bNum {
            point += 1
        } else if aNum >= bNum {
            b.append(bNum)
            b.removeFirst()
        }
    }
    return point
}
