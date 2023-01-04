//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/04.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var now = 0
    var totalTime = 0
    var sortedJobs = jobs.sorted(by: { ($0[1], $0[0]) < ($1[1], $1[0])})
    
    while !sortedJobs.isEmpty {
        var isRemoved = false
        for i in 0..<sortedJobs.count {
            if sortedJobs[i][0] <= now {
                now += sortedJobs[i][1]
                totalTime += now - sortedJobs[i][0]
                sortedJobs.remove(at: i)
                isRemoved = true
                break
            }
        }
        if !isRemoved {
            now += 1
        }
    }
    return totalTime / jobs.count
}
