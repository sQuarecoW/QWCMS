//
//  BSCustomSelectTag.swift
//  
//
//  Created by Jan-Willem Oskam on 24-10-19.
//

import Foundation
import Leaf
import Async

///
public final class DatePickerTag: TagRenderer {
    
    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        
        var dateValue = ""
        var hourValue = 0
        var minuteValue = 0
        
        // is there a date supplied?
        // this will be a Double
        if let timestamp = tag.parameters[0].double {
            let date = Date(timeIntervalSince1970: timestamp)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            
            dateValue = dateFormatter.string(from: date)
            
            hourValue = date.component(.hour)
            minuteValue = date.component(.minute)
        }
        
        // do we show a timepicker?
        var showTime = true
        if tag.parameters.count > 1, let s = tag.parameters[1].bool {
            showTime = s
        }
        
        var html =
            """
            <div class="col-auto">
                <div class="input-group datepicker datepicker-popover">
                    <input type="text" class="form-control date" name="date" placeholder="Datum" value="\(dateValue)">
                    <div class="input-group-append">
                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                    </div>
                </div>
            </div>
            """
        
        if showTime {
                html +=
                """
                <div class="col-auto">
                    <div class="input-group">
                      <select class="custom-select hour">
                """
            
            for i in 0...23 {
                html += "<option value=\"\(i < 10 ? "0" : "")\(i)\"\(i == hourValue ? " selected=\"selected\"" : "")>\(i < 10 ? "0" : "")\(i)</option>"
            }
            
            html +=
                """
                      </select>
                      <select class="custom-select minute">
                """
            
            for i in 0...59 {
                html += "<option value=\"\(i < 10 ? "0" : "")\(i)\"\(i == minuteValue ? " selected=\"selected\"" : "")>\(i < 10 ? "0" : "")\(i)</option>"
            }
            
            html +=
                """
                      </select>
                      <div class="input-group-append">
                        <span class="input-group-text"><i class="far fa-clock"></i></span>
                      </div>
                    </div>
                </div>
                """
        }
        
        return Future.map(on: tag) { return .string(html) }
    }
}
