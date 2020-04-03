////
////  CMS.swift
////
////  Created by Jan-Willem Oskam on 26/06/2018.
////
//
//import Vapor
//import Leaf
//
///// sQuarecoW Content Management System
/////
/////
//public struct CMS {
//
//    /// List of modules in the CMS
//    ///
//    public var modules: CMSModules
//
//    /// CMS Config
//    private let config: CMSConfig
//
//    /// Init
//    public init(config: CMSConfig) {
//        self.config = config
//
//        // add base modules
//        addModule(AdminModule())
//    }
//
//    /// Add a module to the CMS
//    ///
//    /// Do this after initializing the CMS, but before registering it as a service
//    ///
//    /// - parameter module: A initialized `CMSModule`
//    mutating public func addModule(_ module: CMSModule) {
//        // save the module in our list
//        modules.append(module)
//    }
//
//    /// Setup the CMS
//    ///
//    /// This method will do a couple of things:
//    /// - Make the `MigrationConfig`
//    ///     - let all registered modules add migrations and models to it
//    ///     - register the MigrationConfig with Vapor
//    /// - Make a CMSRouter
//    ///     - let all registered modules add routes to it
//    ///     - register the CMSRouter with Vapor
//    ///     - tell Vapor to use the CSMRouter as default Router
//    ///
//    /// - Parameter config: Vapor Config
//    /// - Parameter env: Environment
//    /// - Parameter services: Vapor Services
//    public func setup(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
//
//        // load migrations
//        var migrationConfig = MigrationConfig()
//
//        for module in modules {
//            try module.addMigrations(to: &migrationConfig)
//        }
//
//        services.register(migrationConfig)
//
//        // setup the CMSRouter
//        let router = CMSRouter(adminRoutePrefix: self.config.adminRoutesPrefix)
//
//        for module in modules {
//            try module.addRoutes(to: router)
//        }
//
//        services.register(router, as: Router.self)
//
//        // Use the CMSRouter for routing
//        config.prefer(CMSRouter.self, for: Router.self)
//
//        // register custom tags
//        var leafTagConfig = LeafTagConfig.default()
//
//        // these are baked in:
//        leafTagConfig.use(EmbedAssetTag(), as: "embedAsset")
//        leafTagConfig.use(IncludeAssetTag(), as: "includeAsset")
//        leafTagConfig.use(UserInfoTag(), as: "userInfo")
//        leafTagConfig.use(DatePickerTag(), as: "datePicker")
//        leafTagConfig.use(HTMLTableTag(), as: "parseHTMLTable")
//        leafTagConfig.use(Nl2brTag(), as: "nl2br")
//        // bootstrap
//        leafTagConfig.use(BSModalTag(), as: "bsModal")
//        leafTagConfig.use(BSBreadcrumbsTag(), as: "bsBreadcrumbs")
//
//        // now lets see if any modules have tags
//        for module in modules {
//            try module.addCustomLeafTag(to: &leafTagConfig)
//        }
//
//        services.register(leafTagConfig)
//    }
//}
//
