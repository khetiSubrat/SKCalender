//
//  DateCalculation.swift
//  CarFit
//
//  Created by Subrat Kheti on 07/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation

extension Date {

    // MARK: Calulate Number Of Days
    func numberOfDays() -> Int {
        let calendar = Calendar.current

        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count

        return numDays
    }

    // MARK: Day Id from Date
    func getDayFromDate() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        
        let day = calendar.component(.day, from: self)
        
        return day
    }

    // MARK: Month From Date
    func getMonthFromDate() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!

        let month = calendar.component(.month, from: self)

        return month
    }

    // MARK: Year From Date
    func getYearFromDate() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let year = calendar.component(.year, from: self)
        
        return year
    }
 
    // MARK: Next Month From Date
    func nextMonthFromCurrentDate() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    // MARK: Previous Month From Date
    func previousMonthFromCurrentDate()-> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }

    // MARK: Starting Date From Date
    func startOfMonth() -> Date? {
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: self)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar.date(from: comp)!
    }

    // MARK: Calculate next day based on x
    func getNextXDays(where x: Int)-> Date? {
        return Calendar.current.date(byAdding: .day, value: x, to: self)
    }
    
    func convertDatetoString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    func isSelecteDateToday(date: Date) -> Bool {
        if self.getDayFromDate() == date.getDayFromDate() {
            return true
        }
        
        return false
    }
    
    func getWeekday() -> Int {
        return Calendar.current.component(.weekday, from: self)
    }
}

