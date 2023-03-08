//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/08.
//

import Foundation

// 테스트 케이스 4, 6, 7, 12, 21 실패
func solution(_ s:String) -> Int {
    // 해당 문자열이 palindrome이 되는지 어떻게 판단???
    // a + b + c + d + c + b + a
    // 1. index를 이동하며 문자열 하나를 기준으로 i - 1, i + 1 검증하기
    let s = Array(s)
    let sLength = s.count
    var index = 1
    var maxCnt = 0
    // 예외 케이스
    if sLength < 3 {
        if sLength == 1 {
            return 1
        }
        if s[0] == s[1] {
            return 2
        } else {
            return 1
        }
    }
    var sameCnt = 0
    var preString = s[0]
    while index < sLength-1 {
        if s[index] == preString {
            sameCnt += 1
            if maxCnt < sameCnt {
                maxCnt = sameCnt
            }
        } else {
            sameCnt = 0
        }
        preString = s[index]
        var cnt = 0
        var leftIdx = index - 1
        var rightIdx = index + 1
        while leftIdx >= 0 && rightIdx < sLength {
            if s[leftIdx] != s[rightIdx] {
                break
            }
            cnt += 1
            leftIdx -= 1
            rightIdx += 1
        }
        if cnt > maxCnt {
            maxCnt = cnt
        }
        index += 1
    }
    return maxCnt*2 + 1
}
