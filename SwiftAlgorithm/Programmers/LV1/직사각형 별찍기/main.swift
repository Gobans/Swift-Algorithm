//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/07.
//

import Foundation

let r = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (n, m) = (r[0], r[1])

for _ in 0..<m {
    for _ in 0..<n {
        print("*", terminator: "")
    }
    print("", terminator: "\n")
}

/* otehr's
 
let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for _ in 0..<b {
    print(Array(repeating: "*", count: a).joined())
}

 */
