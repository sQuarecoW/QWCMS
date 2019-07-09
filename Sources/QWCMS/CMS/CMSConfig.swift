//
//  CMSConfig.swift
//  App
//
//  Created by Jan-Willem Oskam on 25-06-19.
//

import Vapor

public struct CMSConfig {
    
    let siteRoutesPrefix: String
    let adminRoutesPrefix: String
    
    public init(siteRoutesPrefix: String? = nil, adminRoutesPrefix: String? = nil) {
        self.siteRoutesPrefix = siteRoutesPrefix ?? ""
        self.adminRoutesPrefix = adminRoutesPrefix ?? "admin"
    }
}

