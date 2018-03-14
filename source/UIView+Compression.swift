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
    public func compressionVertical() -> Self {
        return compression(for: .vertical)
    }
    
    @discardableResult
    public func compressionHorizontal() -> Self {
        return compression(for: .horizontal)
    }
    
    @discardableResult
    public func compression(for axis: Axis = .all) -> Self {
        if axis.contains(.horizontal) {
            setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        }
        
        if axis.contains(.vertical) {
            setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        }
        return self
    }
    
    public static func compressionVertical() -> Self {
        return compression(for: .vertical)
    }
    
    public static func compressionHorizontal() -> Self {
        return compression(for: .horizontal)
    }
    
    public static func compression(for axis: Axis = .all) -> Self {
        let v = self.init()
        if axis.contains(.horizontal) {
            v.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        }
        
        if axis.contains(.vertical) {
            v.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        }
        return v
    }
}
