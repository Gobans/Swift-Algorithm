//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/12.
//

import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    
    var answer = 0
    
    // make table pices
    var cTable = table
    var tablePices: [[(Int, Int)]] = []
    for i in 0..<cTable.count {
        for j in 0..<cTable.count {
            if cTable[i][j] == 1 {
                tablePices.append(makePuzzlePice(x: j, y: i, board: &cTable, type: .table))
            }
        }
    }
    // matching pices
    var isVisitedPice = Array(repeating: false, count: tablePices.count)
    var gameBoard = game_board
    for i in 0..<gameBoard.count {
        for j in 0..<gameBoard.count {
            if gameBoard[i][j] == 0 {
                let gameBoardPice = makePuzzlePice(x: j, y: i, board: &gameBoard, type: .game)
                for (idx, tablePice) in tablePices.enumerated() {
                    if isVisitedPice[idx] {
                        continue
                    }
                    if checkEqualPice(gameBoardPice, tablePice) {
                        answer += tablePice.count
                        isVisitedPice[idx] = true
                        break
                    }
                }
            }
        }
    }
    
    return answer
}

enum BoardType {
    case game
    case table
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, -1, 1]
func makePuzzlePice(x: Int, y:Int, board: inout [[Int]], type: BoardType) -> [(Int, Int)] {
    var pice: [(Int, Int)] = []
    var queue: [(Int, Int)] = []
    queue.append((x, y))
    pice.append((x, y))
    if type == .table {
        board[y][x] = 0
    } else {
        board[y][x] = 1
    }
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if 0..<board.count ~= nx && 0..<board.count ~= ny {
                if type == .table {
                    if board[ny][nx] == 1 {
                        board[ny][nx] = 0
                        pice.append((nx, ny))
                        queue.append((nx, ny))
                    }
                } else {
                    if board[ny][nx] == 0 {
                        board[ny][nx] = 1
                        pice.append((nx, ny))
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }
    return pice
}

func rotatePice(pice: inout [(Int, Int)]) {
    pice = pice.map{ ($0.1, -$0.0)}
}

func checkEqualPice(_ pice1: [(Int, Int)], _ pice2: [(Int, Int)]) -> Bool {
    var pice1 = pice1
    var pice2 = pice2
    if pice1.count != pice2.count {
        return false
    }
    pice1.sort{ $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
    pice2.sort{ $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
    
    for _ in 0...3 {
        // adjust pice coordinate
        let diffX = abs(pice1[0].0 - pice2[0].0)
        let diffY = abs(pice1[0].1 - pice2[0].1)
        let adjustX = pice1[0].0 < pice2[0].0 ? -diffX : diffX
        let adjustY = pice1[0].1 < pice2[0].1 ? -diffY : diffY
        pice2 = pice2.map { ($0 + adjustX, $1 + adjustY)}
        pice2.sort{ $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
        
        // check is equal pice
        var isExistEqualPice = true
        for i in 0..<pice1.count {
            if pice1[i] != pice2[i] {
                isExistEqualPice = false
                break
            }
        }
        if isExistEqualPice {
            return true
        }
        
        rotatePice(pice: &pice2)
        pice2.sort{ $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
    }
    return false
}
