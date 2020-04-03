//
//  CMSPRovider.swift
//

import Vapor

///
extension Application {
    
    public var cmsModules: CMSModules {
        self.cms.storage.modules
    }
    
    public struct CMS {
        final class Storage {
            let modules: CMSModules
            
            init() {
                self.modules = .init()
            }
        }
        
        struct Key: StorageKey {
            typealias Value = Storage
        }
        
        let application: Application
        
        var storage: Storage {
            if self.application.storage[Key.self] == nil {
                self.initialize()
            }
            return self.application.storage[Key.self]!
        }
        
        func initialize() {
            self.application.storage[Key.self] = .init()
        }
    }
    
    public var cms: CMS {
        // make a CMS instance
        .init(application: self)
        
        // register the adminModule
//        cmsModules.add(AdminModule(application: self))
    }
}
    
//    public init() {}
//    
//    public func register(_ services: inout Services) throws {
//        // registeer alles wat we nodig hebben
//        try services.register(LeafProvider())
//        try services.register(FluentPostgreSQLProvider())
//        
//        services.register(Sessions.self) { container -> KeyedCacheSessions in
//            let keyedCache = try container.keyedCache(for: .redis)
//            return KeyedCacheSessions(keyedCache: keyedCache)
//        }
//        
//        // assetmanager
//        services.register(AssetManager())
//        // current request values
//        services.register(CurrentRequest())
//        services.register(CurrentRequestMiddleware())
//         
//        // all our middlewares
//        var middlewares = MiddlewareConfig() // Create _empty_ middleware config
//        // Vapor middlewares
//        middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
//        middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
//        middlewares.use(SessionsMiddleware.self) // Makes sessions available
//        
//        // our custom middleware
//        middlewares.use(CurrentRequestMiddleware.self)
//        
//        // register them
//        services.register(middlewares)
        
//        /// Create default content config
//        var contentConfig = ContentConfig.default()
//
//        /// Create custom JSON encoder
//        let jsonEncoder = JSONEncoder()
//        jsonEncoder.dateEncodingStrategy = .millisecondsSince1970
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.dateDecodingStrategy = .millisecondsSince1970
//
//        /// Register JSON encoder and content config
//        contentConfig.use(encoder: jsonEncoder, for: .json)
//        contentConfig.use(decoder: jsonDecoder, for: .json)
//        services.register(contentConfig)
//    }
//
//    public func willBoot(_ container: Container) throws -> EventLoopEventLoopFuture<Void> {
//
//        // load all the assets from the manifest
//        let assetManager: AssetManager = try container.make()
//        try assetManager.reload(on: container)
//
//        // we're done
//        return .done(on: container)
//    }
//
//    public func didBoot(_ container: Container) throws -> EventLoopEventLoopFuture<Void> {
//
//        // we're done
//        return .done(on: container)
//    }
//
