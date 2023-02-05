//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/04.
//

import Foundation

// DFS
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let isVisited: [Bool] = Array(repeating: false, count: words.count)
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
    let lhs = Array(lhs)
    let rhs = Array(rhs)
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

/* BFS
struct WordInfo {
    let word: String
    let cnt: Int
    let isVisited: [Bool]
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let isVisited: [Bool] = Array(repeating: false, count: words.count)
    var minCnt = 52
    var queue: [WordInfo] = []
    queue.append(WordInfo(word: begin, cnt: 0, isVisited: isVisited))
    while !queue.isEmpty {
        let wordInfo = queue.removeFirst()
        if wordInfo.word == target {
            if wordInfo.cnt < minCnt {
                minCnt = wordInfo.cnt
            }
            continue
        }
        if wordInfo.cnt >= minCnt {
            continue
        }
        var cVisited = wordInfo.isVisited
        for i in 0..<words.count {
            if !wordInfo.isVisited[i] && isPossibleChange(lhs: wordInfo.word, rhs: words[i]) {
                cVisited[i] = true
                queue.append(WordInfo(word: words[i], cnt: wordInfo.cnt + 1, isVisited: cVisited))
                cVisited[i] = false
            }
        }
    }
    return minCnt == 52 ? 0 : minCnt
}

func isPossibleChange(lhs: String, rhs: String) -> Bool {
    print("lhs: \(lhs) -> rhs: \(rhs)")
    let lhs = Array(lhs)
    let rhs = Array(rhs)
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
*/
