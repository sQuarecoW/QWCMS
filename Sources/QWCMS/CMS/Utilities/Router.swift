//
//  Router.swift
//  App
//
//  Created by Jan-Willem Oskam on 25-06-19.
//

import Vapor

/// CMS Router
///
/// This is de `TrieRouter` that is used by the CMS. It provides a predefined routegroup for all admin routes
///
/// - note: this uses the default EngineRouter from Vapor
public final class CMSRouter: Router {
    
    /// Admin routeprefix
    private var adminRoutePrefix: String
    
    /// See `Router`
    private let router: Router
    
    /// adminRouter
    ///
    /// Currently consists of a simple grouped router
    public let adminRouter: Router
    
    /// Create a new `CMSRouter`
    public init(adminRoutePrefix: String) {
        router = EngineRouter.default()
        self.adminRoutePrefix = adminRoutePrefix
        
        adminRouter = router.grouped(adminRoutePrefix)
    }
    
    /// See `Router`
    public func register(route: Route<Responder>) {
        router.register(route: route)
    }
    
    /// See `Router`
    public var routes: [Route<Responder>] {
        return router.routes
    }
    
    /// See `Router`
    public func route(request: Request) -> Responder? {
        return router.route(request: request)
    }
}
