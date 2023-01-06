//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/06.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var maxHeap = Heap { (lhs: Int, rhs:Int) in
        return lhs > rhs
    }
    var minHeap = Heap { (lhs: Int, rhs:Int) in
        return lhs < rhs
    }
    
    for operation in operations {
        let trimedOperation = operation.components(separatedBy: " ")
        let command = trimedOperation[0]
        let paramater = trimedOperation[1]
        switch command {
        case "I":
            maxHeap.insert(Int(paramater)!)
            minHeap.insert(Int(paramater)!)
        case "D":
            if paramater == "1" {
                guard let element = maxHeap.remove() else { break }
                if let index = minHeap.index(of: element, startingAt: 0) {
                    minHeap.remove(at: index)
                }
            }
            if paramater == "-1" {
                guard let element = minHeap.remove() else { break }
                if let index = maxHeap.index(of: element, startingAt: 0) {
                    maxHeap.remove(at: index)
                }
            }
        default: break
        }
    }
    if minHeap.isEmpty && maxHeap.isEmpty {
        return [0,0]
    }
    return [maxHeap.remove()!,minHeap.remove()!]
}
