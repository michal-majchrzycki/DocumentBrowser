//
//  DateHelper.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import Foundation

class DateHelper {
    
    static let dateFormatter = DateFormatter()
    
    class func dateFrom(string: String) -> Date? {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter.date(from: string)
    }
    
    class func stringFrom(date: Date) -> String? {
        dateFormatter.dateFormat = "dd/MM-yy HH:mm"
        return dateFormatter.string(from: date)
    }

}
