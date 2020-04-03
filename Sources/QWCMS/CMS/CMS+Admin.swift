//
//  CMS+Admin.swift
//  App
//
//  Created by Jan-Willem Oskam on 29/06/2018.
//

import Vapor
//
//public struct AdminLinks: Content {
//    let moduleLabel: String
//    let adminLinks: [AdminLink]
//}
//
//public struct AdminLink: Content {
//    let label: String
//    let uri: String
//
//    init(label: String, uri: String) {
//        self.label = label
//        self.uri = uri
//    }
//}

///
extension Application {
    
    public var adminRoutes: RoutesBuilder {
        self.grouped("admin")
    }
    
//    /// Alle modules van het cms die ook een adminmodule zijn
//    private var adminModules: [CMSAdminModule] {
//        return self.modules.filter { $0 is CMSAdminModule } as! [CMSAdminModule]
//    }
//
//
//    /// Adminlinks voor het CMS
//    ///
//    /// - Returns: Lijst met adminlinks per module
//    func getAdminLinks() -> [AdminLinks] {
//        var adminLinks = [AdminLinks]()
//
//        for module in adminModules {
//            adminLinks.append(AdminLinks(moduleLabel: module.dashboardLabel, adminLinks: module.adminLinks))
//        }
//
//        return adminLinks
//    }
}
