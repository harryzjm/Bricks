//
//  UIView+Position.swift
//  bricks
//
//  Created by Magic on 14/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    public var frameOrigin: CGPoint {
        set { frame.origin = newValue }
        get { return frame.origin }
    }

    public var frameSize: CGSize {
        set { frame.size = newValue }
        get { return frame.size }
    }

    public var frameX: CGFloat {
        set { frame.origin.x = newValue }
        get { return frame.minX }
    }

    public var frameY: CGFloat {
        set { frame.origin.y = newValue }
        get { return frame.minY }
    }

    public var centerX: CGFloat {
        set { center.x = newValue }
        get { return center.x }
    }

    public var centerY: CGFloat {
        set { center.y = newValue }
        get { return center.y }
    }

    public var frameRight: CGFloat {
        set { frame.origin.x = newValue - frame.width }
        get { return frame.maxX }
    }

    public var frameBottom: CGFloat {
        set { frame.origin.y = newValue - frame.height }
        get { return frame.maxY }
    }

    public var frameWidth: CGFloat {
        set { frame.size.width = newValue }
        get { return frame.width }
    }

    public var frameHeight: CGFloat {
        set { frame.size.height = newValue }
        get { return frame.height }
    }

    public func centerVertically() {
        guard let superV = superview else { return }
        centerY = superV.frameHeight / 2
    }

    public func centerHorizontally() {
        guard let superV = superview else { return }
        centerY = superV.frameWidth / 2
    }
}
