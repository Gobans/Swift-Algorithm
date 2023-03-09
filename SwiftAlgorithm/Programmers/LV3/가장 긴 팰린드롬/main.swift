//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/08.
//

import Foundation

func solution(_ s:String) -> Int {
    let arr: [Character] = Array(s)
    var answer = 0

    for i in 0..<arr.count {
        for j in stride(from: arr.count - i, to: answer, by: -1) {
            var left = i
            var right = i + j - 1
            while left <= right, arr[left] == arr[right] {
                left += 1
                right -= 1
            }

            if left > right { answer = max(answer, j) }
        }
    }
    
    return answer
}

/* 테스트 케이스 4, 6, 7, 12, 21 실패
func solution(_ s:String) -> Int {
    // 해당 문자열이 palindrome이 되는지 어떻게 판단???
    // a + b + c + d + c + b + a
    // 1. index를 이동하며 문자열 하나를 기준으로 i - 1, i + 1 검증하기
    let s = Array(s)
    let sLength = s.count
    var index = 1
    var maxCnt = 1
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
    var sameCnt = 1
    var preString = s[0]
    while index < sLength-1 {
        // 연속 palindrome 일경우 aaa... bbb..
        if s[index] == preString {
            sameCnt += 1
            if maxCnt < sameCnt {
                maxCnt = sameCnt
            }
        } else {
            sameCnt = 1
        }
        preString = s[index]
        
        // 문자 하나를 기준으로 양쪽이 palindrome일 경우
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
        cnt = cnt*2 + 1
        if cnt > maxCnt {
            maxCnt = cnt
        }
        
        // 문자열 전체가 palindrome일 경우 aaabbb
        leftIdx = index - 1
        rightIdx = sLength - index
        cnt = 0
        while leftIdx < rightIdx {
            if s[leftIdx] != s[rightIdx] {
                break
            }
            cnt += 1
            leftIdx += 1
            rightIdx -= 1
        }
        cnt *= 2
        if cnt > maxCnt {
            maxCnt = cnt
        }
        
        index += 1
    }
    return maxCnt
}
*/
