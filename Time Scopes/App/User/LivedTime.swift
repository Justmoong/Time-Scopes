//
//  LivedTime.swift
//  Chrono
//
//  Created by ymy on 2/11/25.
//

import Foundation
import Combine
import SwiftUI

class UserLivedTime: ObservableObject {
    @Published var livedMonths: Int = 0
    @Published var livedDays: Int = 0
    @Published var livedHours: Int = 0
    @Published var livedMinutes: Int = 0
    @Published var livedSeconds: Int = 0
    
    @ObservedObject var userData: UserData {
        didSet {
            self.updateTimeLived()
        }
    }
    private var timer: Timer?
    
    init(model: UserData) {
        userData = model
        self.updateTimeLived()
        self.startTimer()
    }
    
    deinit {
        stopTimer()
    }
    
    func updateTimeLived() {

        livedMonths = calendar.dateComponents([.month], from: userData.birthday, to: Date()).month ?? 0
        livedDays = calendar.dateComponents([.day], from: userData.birthday, to: now).day ?? 0
        livedHours = calendar.dateComponents([.hour], from: userData.birthday, to: Date()).hour ?? 0
        livedMinutes = calendar.dateComponents([.minute], from: userData.birthday, to: Date()).minute ?? 0
        livedSeconds = calendar.dateComponents([.second], from: userData.birthday, to: Date()).second ?? 0
        print(#file, #line, #function, "Lived time: \(livedMonths) months, \(livedDays) days, \(livedHours) hours, \(livedMinutes) minutes, \(livedSeconds) seconds")
    }
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            DispatchQueue.main.async {
                self?.updateTimeLived()
            }
        }
        if let timer = timer {
            RunLoop.main.add(timer, forMode: .common)
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
