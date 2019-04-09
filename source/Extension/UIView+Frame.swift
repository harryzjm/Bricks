//
//  UIView+Frame.swift
//  bricks
//
//  Created by Magic on 20/04/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    var frameOrigin: CGPoint {
        set { frame.origin = newValue }
        get { return frame.origin }
    }
    
    var frameSize: CGSize {
        set { frame.size = newValue }
        get { return frame.size }
    }
    
    var frameX: CGFloat {
        set { frame.origin.x = newValue }
        get { return frame.minX }
    }
    
    var frameY: CGFloat {
        set { frame.origin.y = newValue }
        get { return frame.minY }
    }
    
    var centerX: CGFloat {
        set { center.x = newValue }
        get { return center.x }
    }
    
    var centerY: CGFloat {
        set { center.y = newValue }
        get { return center.y }
    }
    
    var frameRight: CGFloat {
        set { frame.origin.x = newValue - frame.width }
        get { return frame.maxX }
    }
    
    var frameBottom: CGFloat {
        set { frame.origin.y = newValue - frame.height }
        get { return frame.maxY }
    }
    
    var frameWidth: CGFloat {
        set { frame.size.width = newValue }
        get { return frame.width }
    }
    
    var frameHeight: CGFloat {
        set { frame.size.height = newValue }
        get { return frame.height }
    }
    
    func centerVertically() {
        guard let superV = superview else { return }
        centerY = superV.frameHeight / 2
    }
    
    func centerHorizontally() {
        guard let superV = superview else { return }
        centerY = superV.frameWidth / 2
    }
}
