//
//  Permutation.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/11.
//

import Foundation

func permutation<T>(_ array: [T], _ targetNum: Int) -> [[T]] {
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: array.count)
    
    func permutation(_ nowPermute: [T]) {
        if nowPermute.count == targetNum {
            result.append(nowPermute)
            return
        }
        for i in 0..<array.count {
            if visited[i] == true {
                continue
            }
            else {
                visited[i] = true
                permutation(nowPermute + [array[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    
    return result
}
