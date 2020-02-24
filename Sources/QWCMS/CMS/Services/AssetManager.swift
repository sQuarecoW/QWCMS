//
//  AssetManager.swift.swift
//  
//
//  Created by Jan-Willem Oskam on 15-07-19.
//

import Vapor

final class AssetManager: Service {
    
    var available: [Asset]
    
    public init() {
        available = []
    }
    
    public func reload(on container: Container) throws {
        let directoryConfig: DirectoryConfig = try container.make()
        
        let fileManager = FileManager.default
        
        if let assetsData = fileManager.contents(atPath: URL(fileURLWithPath: directoryConfig.workDir).appendingPathComponent("Public/assets/manifest.json").path) {

            do {
                available = try JSONDecoder().decode([Asset].self, from: assetsData)
            } catch let error {
                print(error)
            }
        }
    }
    
    public func include(asset withName: String, on container: Container) throws -> Asset? {
        // not in production mode?
        // then we reload all assets
        if container.environment != .production {
            try reload(on: container)
        }
        
        guard let asset = available.first(where: { $0.name == withName }) else {
            return nil
        }
        
        return asset
    }
}

struct Asset: Codable, Hashable {
    let name: String
    let path: String
    
    let type: AssetType
    
    enum CodingKeys: String, CodingKey {
        case name
        case path
        case type = "ext"
    }
    
    enum AssetType: String, Codable {
        case css
        case js
    }
    
    var embedString: String {
        switch type {
        case .js:
            return "<script type=\"text/javascript\" src=\"/\(path)\"></script>"
        case .css:
            return "<link rel=\"stylesheet\" href=\"/\(path)\" />"
        }
    }
}

extension TemplateDataContext {
    
    var assets: Set<Asset> {
        get {
            return userInfo["assets"] as? Set<Asset> ?? []
        }
        set {
            self.userInfo["assets"] = newValue
        }
    }
    
}
