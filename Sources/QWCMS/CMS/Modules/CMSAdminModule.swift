//
//  Protocol.swift
//  App
//
//  Created by Jan-Willem Oskam on 28/06/2018.
//

import Foundation
import Vapor

/// Extra dingen voor als een module ook via het admin gedeelte beheerd kan worden
public protocol CMSAdminModule {
    
    /// Dashboard label
    ///
    ///
    var dashboardLabel: String { get }
    
    /// Admin links
    ///
    /// Links voor in het admin-dashboard
    var adminLinks: [AdminLink] { get }
}




/// AdminViewContext
/// Met extra items in de viewcontext
