//
//  File.swift
//  
//
//  Created by Jan-Willem Oskam on 11-10-19.
//

import Foundation

extension Array {
    
    /// Split an array in chunks of `size` items
    /// - Parameter size: What size the chunks should be
    ///
    /// - Author:
    /// [How to split an array into chunks](https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks)
    public func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
