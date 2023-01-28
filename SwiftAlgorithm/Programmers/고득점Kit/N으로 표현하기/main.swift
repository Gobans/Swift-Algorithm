//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/27.
//

// BruteForceSearch
import Foundation

var stack: [Int] = []
var count = 0
var minCount = 9

func bruteForceSearch(_ N: Int, _ number: Int) {
    let lastNum = count == 0 ? 0 : stack.last!
    if lastNum == number {
        minCount = count
    }
    
    var n = 0
    var addCount = 0
    var digit = 1
    
    while digit <= 100000 {
        addCount = addCount + 1
        if (count + addCount) >= minCount {
            break
        }
        
        n += (N*digit)
        count += addCount
        
        stack.append(lastNum + n)
        bruteForceSearch(N, number)
        stack.removeLast()
        
        if (lastNum - n) != 0 {
            stack.append(lastNum - n)
            bruteForceSearch(N, number)
            stack.removeLast()
        }
        
        stack.append(lastNum * n)
        bruteForceSearch(N, number)
        stack.removeLast()

        if (lastNum / n) != 0 {
            stack.append(lastNum / n)
            bruteForceSearch(N, number)
            stack.removeLast()
        }
        
        count -= addCount
        
        digit *= 10
    }
}

func solution(_ N:Int, _ number:Int) -> Int {
    bruteForceSearch(N, number)

    return minCount < 9 ? minCount : -1
}


/* DFS
func dfs(_ N: Int, _ number: Int, _ depth: Int, _ temp: Int, _ answer: inout Int)  {
    if depth > 8 {
        return
    }

    if temp == number && (answer > depth || answer == -1) {
        answer = depth
        return
    }

    var calc = 0

    for index in 0 ..< 8 {
        calc = calc * 10 + N
        dfs(N, number, depth + 1 + index, temp + calc, &answer)
        dfs(N, number, depth + 1 + index, temp - calc, &answer)
        dfs(N, number, depth + 1 + index, temp * calc, &answer)
        dfs(N, number, depth + 1 + index, temp / calc, &answer)
    }
}
func solution(_ N:Int, _ number:Int) -> Int {

    var answer = -1
    dfs(N, number, 0, 0, &answer)
    return answer
}
*/
