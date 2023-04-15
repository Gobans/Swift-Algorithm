//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/04/16.
//

import Foundation

func solution(_ s:String) -> String {
    return s.components(separatedBy: " ").map{ separatedString in
        return separatedString.enumerated().map { index, element in
            return index % 2 == 0 ? element.uppercased() : element.lowercased()}.joined() }.joined(separator: " ")
}
