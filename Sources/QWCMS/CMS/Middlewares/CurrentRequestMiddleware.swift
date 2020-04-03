//
//  CurrentRequestMiddleware.swift
//  
//
//  Created by Jan-Willem Oskam on 19-07-19.
//

import Foundation
import Vapor

//public struct CurrentRequestMiddleware: Middleware {
//    
//    public func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopEventLoopFuture<Response> {
//        let currentRequest: CurrentRequest = try request.privateContainer.make()
//        
//        // select the first language
//        currentRequest.language = request.http.headers[canonicalForm: "Accept-Language"].first ?? ""
//        
//        currentRequest.httpProtocol = Environment.get("HTTP_PROTOCOL") ?? "http"
//        currentRequest.host = request.http.headers.firstValue(name: .host) ?? ""
//        
//        currentRequest.siteUrl = currentRequest.httpProtocol + "://" + currentRequest.host
//        
//        return try next.respond(to: request)
//    }
//}
//
//extension CurrentRequestMiddleware: ServiceType {
//    /// See `ServiceType`.
//    public static func makeService(for container: Container) throws -> CurrentRequestMiddleware {
//        return .init()
//    }
//}
