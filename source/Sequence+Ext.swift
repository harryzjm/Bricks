//
//  Sequence+Ext.swift
//  bricks
//
//  Created by Magic on 09/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation

extension Sequence {
    typealias T = Self.Iterator.Element

    func between(block: (T, T) -> Void ) {
        var beforeElement: T? = nil
        var generator = makeIterator()
        while let nextItem = generator.next() {
            defer { beforeElement = nextItem }
            guard let before = beforeElement else { continue }
            block(before, nextItem)
        }
    }
}
