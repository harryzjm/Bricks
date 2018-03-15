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
    public func huggingVertical() -> Self {
        return hugging(for: .vertical)
    }
    
    @discardableResult
    public func huggingHorizontal() -> Self {
        return hugging(for: .horizontal)
    }
    
    @discardableResult
    public func hugging(for axis: Axis = .all) -> Self {
        if axis.contains(.horizontal) {
            setContentHuggingPriority(.required, for: .horizontal)
        }
        
        if axis.contains(.vertical) {
            setContentHuggingPriority(.required, for: .vertical)
        }
        return self
    }
    
    public static func huggingVertical() -> Self {
        return hugging(for: .vertical)
    }
    
    public static func huggingHorizontal() -> Self {
        return hugging(for: .horizontal)
    }
    
    public static func hugging(for axis: Axis = .all) -> Self {
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
