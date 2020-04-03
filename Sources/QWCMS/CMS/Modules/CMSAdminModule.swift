//
//  Protocol.swift
//  App
//
//  Created by Jan-Willem Oskam on 28/06/2018.
//

import Foundation
import Vapor

/// Extra dingen voor als een module ook via het admin gedeelte beheerd kan worden
public protocol CMSAdminModule: CMSModule {
    
//    /// Dashboard label
//    ///
//    ///
//    var dashboardLabel: String { get }
//    
//    /// Admin links
//    ///
//    /// Links voor in het admin-dashboard
//    var adminLinks: [AdminLink] { get }
//    
//    /// Generate breadcrumbs for the current view
//    func getBreadcrumbs(adding items: [PageLink]) -> [PageLink]
//    
//    ///
//    func getBreadcrumbs(adding item: PageLink) -> [PageLink]
}

//extension CMSAdminModule {
//    
//    public func getBreadcrumbs(adding items: [PageLink]) -> [PageLink] {
//        var breadcrumbs: [PageLink] = []
//        breadcrumbs.append(PageLink(title: "Dashboard", href: "admin"))
//        breadcrumbs.append(PageLink(title: self.dashboardLabel, href: "admin/\(self.routePrefix)"))
//        
//        breadcrumbs.append(contentsOf: items)
//        
//        return breadcrumbs
//    }
//    
//    public func getBreadcrumbs(adding item: PageLink) -> [PageLink] {
//        return getBreadcrumbs(adding: [item])
//    }
//}


/// AdminViewContext
/// Met extra items in de viewcontext
