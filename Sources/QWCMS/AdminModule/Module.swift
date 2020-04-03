//
//  Module.swift
//  App
//
//  Created by Jan-Willem Oskam on 02-07-19.
//

import Vapor
import FluentPostgresDriver

public struct AdminModule: CMSModule {
    
    public let routePrefix = ""
    
    public let application: Application
    
    public init(application: Application) {
        self.application = application
        
        addRoutes(to: application)
    }
    
    func addRoutes(to app: Application) {
        
        // admin routes
        app.adminRoutes.get("/", use: adminDashboardHandler)
    }    
}

func adminDashboardHandler(_ req: Request) throws -> EventLoopFuture<View> {
    return req.view.render("admin")
}


