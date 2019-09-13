//
//  CMSModule.swift
//  App
//
//  Created by Jan-Willem Oskam on 26/06/2018.
//

import Foundation
import Vapor
import Fluent
import Leaf

public protocol CMSModule {
    
    /// Module label
//    var moduleLabel: String { get }
    
    /// Routeprefix
    ///
    /// First `PathComponent` that can be used for all the routes in this module
    var routePrefix: String { get }
    
    /// Add migrations to the MigrationsConfig
    ///
    /// See: `Fluent > Migration > MigrationConfig`
    ///
    /// - note: This function will be called from `CMS > setup`
    /// - note: If there are no `Models` or `Migrations`, this function can be omitted
    ///
    /// - Parameter migrationConfig: The initialized but not yet registered `MigrationConfig`
    func addMigrations(to migrationConfig: inout MigrationConfig) throws
    
    /// Add routes to the CMS Router
    ///
    /// Add routes for this module to the `CMSRouter` that is initialized by the CMS
    ///
    /// - note: This function will be called from `CMS > setup`
    ///
    /// - Parameter router: QWCMS `CMSRouter`
    func addRoutes(to router: CMSRouter) throws
    
    /// Add custom Leaf Tags
    ///
    /// Add custom Leaf Tags to the `LeafTagConfig` config
    ///
    /// - note: This function will be called from `CMS > setup`
    ///
    /// - Parameter leafTagConfig: The initialized but not yet registered `LeafTagConfig`
    func addCustomLeafTag(to leafTagConfig: inout LeafTagConfig) throws
}


extension CMSModule {
    
    var routePrefix: String {
        return String(describing: self)
    }
    
    /// Predefined func, not all modules need this
    public func addMigrations(to migrationConfig: inout MigrationConfig) throws {}
    
    /// Predefined func, not all modules need this
    public func addCustomLeafTag(to leafTagConfig: inout LeafTagConfig) throws {}
}
