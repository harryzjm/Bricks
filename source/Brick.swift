//
//  Brick.swift
//  bricks
//
//  Created by Magic on 09/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation

public protocol Brick: class {
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var translatesAutoresizingMaskIntoConstraints: Bool { get set }
    func isDescendant(of view: Self) -> Bool
}

extension UIView: Brick {}
extension UILayoutGuide: Brick {
    public var translatesAutoresizingMaskIntoConstraints: Bool {
        get { return false }
        set {}
    }

    public func isDescendant(of view: UILayoutGuide) -> Bool { return false }
}
