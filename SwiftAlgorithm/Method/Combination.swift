//
//  combination.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/11.
//

import Foundation

func combination<T: Comparable>(_ array: [T], _ targetNum: Int) -> [[T]] {
    var result = [[T]]()
    
    func combination(_ index: Int, _ nowCombi: [T]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<array.count {
            combination(i + 1, nowCombi + [array[i]])
        }
    }
    
    combination(0, [])
    
    return result
}
