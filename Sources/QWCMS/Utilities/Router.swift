//
//  Router.swift
//  App
//
//  Created by Jan-Willem Oskam on 25-06-19.
//

import Vapor

/// CMS Router
///
/// - note: this uses the default EngineRouter from Vapor
public final class CMSRouter: Router {
    
    private let router: Router
    
    public let adminRouter: Router
    
    public init() {
        router = EngineRouter.default()
        
        adminRouter = router.grouped("admin")
    }
    
    public func register(route: Route<Responder>) {
        router.register(route: route)
    }
    
    
    public var routes: [Route<Responder>] {
        return router.routes
    }
    
    public func route(request: Request) -> Responder? {
        return router.route(request: request)
    }
}
