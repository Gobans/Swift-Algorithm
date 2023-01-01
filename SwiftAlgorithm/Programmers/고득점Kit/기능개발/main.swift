//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/01.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer: [Int] = []
    var cProgresses = progresses
    var index = 0
    while(true) {
        // 1. progress + speed 를 반복해서 더해준다.
        for idx in index..<cProgresses.endIndex {
            cProgresses[idx] += speeds[idx]
        }
        var cnt = 0
        // 2. 첫번쨰 작업이 완료되었다면 그 다음 작업도 확인해준다.
        while (index < cProgresses.count) {
            if cProgresses[index] >= 100{
                cnt += 1
                index += 1
            } else {
                break
            }
        }
        // 3. 완료된 작업을 answer 배열에 추가해준다.
        if cnt != 0 {
            answer.append(cnt)
        }
        if index == cProgresses.count {
            break
        }
    }
    return answer
}
