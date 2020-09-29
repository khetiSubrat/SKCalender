//
//  DayViewModel.swift
//  SKCalenderView
//
//  Created by Subrat Kheti on 29/09/20.
//  Copyright © 2020 Subrat Kheti. All rights reserved.
//

import Foundation

struct DayViewModel {
    var offSet: Int
    var index: Int
    var currentDate: Date
    
    init(index: Int, offSet: Int, currentDate: Date) {
        self.index = index
        self.offSet = offSet
        self.currentDate = currentDate
    }
    
     var todayDate: Int {
        if self.offSet > self.index {
            return 0
        }
        return self.index - self.offSet + 1
    }
    
    var isShow: Bool {
        if self.offSet > self.index {
            return true
        }
        return false
    }
    
    var isTodayDate: Bool {
        return (self.currentDate.getMonthFromDate() == Date().getMonthFromDate())
            && (self.currentDate.getYearFromDate() == Date().getYearFromDate())
            && (todayDate ==  Date().getDayFromDate()) ? true : false
    }
}
