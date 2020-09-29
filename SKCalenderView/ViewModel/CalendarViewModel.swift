//
//  CalenderViewModel.swift
//  SKCalenderView
//
//  Created by Subrat Kheti on 29/09/20.
//  Copyright © 2020 Subrat Kheti. All rights reserved.
//

import Foundation

struct CalendarViewModel {
    private var date: Date!
    
    init(date: Date) {
        self.date = date
    }
    
    func offset() -> Int {
        let date = self.date.startOfMonth()
        return date?.getWeekday() ?? 0
    }
    
    func numberofRows() -> Int {
        return self.offset() + self.date.numberOfDays()
    }
    
    func configureCell(for index: Int) -> DayViewModel {
        let dayViewModel = DayViewModel(index: index, offSet: self.offset())
        return dayViewModel
    }
}
