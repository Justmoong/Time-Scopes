//
//  ElapsedDate.swift
//  Life Taker
//
//  Created by ymy on 2/13/25.
//

import Foundation

import Foundation

struct ElapsedDateInThisYear {
    
    var daysElapsedThisWeek: Int {
        Self.daysElapsedThisWeek()
    }
    var daysElapsedThisMonth: Int {
        Self.daysElapsedThisMonth()
    }
    var daysElapsedThisYear: Int {
        Self.daysElapsedThisYear()
    }
    
    
    static func daysElapsedThisWeek() -> Int {
       
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
        
        return calendar.dateComponents([.day], from: startOfWeek, to: today).day ?? 0
    }
    
    static func daysElapsedThisMonth() -> Int {
        
        let today = calendar.startOfDay(for: Date())
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!

        return calendar.dateComponents([.day], from: startOfMonth, to: today).day ?? 0
    }
    
    static func daysElapsedThisYear() -> Int {
     
        let today = calendar.startOfDay(for: Date())
        let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: today))!

        return calendar.dateComponents([.day], from: startOfYear, to: today).day ?? 0
    }
}
