//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 19-07-19.
//

import Vapor

public class CurrentRequest: Service {
    
    var language: String = ""
    var host: String = ""
    
    public init() {}
    
    var userInfo: [AnyHashable: Any] {
        let mirror = Mirror(reflecting: self)
        var userInfo: [AnyHashable: Any] = [:]
        
        for (k, v) in mirror.children {
            if let key = k {
                userInfo[key] = v
            }
        }
        
        return userInfo
    }
}
