////
////  File.swift
////  
////
////  Created by Jan-Willem Oskam on 23-09-19.
////
//
//import Vapor
//
//extension ViewRenderer {
//    
//    public func render(_ path: String, on req: Request) throws -> EventLoopFuture<View> {
//        return try render(path, Dictionary<String, String>(), on: req)
//    }
//    
//    public func render<E>(_ path: String, _ context: E, on req: Request) throws -> EventLoopFuture<View> where E: Encodable {
//        let currentRequest: CurrentRequest = try req.privateContainer.make()
//        
//        return render(path, context, userInfo: currentRequest.userInfo)
//    }
//}
