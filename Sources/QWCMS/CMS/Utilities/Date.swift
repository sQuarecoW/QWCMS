//
//  Date.swift
//  
//
//  Created by Jan-Willem Oskam on 15-08-19.
//

import Foundation

extension Date {
    
    /// Return a Calendar Component for this date
    /// - Parameter component: The requested Calendar Component
    public func component(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    /// Compare this date to another date to see if they are the same day
    public func isSameDay(as date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    /// Convenience init for Date as supplied by JavaScript
    /// JS uses milliseconds as the unit of measurement
    ///
    /// See this MDN articel for reference: [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getTime)
    public init (millisecondsSince1970: Int) {
        self.init(timeIntervalSince1970: TimeInterval(millisecondsSince1970 / 1000))
    }
}

extension Array where Element == Date {
    
    /// An Dictionary of dates grouped by week
    public var datesByWeek: [Int: [Date]] {
        var grouped: [Int: [Date]] = [:]
        
        for date in self {
            grouped[date.component(.weekOfYear), default: []].append(date)
        }
        
        return grouped
    }
}
