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
    
    init(index: Int, offSet: Int) {
        self.index = index
        self.offSet = offSet
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
        let value = Date().getDayFromDate()
        if todayDate == value {
            return true
        }
        return false
    }
}
