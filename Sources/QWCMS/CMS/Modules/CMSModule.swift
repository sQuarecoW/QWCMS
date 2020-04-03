//
//  CMSModule.swift
//  App
//
//  Created by Jan-Willem Oskam on 26/06/2018.
//

import Foundation
import Vapor

public protocol CMSModule {
    
    /// Application
    var application: Application { get }
    
    /// Routeprefix
    ///
    /// First `PathComponent` that can be used for all the routes in this module
    var routePrefix: String { get }

}


extension CMSModule {
    
    var routePrefix: String {
        return String(describing: self)
    }
}
