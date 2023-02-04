//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/04.
//

import Foundation

// DFS
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var isVisited: [Bool] = Array(repeating: false, count: words.count)
    var minCnt = 52
    func DFS(nowWord: String, cnt: Int, isVisited: [Bool]) {
        if nowWord == target {
            if cnt < minCnt {
                minCnt = cnt
            }
            return
        }
        if cnt >= minCnt {
            return
        }
        var cVisited = isVisited
        for i in 0..<words.count {
            if !isVisited[i] && isPossibleChange(lhs: nowWord, rhs: words[i]) {
                cVisited[i] = true
                DFS(nowWord: words[i], cnt: cnt + 1, isVisited: cVisited)
                cVisited[i] = false
            }
        }
    }
    DFS(nowWord: begin, cnt: 0, isVisited: isVisited)
    return minCnt == 52 ? 0 : minCnt
}

func isPossibleChange(lhs: String, rhs: String) -> Bool {
    var lhs = Array(lhs)
    var rhs = Array(rhs)
    var cnt = 0
    for i in 0..<lhs.count {
        if lhs[i] != rhs[i] {
            cnt += 1
            if cnt == 2 {
                return false
            }
        }
    }
    return true
}
