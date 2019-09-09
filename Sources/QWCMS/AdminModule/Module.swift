//
//  Module.swift
//  App
//
//  Created by Jan-Willem Oskam on 02-07-19.
//

import Vapor
import FluentPostgreSQL

public struct AdminModule: CMSModule {
    
    public let routePrefix = ""
    
    public init() {}
    
    public func addRoutes(to router: CMSRouter) throws {
        
        // admin routes
        let adminRouteGroup = router.adminRouter
        adminRouteGroup.get("/", use: adminDashboardHandler)
    }    
}

func adminDashboardHandler(_ req: Request) throws -> Future<View> {
    return try req.view().render("admin/base", "")
}


