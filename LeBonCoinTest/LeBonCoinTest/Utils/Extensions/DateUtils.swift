//
//  DateUtils.swift
//  MyVestiaireWeather
//
//  Created by Bérangère La Touche on 15/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

enum DateFormatterString {
    case dateEN
    case dateFR
    case hours
}

extension DateFormatterString : RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch (rawValue) {
        case "MMM dd, yyyy": self = .dateEN
        case "dd MMM, yyyy HH:mm": self = .dateFR
        case "HH:mm": self = .hours
            
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .dateEN: return "MMM dd, yyyy"
        case .dateFR: return "dd MMM, yyyy HH:mm"
        case .hours: return "HH:mm"
        }
    }
}

/// Transform time interval to String with a specific formatter
extension Date {
    func toDateString(format: DateFormatterString) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = .current
        return formatter.string(from: self)
    }
}
