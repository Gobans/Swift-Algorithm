//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/22.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numberArray = Array(number)
    var pickCnt = k
    var stack: [Character] = []
    for i in 0..<numberArray.count {
        while !stack.isEmpty && pickCnt > 0 && stack.last!.wholeNumberValue! < numberArray[i].wholeNumberValue! {
            stack.removeLast()
            pickCnt -= 1
        }
        if stack.count < numberArray.count-k {
            stack.append(numberArray[i])
        }
    }
    return String(stack)
}

/* BFS 시간초과
func solution(_ number:String, _ k:Int) -> String {
    let numberArray = number.map{ String($0) }
    let pickNum = numberArray.count - k
    var maxNum = 0
    var queue: [NumberInfo] = []
    queue.append(NumberInfo(numberString: "", startIndex: 0))
    while !queue.isEmpty {
        let numberInfo = queue.removeFirst()
        if numberInfo.numberString.count == pickNum {
            if let perNum = Int(numberInfo.numberString) {
                maxNum = max(perNum, maxNum)
            }
            continue
        }
        for i in numberInfo.startIndex..<numberArray.count {
            queue.append(NumberInfo(numberString: numberInfo.numberString + numberArray[i], startIndex: i + 1))
        }
    }
    return String(maxNum)
}

struct NumberInfo {
    var numberString: String
    var startIndex: Int
}
*/

/* DFS 시간초과
func solution(_ number:String, _ k:Int) -> String {
    // number 의 개수 - k 만큼 뽑았을 때 가장 큰 수
    let numberArray = number.map{ String($0) }
    let pickNum = numberArray.count - k
    var maxNum = 0
    let visited = Array(repeating: false, count: numberArray.count)
    func DFS(perNumString: String, visited: [Bool], startIndex: Int) {
        if perNumString.count == pickNum {
            if let perNum = Int(perNumString) {
                maxNum = max(perNum, maxNum)
            }
            return
        }
        var cVisited = visited
        for i in startIndex..<numberArray.count {
            if !cVisited[i] {
                cVisited[i] = true
                let newString = perNumString + numberArray[i]
                print(newString)
                DFS(perNumString: newString, visited: cVisited, startIndex: i)
            }
        }
    }
    DFS(perNumString: "", visited: visited, startIndex: 0)
    }
    return String(maxNum)
}
*/
