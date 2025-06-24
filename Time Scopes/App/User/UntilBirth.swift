//
//  UntilBirth.swift
//  Chrono
//
//  Created by ymy on 2/11/25.
//

import Foundation

extension UserData {
    func daysUntilBirth() -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        if birthday > today {
            return Calendar.current.dateComponents([.day], from: today, to: birthday).day ?? 0
        }
        return 0
    }
}
