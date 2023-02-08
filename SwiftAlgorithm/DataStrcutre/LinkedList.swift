//
//  LinkedList.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/08.
//

import Foundation

// A struct to hold the information of all the nodes
struct LinkedList<T>: CustomStringConvertible {
    
    class Node<T>: CustomStringConvertible, Equatable {
        
        var value: T
        var next: Node?
        
        // required conforms to CustomStringConvertible
        var description: String {
            guard let next = next else { return "\(value)" }
            return "\(value) -> " + String(describing: next)
        }
        
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
        
        // required conforms to Equatable
        static func ==(lhs: Node, rhs: Node) -> Bool {
            return lhs.next == rhs.next
        }
    }

    
    // to hold the starting point of list
    var head: Node<T>?
    
    // to hold the ending point of list
    var tail: Node<T>?
    
    init() { }
    
    // if head is nil simply list is empty right now
    var isEmpty: Bool {
        return head == nil
    }
    
    // required conforms to CustomStringConvertible
    var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}

// Common Methods
extension LinkedList {
    
    // get a node from a specific position
    func node(at index: Int) -> Node<T>? {
        
        // if list is empty then simply return nil
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
    
    // get number of nodes in the list
    func numberOfNodes() -> Int {
        var currentNode = head
        var count = 0
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    // to remove all the nodes from the list
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}


// Insertion Methods
extension LinkedList {
    
    // push: adding a value at the front of the list, called as Head-first insertion
    mutating func push(_ value: T) {
        
        // create a new node and passing head (starting point) as a next node
        let newNode = Node(value: value, next: head)
        
        // change the head to the new node because head will hold the starting node
        head = newNode
        
        // if tail (ending node) is nil, it means head and tail pointing the same node as it is first node
        if tail == nil {
            tail = head
        }
    }
    
    
    // append: adding a value at the end of the list, called as Tail-end intersion
    mutating func append(_ value: T) {
        
        // if list is empty then simply perform push operation
        if isEmpty {
            self.push(value)
            return
        }
        
        // create new node and assign it to tail's next because tail will always point the last node
        tail?.next = Node(value: value)
        
        // replace the tail with tail's next because before doing it tail's next pointing the last node
        tail = tail?.next
    }
    
    // insert: adding a value after a specific node.
    mutating func insert(_ value: T, after index: Int) {
        
        // if given index is not valid as per current list, it will be added in last
        if index < 0 || index >= self.numberOfNodes() {
            self.append(value)
            return
        }
        
        // if node not found just before to given insert index, perform push operation
        if let beforeNode = self.node(at: index), let tail = tail {
            
            // if insert index ie equal to last, simply append new node at last
            if beforeNode == tail {
                self.append(value)
            } else {
                // create new node and assign as a next node for the before node
                beforeNode.next = Node(value: value, next: beforeNode.next)
            }
        } else {
            self.push(value)
        }
    }
}

// Deletion Methods
extension LinkedList {
    
    
    // pop: remove an element from the front of the list
    // discardableResult: Using this to avoid the return value after pop if we don't care about return value. It will not give any warning if we don't assign the result to any variable or constant.
    @discardableResult
    mutating func pop() -> T? {
        
        // A defer statement is used for executing code just before transferring program control outside of the scope that the statement appears in.
        // here, we are using defer to perform pop operation performed later to return the popped value.
        // popped value will return first then defer block will be execute.
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    
    
    // deleteLast: remove the last element of the list
    @discardableResult
    mutating func deleteLast() -> T? {
        
        // if head is nil, means no node exists.
        guard let head = head else { return nil }
        
        // if head is not have any reference of next node, it means we have only one node in list.
        guard head.next != nil else { return pop() }
        
        // first we have to traverse to reach at last two nodes.
        var currentNode = head
        var previousNode = head
        
        while let next = currentNode.next {
            previousNode = currentNode
            currentNode = next
        }
        
        // disconnected the next of last previous node
        previousNode.next = nil
        tail = previousNode
        return currentNode.value
    }
    
    
    // removeAt: remove an element from a specific position
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
