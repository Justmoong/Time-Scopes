//
//  CalcChristmas.swift
//  Chrono
//
//  Created by 윤무영 on 11/29/24.
//

import Foundation

struct AnnualChristmasProperties {
    let name: String = "Next Christmas :"
    var count: Int = 0
    var gaugeValue: Int = 0

    init() {
        self.update()
    }
    
    static func remainingChristmasDays() -> Int {

        let currentYear = calendar.component(.year, from: now)
        
        guard let christmasDate = calendar.date(from: DateComponents(year: currentYear, month: 12, day: 25)) else {
            print(#file, #line, #function, "[remainingChristmasDays] Failed to calculate Christmas date.")
            return 0
        }
        
        if now > christmasDate {
            guard let nextChristmasDate = calendar.date(from: DateComponents(year: currentYear + 1, month: 12, day: 25)) else {
                print(#file, #line, #function, "[remainingChristmasDays] Failed to calculate next year's Christmas date.")
                return 0
            }
            let days = calendar.dateComponents([.day], from: now, to: nextChristmasDate).day ?? 0
            print(#file, #line, #function, "[remainingChristmasDays] Days until next Christmas: \(days)")
            return days
        }
        
        let days = calendar.dateComponents([.day], from: now, to: christmasDate).day ?? 0
        print(#file, #line, #function, "[remainingChristmasDays] Days until Christmas: \(days)")
        return days + 1
    }
    static func daysPassedInYear() -> Int {
        
        guard let startOfYear = calendar.date(from: DateComponents(year: calendar.component(.year, from: now), month: 1, day: 1)) else {
            print(#file, #line, #function, "Failed to calculate start of year date.")
            return 0
        }
        print(#file, #line, #function, "[daysPassedInYear] Passed days in this year calculated: \(calendar.dateComponents([.day], from: startOfYear, to: now).day ?? 0)")
        return calendar.dateComponents([.day], from: startOfYear, to: now).day ?? 0
    }
    
    mutating func update() {
        count = AnnualChristmasProperties.remainingChristmasDays()
        gaugeValue = AnnualChristmasProperties.daysPassedInYear()
    }
}
