//
//  UIView+Compression.swift
//  bricks
//
//  Created by Magic on 12/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

public struct Axis: OptionSet {
    public let rawValue: Int
    public static let horizontal = Axis(rawValue: 1 << 0)
    public static let vertical = Axis(rawValue: 1 << 1)
    public static let all: Axis = [.horizontal, .vertical]

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public extension UIView {
    @discardableResult
    func compressionVertical() -> Self {
        return compression(for: .vertical)
    }

    @discardableResult
    func compressionHorizontal() -> Self {
        return compression(for: .horizontal)
    }

    @discardableResult
    func compression(for axis: Axis = .all) -> Self {
        if axis.contains(.horizontal) {
            setContentCompressionResistancePriority(.required, for: .horizontal)
        }

        if axis.contains(.vertical) {
            setContentCompressionResistancePriority(.required, for: .vertical)
        }
        return self
    }
    
    func setCompression(_ priority: Float, for axis: Axis) {
        let value = UILayoutPriority(priority)
        
        if axis.contains(.horizontal) {
            setContentCompressionResistancePriority(value, for: .horizontal)
        }
        
        if axis.contains(.vertical) {
            setContentCompressionResistancePriority(value, for: .vertical)
        }
    }

    static func compressionVertical() -> Self {
        return compression(for: .vertical)
    }

    static func compressionHorizontal() -> Self {
        return compression(for: .horizontal)
    }

    static func compression(for axis: Axis = .all) -> Self {
        let v = self.init()
        if axis.contains(.horizontal) {
            v.setContentCompressionResistancePriority(.required, for: .horizontal)
        }

        if axis.contains(.vertical) {
            v.setContentCompressionResistancePriority(.required, for: .vertical)
        }
        return v
    }
}
