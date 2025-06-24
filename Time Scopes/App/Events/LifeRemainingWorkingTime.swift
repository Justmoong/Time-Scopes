//
//  LifeRemainingWorkingTime.swift
//  Life Taker
//
//  Created by ymy on 2/13/25.
//

import Foundation
import SwiftUI

class LifeRemainingWorkingTime: ObservableObject {
    @Published var remainingWorkingDays: Int = 0
    @Published var remainingWorkingHours: Int = 0
    
    @ObservedObject var userLivedTime: UserLivedTime {
        didSet {
            self.updateRemainingWorkingTime()
        }
    }
    
    init(userLivedTime: UserLivedTime) {
        self.userLivedTime = userLivedTime
        self.updateRemainingWorkingTime()
    }
    
    func updateRemainingWorkingTime() {
        let expectedDeathDate = calendar.date(
                byAdding: .year,
                value: userLivedTime.userData.deathAge - userLivedTime.userData.age,
                to: today
            ) ?? today

            guard expectedDeathDate >= today else {
                DispatchQueue.main.async {
                    self.remainingWorkingDays = 0
                    self.remainingWorkingHours = 0
                }
                return
            }

            let remainingDays = calendar.dateComponents([.day], from: today, to: expectedDeathDate).day ?? 0
            let remainingWeekdays = countWeekdays(from: today, daysRemaining: remainingDays)
            let workingHoursPerDay = 8
        
        self.remainingWorkingDays = remainingWeekdays
        self.remainingWorkingHours = remainingWeekdays * workingHoursPerDay
    }
    
    private func countWeekdays(from startDate: Date, daysRemaining: Int) -> Int {
        var weekdaysCount = 0
        var date = startDate
        
        for _ in 0..<daysRemaining {
            if let nextDay = calendar.date(byAdding: .day, value: 1, to: date) {
                let weekday = calendar.component(.weekday, from: nextDay)
                if weekday != 1 && weekday != 7 {
                    weekdaysCount += 1
                }
                date = nextDay
            }
        }
        
        return weekdaysCount
    }
    
}
