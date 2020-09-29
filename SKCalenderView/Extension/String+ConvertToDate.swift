//
//  String+ConvertToDate.swift
//  CarFit
//
//  Created by Subrat Kheti on 03/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation

extension String {
    func getStartTimeFromDate() -> String  {

        let date = self.stringToDate()
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let startTime  = String (hour) + ":" +  String(minutes)
        
        return startTime
        
    }

    func stringToDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self) 
        
        return date!
    }

}
