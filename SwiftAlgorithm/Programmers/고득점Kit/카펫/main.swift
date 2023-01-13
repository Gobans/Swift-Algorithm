//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/13.
//

import Foundation

// stack
struct Carpet {
    let brown: Int
    let yellow: Int
    let width: Int
    let height: Int
}

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var answer: [Int] = []
    var searchStack: [Carpet] = []
    searchStack.append(Carpet(brown: 8, yellow: 1, width: 3, height: 3))

    while !searchStack.isEmpty {
        let carpet = searchStack.removeLast()
        if carpet.brown == brown, carpet.yellow == yellow {
            return [carpet.width, carpet.height]
        }
        if carpet.brown >= brown || carpet.yellow >= yellow {
            continue
        }
        if carpet.width > carpet.height {
            for i in 1...carpet.width - carpet.height {
                if (carpet.brown + (2*i) == brown) && (carpet.yellow + i*(carpet.width-2) == yellow){
                    return [carpet.width, carpet.height + i]
                }
            }
        }
        searchStack.append(Carpet(brown: carpet.brown + 2, yellow: carpet.yellow + carpet.height - 2, width: carpet.width + 1, height: carpet.height))
    }
    return answer
}


/* 재귀
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var answer: [Int] = []
    func searchCarpet(curBrown: Int, curYellow: Int, width: Int, height: Int) {
        if curBrown == brown && curYellow == yellow {
            answer = [width, height]
            return
        }
        if curBrown >= brown || curYellow >= yellow {
            return
        }
        searchCarpet(curBrown: curBrown + 2, curYellow: curYellow + height-2, width: width + 1, height: height)
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
 */
