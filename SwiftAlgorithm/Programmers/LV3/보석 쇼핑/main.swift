//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/02.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {
    let kinds = Set(gems).count
    var gemDict: [String: Int] = [:]
    var start = 0
    var end = -1
    var minDiff = Int.max
    var answer = [0, 0]
    
    while end < gems.count {
        if gemDict.count < kinds {
            end += 1
            if end < gems.count {
                if gemDict[gems[end]] == nil {
                    gemDict[gems[end]] = 0
                }
                gemDict[gems[end]]! += 1
            }
        } else {
            gemDict[gems[start]]! -= 1
            if gemDict[gems[start]] == 0 {
                gemDict[gems[start]] = nil
            }
            start += 1
        }
        if gemDict.count == kinds && end - start < minDiff {
            minDiff = end - start
            answer = [start + 1, end + 1]
        }
    }
    
    return answer
}

/* Solution referenced by other's solution
func solution(_ gems:[String]) -> [Int] {
    let kinds = Set(gems).count
    if kinds == 1 {
        return [1, 1]
    }
    
    var countDict: [String: Int] = [:]
    var start = 0
    var end = 0
    var minDiff = Int.max
    var answer = [0, 0]
    
    while end < gems.count {
        if let _ = countDict[gems[start]] {
            if countDict.count == kinds {
                if end - start < minDiff {
                    minDiff = end - start
                    answer[0] = start + 1
                    answer[1] = end + 1
                }
                
                countDict[gems[start]]! -= 1
                if countDict[gems[start]] == 0 {
                    countDict[gems[start]] = nil
                }
                start += 1
                
            } else {
                if let _ = countDict[gems[end]]{
                    countDict[gems[end]]! += 1
                    end += 1
                } else {
                    countDict[gems[end]] = 0
                }
            }
        } else {
            countDict[gems[start]] = 0
        }
    }
    
    return answer
}
 */

/* 시간초과
func solution(_ gems:[String]) -> [Int] {
    // 전체 보석에서 좌 or 우 하나씩 빼보기
    var gemDict: [String: Int] = [:]
    for gem in gems {
        if gemDict[gem] != nil {
            gemDict[gem]! += 1
        } else {
            gemDict[gem] = 1
        }
    }
    var startIdx = Int.max
    var endIdx = Int.max
    var sectionCnt = Int.max
    var stack: [(leftIdx: Int, rightIdx: Int, remainGemDict: [String: Int])] = []
    stack.append((leftIdx: 0, rightIdx: gems.count-1, remainGemDict: gemDict))

    while !stack.isEmpty {
        let shopping = stack.removeLast()
        var leftIdx = shopping.leftIdx
        var rightIdx = shopping.rightIdx
        var remainGemDict = shopping.remainGemDict
        print()
        if rightIdx - leftIdx == sectionCnt && leftIdx <= startIdx {
            sectionCnt = rightIdx - leftIdx
            startIdx = leftIdx
            endIdx = rightIdx
        } else if rightIdx - leftIdx < sectionCnt {
            sectionCnt = rightIdx - leftIdx
            startIdx = leftIdx
            endIdx = rightIdx
        }
        if let gemCnt = remainGemDict[gems[leftIdx]], gemCnt >= 2 {
            remainGemDict[gems[leftIdx]]! -= 1
            stack.append((leftIdx: leftIdx + 1, rightIdx: rightIdx, remainGemDict: remainGemDict))
            remainGemDict[gems[leftIdx]]! += 1
        }
        if let gemCnt = remainGemDict[gems[rightIdx]], gemCnt >= 2 {
            remainGemDict[gems[rightIdx]]! -= 1
            stack.append((leftIdx: leftIdx - 1, rightIdx: rightIdx, remainGemDict: remainGemDict))
            remainGemDict[gems[rightIdx]]! += 1
        }
    }
    return [startIdx + 1, endIdx + 1]
}
 */
