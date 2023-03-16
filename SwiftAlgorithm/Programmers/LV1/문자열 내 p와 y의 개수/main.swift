//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/16.
//

import Foundation

func solution(_ s:String) -> Bool
{
    return s.map{ $0.lowercased() }.filter{ $0 == "p"}.count == s.map{ $0.lowercased() }.filter{ $0 == "y"}.count
}

/* other's
func solution(_ s:String) -> Bool
{
    let string = s.lowercased()
    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
}
 */
