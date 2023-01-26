//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/26.
//

import Foundation

func solution(routes:[[Int]]) -> Int {
    var answer = 0
    let routes = routes.sorted(by: { $0[1] < $1[1] })
    var camera = -30001
    for route in routes {
        if camera < route[0] {
            answer += 1
            camera = route[1]
        }
    }
    return answer
}
