//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 26-09-19.
//

import Foundation

public struct PageLink: Encodable {
    let title: String
    let href: String
    
    public init(title: String, href: String) {
        self.title = title
        self.href = href
    }
    
    public init(title: String) {
        self.title = title
        self.href = ""
    }
}
