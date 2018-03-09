//
//  NSLayoutAnchor+Ext.swift
//  bricks
//
//  Created by Magic on 09/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation

extension NSLayoutAnchor {
    @objc func equalTo(_ anchor: NSLayoutAnchor, constant c: CGFloat = 0) {
        constraint(equalTo: anchor, constant: c).isActive = true
    }
}

extension NSLayoutDimension {
    @objc func equalTo(_ constant: CGFloat) {
        constraint(equalToConstant: constant).isActive = true
    }
}
