//
//  BSBreadcrumbsTag.swift
//
//
//  Created by Jan-Willem Oskam on 24-09-19.
//

import Foundation
import Leaf
import Async

///
public final class BSBreadcrumbsTag: TagRenderer {
    
    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        
        try tag.requireParameterCount(1)
        
        guard let breadcrumbs = tag.parameters[0].array else {
            return Future.map(on: tag) { return .string("") }
        }
        
        var html =
            """
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
            """
        
        for item in breadcrumbs {
            if let breadcrumb = item.dictionary, let title = breadcrumb["title"]?.string, let href = breadcrumb["href"]?.string {
                if !href.isEmpty {
                    html +=
                        "<li class=\"breadcrumb-item\"><a href=\"/\(href)\">\(title)</a></li>"
                }
                else {
                    html +=
                        "<li class=\"breadcrumb-item active\" aria-current=\"page\">\(title)</li>"
                }
            }
        }
        
        html +=
            """
                </ol>
            </nav>
            """
        
        return Future.map(on: tag) { return .string(html) }
    }
}
