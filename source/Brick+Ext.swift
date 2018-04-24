//
//  Brick+Ext.swift
//  bricks
//
//  Created by Magic on 09/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation

extension Brick {
    public func between<T: Brick>(first: T?, second: T?, axis: UILayoutConstraintAxis, offset: CGFloat = 0) {
        guard let first = first, let second = second else { return }
        first.translatesAutoresizingMaskIntoConstraints = false
        second.translatesAutoresizingMaskIntoConstraints = false

        if first.isDescendant(of: second) {
            switch axis {
            case .horizontal:
                first.rightAnchor.equalTo(leftAnchor, constant: -offset)
                second.rightAnchor.equalTo(rightAnchor, constant: offset)
            case .vertical:
                first.bottomAnchor.equalTo(topAnchor, constant: -offset)
                second.bottomAnchor.equalTo(bottomAnchor, constant: offset)
            }
        } else if second.isDescendant(of: first) {
            switch axis {
            case .horizontal:
                first.leftAnchor.equalTo(leftAnchor, constant: -offset)
                second.leftAnchor.equalTo(rightAnchor, constant: offset)
            case .vertical:
                first.topAnchor.equalTo(topAnchor, constant: -offset)
                second.topAnchor.equalTo(bottomAnchor, constant: offset)
            }
        } else {
            switch axis {
            case .horizontal:
                first.rightAnchor.equalTo(leftAnchor, constant: -offset)
                second.leftAnchor.equalTo(rightAnchor, constant: offset)
            case .vertical:
                first.bottomAnchor.equalTo(topAnchor, constant: -offset)
                second.topAnchor.equalTo(bottomAnchor, constant: offset)
            }
        }
    }
}
