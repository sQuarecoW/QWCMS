//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 23-09-19.
//

import Vapor

extension ViewRenderer {
    
    public func render<E>(_ path: String, _ context: E, on req: Request) throws -> Future<View> where E: Encodable {
        let currentRequest: CurrentRequest = try req.privateContainer.make()
        
        dump(currentRequest)
        
        return render(path, context, userInfo: currentRequest.userInfo)
    }
}
