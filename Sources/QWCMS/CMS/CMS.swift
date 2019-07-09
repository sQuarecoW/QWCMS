//
//  CMS.swift
//  App
//
//  Created by Jan-Willem Oskam on 26/06/2018.
//

import Foundation
import Vapor
import Leaf
import FluentPostgreSQL

/// sQuarecoW Content Management System
///
/// Base building struct for the CMS
///
/// All CMSModules should first be added to the CMS with `addModule(_:)`
///
/// The initializer is responsible for the following tasks:
/// - making an adminRouter
/// - (re)loading all settings
///
public struct CMSProvider: Provider {
    public init() {}
    
    public func register(_ services: inout Services) throws {
        // registeer alles wat we nodig hebben
        try services.register(LeafProvider())
        try services.register(FluentPostgreSQLProvider())
    }
    
    public func willBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        
        // we're done
        return .done(on: container)
    }
    
    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        // load all modules
//        let cms: CMS = try container.make()
//        try cms.loadModules(on: container)
        
        // we're done
        return .done(on: container)
    }

}

public struct CMS: Service {
    
    /// Alle modules
    ///
    /// Alle CMS-modules worden hier verzameld
    public var modules = [CMSModule]()
    
    /// Router
    ///
    /// First the baseRouter `Router`
    /// This is the base router from Vapor
    //    private let router: Router
    /// Now the adminRouter
    //    private let adminRouter: Router
    
    /// CMS Config
    private let config: CMSConfig
    
    
    /// Init
    public init(config: CMSConfig) {
        self.config = config
    }
    
    /// Voeg een module toe aan het CMS
    ///
    /// *Meestal in configure.php*
    ///
    /// - parameter module: Een voorgedefinieerde `CMSModule`
    mutating public func addModule(_ module: CMSModule) {
        // onthouden
        modules.append(module)
        
        
        // routes toevoegen
        //        module.addRoutes(to: router)
    }
    
    public func setup(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
        
        // load migrations
        var migrationConfig = MigrationConfig()
        
        for module in modules {
            try module.addMigrations(to: &migrationConfig)
        }
        
        services.register(migrationConfig)
        
        
        let router = CMSRouter()
        
        for module in modules {
            try module.addRoutes(to: router)
        }
        
        services.register(router, as: Router.self)
        
        // Use the CMSRouter for routing
        config.prefer(CMSRouter.self, for: Router.self)
    }
    
//    func loadModules(on container: Container) throws {
//        let router: CMSRouter = try container.make()
//        
//        modules.forEach { module in
//            try module.addRoutes(to: router)
//        }
//    }
}

