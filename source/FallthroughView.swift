//
//  FallthroughView.swift
//  bricks
//
//  Created by Magic on 11/04/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

//Only respond child view
open class FallthroughView: UIView {
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return subviews.map { [unowned self](v) -> Bool in
            let new = v.convert(point, from: self)
            return v.point(inside: new, with: event)
            }.reduce(false) { $0 || $1 }
    }
}
