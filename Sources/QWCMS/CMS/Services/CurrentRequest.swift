//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 19-07-19.
//

import Vapor

public struct CurrentRequest: Service {
    
    var language: [String] = []
    
    public init() {}
}
