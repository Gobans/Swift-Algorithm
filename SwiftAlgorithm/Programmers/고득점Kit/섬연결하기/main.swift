//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/25.
//

import Foundation

// Solution referenced by other people's code
var parentNumber: [Int] = []

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    parentNumber = (0..<n).map{$0}
    let costs = costs.sorted { lhs, rhs in
        return lhs[2] <= rhs[2]
    }
    var sum = 0
    for bridge in costs {
        if !isCycle(left: bridge[0], right: bridge[1]) {
            changeParent(oldParent: parentNumber[bridge[1]], newParent: parentNumber[bridge[0]])
            sum += bridge[2]
        }
    }
    return sum
}

func isCycle(left:Int, right:Int) -> Bool {
    return parentNumber[left] == parentNumber[right]
}

func changeParent(oldParent:Int,newParent:Int) {
    parentNumber.indices.filter {parentNumber[$0] == oldParent}.forEach{parentNumber[$0] = newParent}
}

/* Newly writed solution
import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var sum = 0
    var parentNumber: [Int] = (0..<n).map{ $0 }
    let costs = costs.sorted { lhs, rhs in
        return lhs[2] < rhs[2]
    }
    for i in 0..<costs.count {
        let (islandOne, islandTwo) = (costs[i][0], costs[i][1])
        if parentNumber[islandOne] != parentNumber[islandTwo] {
            sum += costs[i][2]
            parentNumber.indices.filter{ parentNumber[$0] == parentNumber[islandTwo] }.forEach{ parentNumber[$0] = parentNumber[islandOne]
            }
        }
    }
    return sum
}
 */
