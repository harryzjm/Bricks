//
//  UIView+Edge.swift
//  bricks
//
//  Created by Magic on 12/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    public func edges(horizontal: CGFloat? = nil, vertical: CGFloat? = nil) {
        guard let superV = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        superV.translatesAutoresizingMaskIntoConstraints = false

        if let horizontal = horizontal {
            leftAnchor.equalTo(superV.leftAnchor, constant: horizontal)
            rightAnchor.equalTo(superV.rightAnchor, constant: -horizontal)
        }
        if let vertical = vertical {
            topAnchor.equalTo(superV.topAnchor, constant: vertical)
            bottomAnchor.equalTo(superV.bottomAnchor, constant: -vertical)
        }
    }

    public func edges(value: CGFloat) {
        edges(horizontal: value, vertical: value)
    }
}
