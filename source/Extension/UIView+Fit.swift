//
//  UIView+Fit.swift
//  bricks
//
//  Created by Magic on 22/05/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    func fit(top: UIView? = nil, left: UIView? = nil, bottom: UIView? = nil, right: UIView? = nil) {
        guard let superV = superview else { return }
        [superV, self, top, left, bottom, right].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        topAnchor.equalTo(top?.bottomAnchor ?? superV.topAnchor)
        leftAnchor.equalTo(left?.rightAnchor ?? superV.leftAnchor)
        bottomAnchor.equalTo(bottom?.topAnchor ?? superV.bottomAnchor)
        rightAnchor.equalTo(right?.leftAnchor ?? superV.rightAnchor)
    }
}
