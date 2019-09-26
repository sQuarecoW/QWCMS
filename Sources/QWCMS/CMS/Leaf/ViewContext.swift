//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 15-07-19.
//

import Vapor

public protocol ViewContext: Encodable {
    
    var title: String { get }
}

public protocol AdminViewContext: ViewContext {
    
    var breadcrumbs: [PageLink] { get }
}
