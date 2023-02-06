//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/06.
//

import Foundation

// DFS
func solution(_ numbers:[Int], _ target:Int) -> Int {
    let n = numbers.count
    var answer = 0

    func DFS(num: Int, index: Int) {
        if index == n {
            if num == target {
                answer += 1
            }
            return
        }
        DFS(num: num + numbers[index], index: index + 1)
        DFS(num: num - numbers[index], index: index + 1)
    }
    DFS(num: 0, index: 0)

    return answer
}

/* BFS
func solution(_ numbers:[Int], _ target:Int) -> Int {
    var queue = EffectiveQueue<(Int, Int)>()
    queue.enqueue((0,0))
    let n = numbers.count
    var answer = 0
    while !queue.isEmpty {
        let element = queue.dequeue()!
        let num = element.0
        let index = element.1
        if index == n {
            if num == target {
                answer += 1
            }
            continue
        }
        queue.enqueue((num + numbers[index], index + 1))
        queue.enqueue((num - numbers[index], index + 1))
    }
    return answer
}
*/
