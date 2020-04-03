//
//  UserInfoTag.swift
//  
//
//  Created by Jan-Willem Oskam on 23-09-19.
//


import Foundation
import Leaf

//public final class UserInfoTag: TagRenderer {
//    
//    public func render(tag: TagContext) throws -> EventLoopEventLoopFuture<TemplateData> {
//        try tag.requireParameterCount(1)
//        
//        guard let key = tag.parameters[0].string, let value = tag.context.userInfo[key] as? String else {
//            return EventLoopFuture.map(on: tag) { .string("not found") }
//        }
//        
//        return EventLoopFuture.map(on: tag) { .string(value) }
//    }
//}
