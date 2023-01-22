//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/22.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    // number 의 개수 - k 만큼 뽑았을 때 가장 큰 수
    let numberArray = number.map{ String($0) }
    let pickNum = numberArray.count - k
    var maxNum = Int.min
    let visited = Array(repeating: false, count: numberArray.count)
    func DFS(perNumString: String, visited: [Bool]) {
        if perNumString.count == pickNum {
            maxNum = max(Int(perNumString)!, maxNum)
            return
        }
        var cVisited = visited
        for i in 0..<numberArray.count {
            if !cVisited[i] {
                cVisited[i] = true
                DFS(perNumString: perNumString + numberArray[i], visited: cVisited)
            }
        }
    }
    DFS(perNumString: "", visited: visited)
    return String(maxNum)
}
print(solution("4177252841", 4))
