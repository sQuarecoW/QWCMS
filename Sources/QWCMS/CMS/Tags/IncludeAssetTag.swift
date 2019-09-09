//
//  IncludeAssetTag.swift
//  
//
//  Created by Jan-Willem Oskam on 15-07-19.
//

import Foundation
import Leaf
import Async

public final class IncludeAssetTag: TagRenderer {
    
    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        try tag.requireParameterCount(1)
        
        guard let asset = tag.parameters[0].string else {
            return Future.map(on: tag) { .null }
        }
        
        let assetManager: AssetManager = try tag.container.make()
        
        if let asset = try assetManager.include(asset: asset, on: tag.container) {
            tag.context.assets.insert(asset)
            
            return Future.map(on: tag) { .string("<!-- included \(asset.name) from \(tag.source.file.split(separator: "/").last ?? "unknown"): \(tag.source.line) -->") }
        }
        
        return Future.map(on: tag.container) { .string("<!-- asset \"\(asset)\", included from \(tag.source.file): \(tag.source.line) not available -->") }
    }
}
