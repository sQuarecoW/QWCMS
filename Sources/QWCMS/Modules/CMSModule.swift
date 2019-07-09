//
//  CMSModule.swift
//  App
//
//  Created by Jan-Willem Oskam on 26/06/2018.
//

import Foundation
import Vapor
import Fluent

public protocol CMSModule {
    
    /// Module label
//    var moduleLabel: String { get }
    
    /// Route prefix
    ///
    /// Eerste `PathComponent` wat gebruikt wordt voor alle routes en alle links binnen een module
    /// - note: Dit kan overschreven worden als de module wordt ge-init
    var routePrefix: String { get }
    
    
    func load(with router: CMSRouter)
    
    
    
    /// Routes toevoegen aan de router
    ///
    /// Deze functie wordt vanuit het CMS aangeroepen
    ///
    /// Het CMS geeft de `Router` op, het is aan de module om routes voor die module toe te voegen
    /// - Parameter router: QWCMS `CMSRouter`
    func addRoutes(to router: CMSRouter) throws
    
    func addMigrations(to migrationConfig: inout MigrationConfig) throws
}


extension CMSModule {
    
    var routePrefix: String {
        return String(describing: self)
    }
    
    func addMigrations(to migrationConfig: inout MigrationConfig) throws {}
}
