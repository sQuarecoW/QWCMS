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
        
        // custom leaf tags
        services.register { container -> LeafTagConfig in
            var config = LeafTagConfig.default()
            config.use(EmbedAssetTag(), as: "embedAsset")
            config.use(IncludeAssetTag(), as: "includeAsset")
            return config
        }
        
        // all our middlewares
        services.register { container -> MiddlewareConfig in
            var middleware = MiddlewareConfig()
            // register your custom middleware here
            middleware.use(CurrentRequestMiddleware.self)
            return middleware
        }
        
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
