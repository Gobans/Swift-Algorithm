//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/02/05.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var flightDict: [String: Int] = [:]
    var flightSet = Set<String>()
    for ticket in tickets {
        ticket.forEach { flight in
            flightSet.insert(flight)
        }
    }
    let sortedFlightSet = flightSet.sorted(by: <)
    var flightIndexCnt = 0
    for flight in sortedFlightSet {
        flightDict[flight] = flightIndexCnt
        flightIndexCnt += 1
    }
    var flightMap: [[Int]] = Array(repeating: Array(repeating: 0, count: sortedFlightSet.count), count: sortedFlightSet.count)
    for ticket in tickets {
        let departFlightIndex = flightDict[ticket[0]]!
        let arriveFlightIndex = flightDict[ticket[1]]!
        flightMap[departFlightIndex][arriveFlightIndex] += 1
    }
    let flightCnt = sortedFlightSet.count
    let depth = tickets.count
    var targetSearched = false
    var answerTravelCourse: [String] = []
    func DFS(departFlightIndex: Int, travelCourse: [String], usedTicketCnt: Int) {
        if usedTicketCnt == depth {
            targetSearched = true
            answerTravelCourse = travelCourse
            return
        }
        var travelCourse = travelCourse
        for i in 0..<flightCnt {
            if !targetSearched && flightMap[departFlightIndex][i] >= 1 {
                travelCourse.append(sortedFlightSet[i])
                flightMap[departFlightIndex][i] -= 1
                DFS(departFlightIndex: i, travelCourse: travelCourse, usedTicketCnt: usedTicketCnt + 1)
                flightMap[departFlightIndex][i] += 1
                travelCourse.removeLast()
            }
        }
    }
    DFS(departFlightIndex: flightDict["ICN"]!, travelCourse: ["ICN"], usedTicketCnt: 0)
    return answerTravelCourse
}
