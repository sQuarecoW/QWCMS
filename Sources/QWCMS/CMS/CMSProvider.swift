//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 19-07-19.
//

import Foundation
import Vapor
import Leaf
import FluentPostgreSQL

///
public struct CMSProvider: Provider {
    public init() {}
    
    public func register(_ services: inout Services) throws {
        // registeer alles wat we nodig hebben
        try services.register(LeafProvider())
        try services.register(FluentPostgreSQLProvider())
        
        // assetmanager
        services.register(AssetManager())
        // current request values
        services.register(CurrentRequest())
        services.register(CurrentRequestMiddleware())
         
        // all our middlewares
        var middlewares = MiddlewareConfig() // Create _empty_ middleware config
        // Vapor middlewares
        middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
        middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
        
        // our custom middleware
        middlewares.use(CurrentRequestMiddleware.self)
        
        // register them
        services.register(middlewares)
    }
    
    public func willBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        
        // load all the assets from the manifest
        let assetManager: AssetManager = try container.make()
        try assetManager.reload(on: container)
        
        // we're done
        return .done(on: container)
    }
    
    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        
        // we're done
        return .done(on: container)
    }
    
}
