//
//  main.swift
//  SwiftAlgorithm
//
//  Created by Lee Myeonghwan on 2023/03/21.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var answer = 0
    var busCnt = 0
    var curTime = 540
    var curRide = 0
    let minutetable = timetable.map{convertMinute($0)}.sorted(by:>)
    let minutetableCnt = minutetable.count
    let lastRideIdx = minutetableCnt - 1
    var cMinutetable = minutetable
    var isFull = false
    while busCnt < n {
        busCnt += 1
        while !cMinutetable.isEmpty && cMinutetable.last! <= curTime && curRide < m{
            cMinutetable.removeLast()
            curRide += 1
        }
        isFull = curRide == m ? true : false
        curTime += t
        curRide = 0
    }
    let remainRiderIdx = lastRideIdx - cMinutetable.count
    if isFull {
        answer = minutetable.reversed()[remainRiderIdx] - 1
    } else {
        answer = 540 + (n-1)*t
    }
    return convertMinuteToFormat(answer)
}

func convertMinute(_ time: String) -> Int {
    let sep = time.components(separatedBy: ":")
    let hour = Int(sep[0])!
    let minute = Int(sep[1])!
    return hour*60 + minute
}

func convertMinuteToFormat(_ time: Int) -> String {
    var hour = time/60
    var minute = time%60
    var strHour = String(hour)
    var strMinute = String(minute)
    if hour < 10 {
       strHour = "0" + strHour
    }
    if minute < 10 {
       strMinute = "0" + strMinute
    }
    return strHour + ":" + strMinute
}
