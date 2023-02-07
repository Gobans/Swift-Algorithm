//
//  RingBufferQueue.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/07.
//

import Foundation

struct RingBufferQueue<T>: CustomStringConvertible {
    
    private var elements: [T?]
    private var front = -1
    private var rear = -1
    
    init(count: Int) {
        elements = Array(repeating: nil, count: count)
    }
    
    var isEmpty: Bool {
        front == -1 && rear == -1
    }
    
    var isFull: Bool {
        ((rear + 1) % elements.count) == front
    }
    
    var description: String {
        if isEmpty { return "Queue is empty..." }
        return "---- Queue start ----\n"
        + elements.map({ String(describing: (String(describing: $0)))}).joined(separator: " -> ")
        + "\n---- Queue End ----\n"
    }
    
    var peek: T? {
        if isEmpty { return nil }
        return elements[front]
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        if isEmpty {
            front = 0
            rear = 0
            elements[rear] = element
            return true
        }
        if isFull {
            print("Queue is Full")
            return false
        }
        
        rear = (rear + 1) % elements.count
        elements[rear] = element
        return true
    }
    
    mutating func dequeue() -> T? {
        
        if isEmpty {
            print("Queue is empty")
            return nil
        }
        
        if front == rear {
            defer {
                elements[front] = nil
                front = -1
                rear = -1
            }
            return elements[front]
        }
        
        defer {
            elements[front] = nil
            front = (front + 1) % elements.count
        }
        return elements[front]
    }
    
}
