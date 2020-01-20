//
//  DateUtils.swift
//  MyVestiaireWeather
//
//  Created by Bérangère La Touche on 15/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

enum DateFormatterString {
    case date
    case hours
}

extension DateFormatterString : RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch (rawValue) {
        case "MMM dd, yyyy": self = .date
        case "HH:mm": self = .hours
            
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .date: return "MMM dd, yyyy"
        case .hours: return "HH:mm"
        }
    }
}

/// Transform time interval to String with a specific formatter
extension TimeInterval {
    func toDateString(format: DateFormatterString) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
}
