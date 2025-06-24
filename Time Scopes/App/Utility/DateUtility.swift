//
//  DateUtility.swift
//  Chrono
//
//  Created by ymy on 1/17/25.
//

import Foundation
import SwiftUI

var dateComponents = DateComponents()

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

let lengthOfYear = daysInYear(for: dateComponents.year ?? 0)

func daysInYear(for year: Int) -> Int {
    func isLeapYear(_ year: Int) -> Bool {
        if year % 4 == 0 {
            if year % 100 == 0 {
                return year % 400 == 0
            }
            return true
        }
        return false
    }
    print(#file, #line, #function, "Days in this year: \(isLeapYear(year) ? 366 : 365)")
    return isLeapYear(year) ? 366 : 365
}

var now = Date()
let calendar = Calendar.current
let today = calendar.startOfDay(for: now)
