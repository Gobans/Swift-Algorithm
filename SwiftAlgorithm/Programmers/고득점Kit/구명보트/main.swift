//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/24.
//

import Foundation

func solution(_ people:[Int], _ limit:Int) -> Int {
    var answer: Int = 0
    var people = people.sorted(by: >)
    while people.count > 1 {
        if people[0] + people[people.endIndex - 1] <= limit {
            people.removeFirst()
            people.removeLast()
        } else {
            people.removeFirst()
        }
        answer += 1
    }
    if !people.isEmpty {
        answer += 1
    }
    return answer
}

/* python
 from collections import deque

 def solution(people, limit):
     answer = 0
     people.sort(reverse=True)
     people = deque(people)
     while len(people) > 1:
         if people[0] + people[-1] <= limit:
             people.popleft()
             people.pop()
         else:
             people.popleft()
         answer += 1

     if people:
         answer += 1
     return answer
*/
