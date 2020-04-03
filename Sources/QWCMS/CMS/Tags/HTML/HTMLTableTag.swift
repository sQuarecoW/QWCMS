////
////  HTMLTableTag.swift
////
////
////  Created by Jan-Willem Oskam on 13-09-19.
////
//
//
//import Foundation
//import Leaf
//
//public final class HTMLTableTag: TagRenderer {
//    
//    /// Render a single table row for the availability of an venue for a given date
//    /// - Parameter tag: We need an array `[VenueProjectAvailability]`
//    public func render(tag: TagContext) throws -> EventLoopEventLoopFuture<TemplateData> {
//        try tag.requireParameterCount(1)
//        
//        var html = "<table class=\"table\">"
//        
//        for sectionName in ["thead", "tbody", "tfoot"] {
//            if let section = tag.parameters[0].dictionary?[sectionName], let rows = section.dictionary?["rows"]?.array {
//                html += "<\(sectionName)>"
//                
//                for row in rows {
//                    html += "<tr>"
//                    let td = sectionName == "thead" ? "th" : "td"
//                    
//                    if let cells = row.dictionary?["cells"]?.array {
//                        for cell in cells {
//                            let contents = cell.dictionary?["html"]?.string ?? ""
//                            let cssClass = cell.dictionary?["cssClass"]?.string ?? ""
//                            let title = cell.dictionary?["title"]?.string ?? ""
//                            let data = cell.dictionary?["data"]?.dictionary
//                            
//                            var dataString = ""
//                            if let data = data {
//                                
//                                for (k, v) in data {
//                                    dataString += " data-\(k)=\"\(v.string ?? "")\""
//                                }
//                            }
//                            
//                            html += "<\(td) \(cssClass != "" ? " class=\"\(cssClass)\"" : "") title=\"\(title)\" \(dataString)>\(contents)</\(td)>"
//                        }
//                    }
//                    
//                    html += "</tr>"
//                }
//                
//                html += "</\(sectionName)>"
//            }
//        }
//        
//        html += "</table>"
//        
//        return EventLoopFuture.map(on: tag.container) { .string(html) }
//        
//    }
//}
