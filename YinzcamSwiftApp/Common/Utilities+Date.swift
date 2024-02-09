//
//  Utilities+Date.swift
//  YinzcamSwiftApp
//
//  Created by Setu Desai on 2/9/24.
//

import Foundation

extension Date {
    static func timeZoneConverterZ(dateTimeString : String, abbString : String) -> [Substring] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: abbString) as TimeZone?
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: dateTimeString)
        dateFormatter.date(from: dateTimeString)
        dateFormatter.dateFormat = "EEE, MMM d'T'HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: TimeZone.current.identifier) as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        return timeStamp.split(separator: "T")
    }

    static func timeChange24(date : String, timeapm : String) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        let dates = timeFormatter.date(from: timeapm)
        timeFormatter.dateFormat = "HH:mm:ss"
        let date24 = timeFormatter.string(from: dates!)
        let oppT:String = "\(String(describing: date))" + "T" + "\(date24)"
        return oppT
    }

    static func convertTimeZoneAbbrevation(wholeString :String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let convertedDate = dateFormatter.date(from: wholeString)
        dateFormatter.date(from: wholeString)
        dateFormatter.dateFormat = "zzz"
        let timeStamp = dateFormatter.string(from: convertedDate!)
        return timeStamp
    }
}
