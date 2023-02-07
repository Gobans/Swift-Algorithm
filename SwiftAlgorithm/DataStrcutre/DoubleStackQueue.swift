//
//  DoubleStackQueue.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/07.
//

import Foundation

struct DoubleStackQueue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }

    mutating func enqueue(_ input: T) {
        inbox.append(input)
    }
    
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}
