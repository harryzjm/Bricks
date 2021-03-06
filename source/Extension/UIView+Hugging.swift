//
//  UIView+Hugging.swift
//  bricks
//
//  Created by Magic on 15/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    @discardableResult
    func huggingVertical() -> Self {
        return hugging(for: .vertical)
    }

    @discardableResult
    func huggingHorizontal() -> Self {
        return hugging(for: .horizontal)
    }

    @discardableResult
    func hugging(for axis: Axis = .all) -> Self {
        if axis.contains(.horizontal) {
            setContentHuggingPriority(.required, for: .horizontal)
        }

        if axis.contains(.vertical) {
            setContentHuggingPriority(.required, for: .vertical)
        }
        return self
    }
    
    func setHugging(_ priority: Float, for axis: Axis) {
        let value = UILayoutPriority(priority)
        
        if axis.contains(.horizontal) {
            setContentHuggingPriority(value, for: .horizontal)
        }
        
        if axis.contains(.vertical) {
            setContentHuggingPriority(value, for: .vertical)
        }
    }

    static func huggingVertical() -> Self {
        return hugging(for: .vertical)
    }

    static func huggingHorizontal() -> Self {
        return hugging(for: .horizontal)
    }

    static func hugging(for axis: Axis = .all) -> Self {
        let v = self.init()
        if axis.contains(.horizontal) {
            v.setContentHuggingPriority(.required, for: .horizontal)
        }

        if axis.contains(.vertical) {
            v.setContentHuggingPriority(.required, for: .vertical)
        }
        return v
    }
}
