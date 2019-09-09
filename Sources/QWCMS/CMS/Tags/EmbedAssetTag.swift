//
//  EmbedAsset.swift
//  
//
//  Created by Jan-Willem Oskam on 16-07-19.
//

import Foundation
import Leaf
import Async

public final class EmbedAssetTag: TagRenderer {
    
    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        try tag.requireParameterCount(1)
        
        guard let typeString = tag.parameters[0].string, let type = Asset.AssetType.init(rawValue: typeString) else {
            return Future.map(on: tag) { .null }
        }
        
        let string = tag.context.assets
            .filter { $0.type == type}
            .compactMap { $0.embedString }
            .joined(separator: "\n")
        
        return Future.map(on: tag) { .string(string) }
    }
}
