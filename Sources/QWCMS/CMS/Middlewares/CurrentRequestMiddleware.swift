//
//  CurrentRequestMiddleware.swift
//  
//
//  Created by Jan-Willem Oskam on 19-07-19.
//

import Foundation
import Vapor

struct CurrentRequestMiddleware: Middleware {
    
    func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
        var currentRequest: CurrentRequest = try request.privateContainer.make()
        currentRequest.language = request.http.headers[canonicalForm: "Accept-Language"]
        
        return try next.respond(to: request)
    }
}

extension CurrentRequestMiddleware: ServiceType {
    /// See `ServiceType`.
    static func makeService(for container: Container) throws -> CurrentRequestMiddleware {
        return .init()
    }
}
