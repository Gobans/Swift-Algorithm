//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/24.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var caches: [String] = []
    var answer = 0
    for c in cities {
        let city = c.uppercased()
        if caches.contains(city) {
            answer += 1
            let idx = caches.firstIndex(of: city)!
            caches.remove(at: idx)
        } else {
            answer += 5
            if caches.count == cacheSize && !caches.isEmpty {
                caches.removeFirst()
            }
        }
        if caches.count < cacheSize {
            caches.append(city)
        }
    }
    return answer
}
