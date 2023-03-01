//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/31.
//

import Foundation

func solution(_ arr: [String]) -> Int {
    let n = arr.count / 2 + 1
    var dpMax = [[Int]](repeating: [Int](repeating: -Int.max, count: n), count: n)
    var dpMin = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    for i in 0..<n {
        dpMax[i][i] = Int(arr[i*2])!
        dpMin[i][i] = Int(arr[i*2])!
    }
    for l in 2...n {
        for i in 0...n-l {
            let j = i + l - 1
            for k in i..<j {
                if arr[k*2+1] == "+" {
                    dpMax[i][j] = max(dpMax[i][j], dpMax[i][k] + dpMax[k+1][j])
                    dpMin[i][j] = min(dpMin[i][j], dpMin[i][k] + dpMin[k+1][j])
                } else {
                    dpMax[i][j] = max(dpMax[i][j], dpMax[i][k] - dpMin[k+1][j])
                    dpMin[i][j] = min(dpMin[i][j], dpMin[i][k] - dpMax[k+1][j])
                }
            }
        }
    }
    return dpMax[0][n-1]
}

/* Solution referenced by other's code
func solution(_ input_array:[String]) -> Int {
    let arr = input_array
    var minValue = 0
    var maxValue = 0
    var sumValue = 0
    for idx in stride(from: arr.count - 1, to: -1, by: -1) {
        if arr[idx] == "+" {
            continue
        } else if arr[idx] == "-" {
            let tempMinValue = minValue
            let tempMaxValue = maxValue
            minValue = min(-(sumValue + tempMaxValue), -sumValue + tempMinValue)
            let minusValue = Int(arr[idx + 1])!
            maxValue = max(-(sumValue + tempMinValue), -minusValue + (sumValue-minusValue) + tempMaxValue)
            sumValue = 0
        } else {
            sumValue += Int(arr[idx])!
        }
    }
    maxValue += sumValue
    return maxValue
}
 */
