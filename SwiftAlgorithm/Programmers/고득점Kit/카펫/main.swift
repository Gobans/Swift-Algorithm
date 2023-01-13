//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/13.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // 가로, 세로를 늘리는 동작을 반복하여 만족하는 brown, yellow의 갯수를 찾는다. (가로 >= 세로 일때 세로를 늘림)
    // 가로로 늘리는 동작: yellow + 1*(height-2), brown + 2
    // 세로로 늘리는 동작: yellow + i*(width-2), brown + 2*n
    var answer: [Int] = []
    func searchCarpet(curBrown: Int, curYellow: Int, width: Int, height: Int) {
        if curBrown == brown && curYellow == yellow {
            answer = [width, height]
            return
        }
        if curBrown >= brown || curYellow >= yellow {
            return
        }
        // 가로로 늘리기
        searchCarpet(curBrown: curBrown + 2, curYellow: curYellow + height-2, width: width + 1, height: height)
        // 세로로 늘리기
        if width > height {
            for i in 1...width - height {
                if (curBrown + (2*i) == brown) && (curYellow + i*(width-2) == yellow) {
                    answer = [width, height + i]
                    return
                }
            }
        }
    }
    searchCarpet(curBrown: 8, curYellow: 1, width: 3, height: 3)
    return answer
}
