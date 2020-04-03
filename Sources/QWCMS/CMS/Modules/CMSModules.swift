//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 31-03-20.
//

import Foundation

public final class CMSModules {
    
    var storage: [CMSModule]
    
    public init() {
        self.storage = []
    }
    
    public func add(_ module: CMSModule) {
        self.storage.append(module)
    }
}
