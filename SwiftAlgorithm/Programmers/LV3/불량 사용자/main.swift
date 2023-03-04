//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/02.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedList: [[String]] = []
    for banString in banned_id {
        let banStringArray = Array(banString)
        var tempBanId: [String] = []
        for userId in user_id {
            let userIdArray = Array(userId)
            if banStringArray.count != userIdArray.count {
                continue
            }
            var isMatched = true
            for i in 0..<userIdArray.count {
                if banStringArray[i] == "*" {
                    continue
                }
                if userIdArray[i] != banStringArray[i] {
                    isMatched = false
                    break
                }
            }
            if isMatched {
                tempBanId.append(userId)
            }
        }
        bannedList.append(tempBanId)
    }
    var answer: [[String]] = []
    func DFS(_ idx: Int, _ permutationList: [String]) {
        if idx == banned_id.count {
            answer.append(permutationList)
            return
        }
        for id in bannedList[idx] {
            var permutationList = permutationList
            if permutationList.contains(id) {
                continue
            }
            permutationList.append(id)
            DFS(idx + 1, permutationList)
        }
    }
    DFS(0, [])
    return Set(answer.map { $0.sorted() }).count
}

/* Solution referenced by other's solution
func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedList = [[String]]()

    for bid in banned_id {
        var temp = [String]()
        let bidarr = Array(bid).map { String($0) }

        for uid in user_id {
            let uidarr = Array(uid).map { String($0) }

            if bid.count != uid.count { continue }
            var possible = true
            for i in 0..<bid.count {
                if bidarr[i] == "*" { continue }
                if bidarr[i] != uidarr[i] {
                    possible.toggle()
                    break
                }
            }
            if possible { temp.append(uid) }
        }
        bannedList.append(temp)
    }

    var stack = [(idx: Int, idList: [String])]()
    var answer = [[String]]()

    for id in bannedList[0] {
        stack.append((0, [id]))
    }

    while stack.count > 0 {
        let now = stack.removeLast()

        if now.idx == banned_id.count-1 {
            answer.append(now.idList)
            continue
        }

        let idx = now.idx + 1

        for id in bannedList[idx] {
            var idList = now.idList
            if idList.contains(id) { continue }
            idList.append(id)
            stack.append((idx, idList))
        }
    }

    return Set(answer.map { $0.sorted() }).count
}
 */
