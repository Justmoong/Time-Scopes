//
//  WeekCount.swift
//  Chrono
//
//  Created by ymy on 1/21/25.
//

import Foundation
import SwiftUI
import Combine

class WeekCount: ObservableObject {
    @Published var leftWeeks: Int = 0 {
        didSet {
            print("Remaining weeks: \(leftWeeks)")
        }
    }
    
    @Published var userData: UserData
    private var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: UserData) {
        self.userData = viewModel
        calculateWeeks(from: viewModel)
    }
    
    func calculateWeeks(from userData: UserData) {
        let deathDate = userData.deathDate

        let remainingDays = calendar.dateComponents([.day], from: now, to: deathDate).day ?? 0
        leftWeeks = max(remainingDays / 7, 0)
        print(#file, #line, #function, "Remaining weeks: \(self.leftWeeks)")
    }
}
