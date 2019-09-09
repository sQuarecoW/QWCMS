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
    func component(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
}

/// An Dictionary of dates grouped by week
typealias DatesByWeek = [Int: [Date]]

extension Array where Element == Date {
    
    var groupedDates: DatesByWeek {
        var grouped = DatesByWeek()
        
        for date in self {
            grouped[date.component(.weekOfYear), default: []].append(date)
        }
        
        return grouped
    }
}
