//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/22.
//

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    // 열쇠: 돌기 = 1
    // 자물쇠: 홈 = 0
    // 자물쇠의 영역안에서는 돌기 끼리 만나면 안됨.
    // 90도 씩 이동한 좌표들을 저장. (4개)
    var keys: [[(x: Int, y: Int)]] = []
    var keyCoordinates: [(x: Int, y: Int)] = []
    var adjustedKeys: [(x: Int, y: Int)] = []
    for i in 0..<key.count {
        for j in 0..<key[i].count {
            if key[i][j] == 1 {
                keyCoordinates.append((x: j, y: i))
            }
        }
        keyCoordinates.sort { (lhs, rhs) in
            if lhs.x == rhs.x {
                return lhs.y <= rhs.y
            }
            return lhs.x < rhs.x
        }
    }
    keys.append(keyCoordinates)
    for k in 0...2 {
         keys.append(keys[k].map{ rotate(x: $0.x, y: $0.y) })
    }
    keys.forEach{ print($0) }
    // lock의 홈을 기준으로 좌표를 맞춤
    // 좌표를 맞췄을 때, 어떤 좌표가 lock의 돌기와 충돌하는지 확인.
//    keys.forEach{adjustedKeys.map{ $0 }}
    
    
    return true
}

func rotate(x: Int, y: Int) -> (Int, Int){
    return (y, -x)
}
