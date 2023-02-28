//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/28.
//

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
  var answer = 0
  var index = 0
  var location = 1
  
  while location <= n {
    if (stations[index] - w ... stations[index] + w).contains(location) {
      location = stations[index] + w + 1
      
      if stations.count - 1 > index { index += 1 }
    } else {
      answer += 1
      location += w * 2 + 1
    }
  }
  
  return answer
}

/* Test case 1, 15 fail
func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    // 기지국의 전파가 닿는 곳 까지 w의 count를 끊어서 생각.
    var answer = 0
    var apartMap = Array(repeating: false, count: n + 1)
    stations.forEach { station in
        var waveStart = station - w < 1 ? 1 : station - w
        var waveEnd = station + w > n ? n : station + w
        for i in waveStart...waveEnd {
            apartMap[i] = true
        }
    }
    var stationCnt = 0
    var waveCnt = 0
    for i in 1...n {
        if apartMap[i] || i == n {
            stationCnt += Int(ceil(Double(waveCnt) / Double(w*2 + 1)))
            waveCnt = 0
        } else if !apartMap[i] {
            waveCnt += 1
        }
    }
    return stationCnt
}
 */
