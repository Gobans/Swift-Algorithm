//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/01/31.
//

import Foundation

func solution(_ input_array:[String]) -> Int {
    var arr = input_array
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
