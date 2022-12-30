//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2022/12/30.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    // 장르별로 재생횟수의 총합을 구한 후 내림차순으로 정렬
    var genrePlayCountDict: [String:Int] = [:]
    for (genre, play) in zip(genres, plays){
     if genrePlayCountDict[genre] != nil {
         genrePlayCountDict[genre]! += play
     } else {
         genrePlayCountDict[genre] = play
     }
    }
    let sortedGenrePlayCountDict = genrePlayCountDict.sorted(by: {$0.value > $1.value}).map{ $0.key }
    
    // 장르마다 반목문을 돌면서 해당 song의 고유 번호 (idx) 를 dictionary의 key값, 재생횟수를 value값으로 저장
    var bestAlbum: [Int] = []
    for genreName in sortedGenrePlayCountDict {
        var songPlayCountDict: [Int:Int] = [:]
        for (idx, genre) in genres.enumerated() {
            if genreName == genre {
                songPlayCountDict[idx] = plays[idx]
            }
        }
        // 재생횟수가 같으면 고유번호가 낮은 순으로 정렬, 그외에는 재생횟수의 내림차순으로 정렬
        let sortedSongPlayCountDict = songPlayCountDict.sorted{ (f,s) -> Bool in
            if f.value == s.value {
                return f.key < s.key
            }
            return f.value > s.value
        }.map { $0.key }
        // bestAlbum의 최대 수록 횟수가 2번이기 떄문에 maxAddCount로 수록 횟수 제어
        var maxAddCount = 2
        for songNum in sortedSongPlayCountDict {
            maxAddCount -= 1
            bestAlbum.append(songNum)
            if maxAddCount == 0 {
                break
            }
        }
    }
    return bestAlbum
}
