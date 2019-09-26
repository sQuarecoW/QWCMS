//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 24-09-19.
//

import Foundation
import Leaf
import Async

///
/// bsModal(title, footer, modalID)
/// - if the footer is empty there will be no footer shown
public final class BSModalTag: TagRenderer {
    
    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        
        var modalID = ""
        var title = ""
        var footer: String? = nil
        
        // get all our parameters
        for (i, p) in tag.parameters.enumerated() {
            if let parameter = p.string {
                switch i {
                case 0:
                    modalID = parameter
                case 1:
                    title = parameter
                case 2:
                    footer = parameter == "" ? nil : parameter
                default:
                    break
                }
            }
        }
        
        // get our body
        let body = try tag.requireBody()
                
        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { body in
            let bodyData = String(data: body.data, encoding: .utf8) ?? ""
            
            let html =
                """
                <div class="modal fade" id="\(modalID)" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">\(title)</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                      <div class="modal-body">
                        \(bodyData)
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                      </div>
                    </div>
                  </div>
                </div>
                """

            return .string(html)
        }
    }
}
