//
//  Monday.swift
//  Chrono
//
//  Created by 윤무영 on 12/13/24.
//

import Foundation
import SwiftUI

struct AnnualMondayProperties {
    let name: String = "Remining Mondays :"
    var count: Int = 0

    init() {
            self.update()
        }

    func calculateMondays(from startDate: Date, to endDate: Date) -> Int {

        var mondaysCount = 0
        var date = startDate

        while date <= endDate {
            if calendar.component(.weekday, from: date) == 2 { // 월요일
                mondaysCount += 1
            }
            date = calendar.date(byAdding: .day, value: 1, to: date)!
        }

        return mondaysCount
    }

    func remainingMondaysInYear() -> Int {

        let currentYear = calendar.component(.year, from: now)

        guard let startOfYear = calendar.date(from: DateComponents(year: currentYear, month: 1, day: 1)),
              let endOfYear = calendar.date(from: DateComponents(year: currentYear, month: 12, day: 31)) else {
            print(#file, #line, #function, "[remainingMondaysInYear] Failed to calculate start or end of year.")
            return 0
        }

        let mondaysPassed = calculateMondays(from: startOfYear, to: now)
        let totalMondays = calculateMondays(from: startOfYear, to: endOfYear)
        return totalMondays - mondaysPassed
    }

    func totalMondaysInYear() -> Int {

        let currentYear = calendar.component(.year, from: now)

        guard let startOfYear = calendar.date(from: DateComponents(year: currentYear, month: 1, day: 1)),
              let endOfYear = calendar.date(from: DateComponents(year: currentYear, month: 12, day: 31)) else {
            print(#file, #line, #function, "[totalMondaysInYear] Failed to calculate start or end of year.")
            return 0
        }

        return calculateMondays(from: startOfYear, to: endOfYear)
    }

    mutating func update() {
        let remainingMondays = self.remainingMondaysInYear()

        self.count = remainingMondays
    }
}
