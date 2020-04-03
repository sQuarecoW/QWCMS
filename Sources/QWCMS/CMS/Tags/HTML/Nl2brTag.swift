//
//  Nl2brTag.swift
//
//
//  Created by Jan-Willem Oskam on 13-09-19.
//


import Foundation
import Leaf

//public final class Nl2brTag: TagRenderer {
//    
//    public func render(tag: TagContext) throws -> EventLoopEventLoopFuture<TemplateData> {
//        try tag.requireParameterCount(1)
//        
//        var html = ""
//        
//        if let string = tag.parameters[0].string {
//            html = string.replacingOccurrences(of: "\n", with: "<br />")
//        }
//        
//        return EventLoopFuture.map(on: tag.container) { .string(html) }
//        
//    }
//}
