//
//  LinkedList.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/08.
//

import Foundation

struct LinkedList<T>: CustomStringConvertible {
    
    class Node<T>: CustomStringConvertible, Equatable {
        
        var value: T
        var next: Node?
        
        var description: String {
            guard let next = next else { return "\(value)" }
            return "\(value) -> " + String(describing: next)
        }
        
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
        
        static func ==(lhs: Node, rhs: Node) -> Bool {
            return lhs.next == rhs.next
        }
    }
    
    var head: Node<T>?
    
    var tail: Node<T>?
    
    init() { }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}

// common operations
extension LinkedList {
    
    func node(at index: Int) -> Node<T>? {
        
        if isEmpty {
            return nil
        }
        
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }

    func numberOfNodes() -> Int {
        var currentNode = head
        var count = 0
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    // 이 메소드 이후 메모리상에서 해제되었는지 확인 가능?
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}

// insertion operations
extension LinkedList {
    
    subscript(index: Int) -> Node<T>? {
        node(at: index)
    }
    
    mutating func push(_ value: T) {
        
        let newNode = Node(value: value, next: head)
        
        head = newNode
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: T) {
        
        if isEmpty {
            self.push(value)
            return
        }
        
        tail?.next = Node(value: value)
        
        tail = tail?.next
    }
    
    mutating func insert(_ value: T, after index: Int) {
        
        if index < 0 || index >= self.numberOfNodes() {
            self.append(value)
            return
        }
        
        if let beforeNode = self.node(at: index), let tail = tail {
            
            if beforeNode == tail {
                self.append(value)
            } else {
                beforeNode.next = Node(value: value, next: beforeNode.next)
            }
        } else {
            self.push(value)
        }
    }
}

// deletion operations
extension LinkedList {
    
    @discardableResult
    mutating func pop() -> T? {
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    
    
    @discardableResult
    mutating func deleteLast() -> T? {
        
        guard let head = head else { return nil }
        
        guard head.next != nil else { return pop() }
        
        var currentNode = head
        var previousNode = head
        
        while let next = currentNode.next {
            previousNode = currentNode
            currentNode = next
        }
        
        previousNode.next = nil
        tail = previousNode
        return currentNode.value
    }
    
    
    mutating func remove(after index: Int) -> T? {
        
        if index < 0 || index >= self.numberOfNodes() {
            return nil
        }
        
        if let beforeNode = self.node(at: index) {
            defer {
                if beforeNode.next == tail {
                    tail = beforeNode
                }
                beforeNode.next = beforeNode.next?.next
            }
            return beforeNode.next?.value
        }
        return nil
    }
    
}
