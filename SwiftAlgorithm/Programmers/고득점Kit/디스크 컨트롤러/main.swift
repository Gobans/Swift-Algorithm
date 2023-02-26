//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/04.
//

import Foundation

// `sort`
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

/* `heap`
func solution(_ jobs:[[Int]]) -> Int {
    var now = 0
    var totalTime = 0
    var cJobs = jobs
    var sortedJobs = Heap (sort: { (lhs: [Int], rhs: [Int]) in
        return (lhs[1], lhs[0]) < (rhs[1], rhs[0])
    })
    while !cJobs.isEmpty || !sortedJobs.isEmpty {
        var tempJobs: [[Int]] = []
        for job in cJobs {
            if job[0] <= now {
                sortedJobs.insert(job)
            } else {
                tempJobs.append(job)
            }
        }
        cJobs = tempJobs
        if !sortedJobs.isEmpty {
            let job = sortedJobs.remove()!
            now += job[1]
            totalTime += now - job[0]
        } else {
            now += 1
        }
    }
    return totalTime / jobs.count
}
 */

/* `heap refactor: more readable`
func solution(_ jobs:[[Int]]) -> Int {
    var now = 0
    var totalTime = 0
    var cJobs = jobs.sorted(by: { $0[0] > $1[0] })
    var sortedJobs = Heap (sort: { (lhs: [Int], rhs: [Int]) in
        return (lhs[1], lhs[0]) < (rhs[1], rhs[0])
    })
    while !cJobs.isEmpty || !sortedJobs.isEmpty {
        while !cJobs.isEmpty && cJobs.last![0] <= now {
            sortedJobs.insert(cJobs.removeLast())
        }
        if !sortedJobs.isEmpty {
            let job = sortedJobs.remove()!
            now += job[1]
            totalTime += now - job[0]
        } else {
            now += 1
        }
    }
    return totalTime / jobs.count
}
*/
