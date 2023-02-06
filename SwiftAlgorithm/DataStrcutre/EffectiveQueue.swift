//
//  EffectiveQueue.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/06.
//

import Foundation

struct EffectiveQueue<T> {
    private var queue: [T?] = []
    private var head = 0
    
    var count: Int {
        return queue.count - head
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        
        queue[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(queue.count)
        if queue.count > 50, percentage > 0.25 {
            queue.removeFirst(head)
            head = 0
        }
        
        return element
    }
}
