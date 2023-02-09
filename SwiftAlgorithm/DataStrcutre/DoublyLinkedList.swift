//
//  DoublyLinkedList.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/09.
//

import Foundation

class DoublyLinkedList<T>: CustomStringConvertible {
    
    class Node<T>: CustomStringConvertible, Equatable {
        
        var value: T
        var next: Node<T>?
        weak var prev: Node<T>?
        
        var description: String {
            guard let next = next else { return "\(value)" }
            return "\(value) -> " + String(describing: next)
        }
        
        init(_ value: T, prev: Node<T>?, next: Node<T>?) {
            self.value = value
            self.prev = prev
            self.next = next
        }
        
        static func ==(lhs: Node, rhs: Node) -> Bool {
            return lhs.next == rhs.next
        }
    }
    
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    
    var isEmpty: Bool {
        head == nil
    }
    
    var description: String {
        guard let head = head else { return "Empty List !!!" }
        return String(describing: head)
    }
    
    init() {
        head = nil
        tail = head
    }
    
    func deleteAll() {
        head = nil
        tail = nil
    }
    
}

// common operations
extension DoublyLinkedList {
    
    subscript(index: Int) -> Node<T>? {
        node(at: index)
    }
    
    var forwardValues: [T]? {
        if isEmpty { return nil }
        var values: [T] = []
        var currentNode = head
        while currentNode != nil {
            values.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        return values
    }
    
    var backwardValues: [T]? {
        if let tailNode = tail {
            var values: [T] = []
            var previousNode = tailNode
            while previousNode.prev != nil {
                values.append(previousNode.value)
                if let previous = previousNode.prev {
                    previousNode = previous
                }
            }
            return values
        }
        return nil
    }
    
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
    
}

// insertion operations
extension DoublyLinkedList {
    
    func push(_ value: T) {
        if isEmpty {
            head = Node(value, prev: nil, next: nil)
            tail = head
        } else {
            let newNode = Node(value, prev: nil, next: head)
            head?.prev = newNode
            head = newNode
        }
    }
    
    func append(_ value: T) {
        let newNode = Node(value, prev: nil, next: nil)
        if let tail = tail {
            newNode.prev = tail
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func insert(after index: Int, value: T) -> Bool {
        if let node = node(at: index) {
            
            if node == tail {
                append(value)
                return true
            }
            
            let newNode = Node(value, prev: node, next: node.next)
            if let oldNextNode = node.next {
                node.next = newNode
                oldNextNode.prev = newNode
                return true
            }
        }
        return false
    }
}

// deletion operations
extension DoublyLinkedList {
    
    @discardableResult
    func pop() -> T? {
        defer {
            head = head?.next
            head?.prev = nil
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    func deleteLast() -> T? {
        guard let tailNode = tail, let headNode = head else { return nil }
        defer {
            if tailNode == headNode {
                tail = nil
                head = nil
            } else if let prev = tailNode.prev {
                tail = prev
                tail?.next = nil
            }
        }
        return tailNode.value
    }
    
    func remove(at index: Int) -> T? {
        if let node = self.node(at: index) {
            
            if node == head {
                return pop()
            }
            
            if node == tail {
                return deleteLast()
            }
            
            defer {
                let prev = node.prev
                let next = node.next
                prev?.next = node.next
                next?.prev = node.prev
            }
            return node.value
        }
        return nil
    }
}
