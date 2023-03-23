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

/* other's
import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let n = lock.count
    let m = key.count

    // key를 돌리는 함수
    func rotate() {
        var newKey = [[Int]]()
        for x in 0..<m {
            var temp = [Int]()
            for y in (0..<m).reversed() {
                temp.append(key[y][x])
            }
            newKey.append(temp)
        }
        key = newKey
    }

    // 현재 key를 기준으로 test를 수행하는 함수
    func test() -> Bool {
        for py in 1-m..<n+1 {
            for px in 1-m..<n+1 {
                var mlock = lock
                for y in 0..<m {
                    for x in 0..<m {
                        if py+y >= 0 && px+x >= 0 && py+y < n && px+x < n {
                            mlock[py+y][px+x] += key[y][x]
                        }
                    }
                }
                if check(mlock) { return true }
            }
        }
        return false
    }

    // 현재 자물쇠값을 확인하는 함수
    func check(_ lock: [[Int]]) -> Bool {
        for y in 0..<lock.count {
            for x in 0..<lock.count {
                if lock[y][x] != 1 {
                    return false
                }
            }
        }
        return true
    }

    // 현재 상태에서 한번 테스트
    if test() { return true }

    // 돌려서 테스트 3번
    for _ in 1...3 {
        rotate()
        if test() { return true }
    }

    return false
}
 */
