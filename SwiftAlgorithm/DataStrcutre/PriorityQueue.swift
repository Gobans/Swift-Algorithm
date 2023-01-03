//
//  PriorityQueue.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/03.
//

import Foundation

struct PriorityQueue<Element: Equatable> {
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool,
        elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var peek: Element? {
        return heap.peek()
    }
    
    mutating func enqueue(_ element: Element) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
}
