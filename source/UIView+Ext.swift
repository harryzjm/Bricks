//
//  UIView.swift
//  bricks
//
//  Created by Magic on 09/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    public func edges(superView: UIView? = nil, horizontal: CGFloat? = nil, vertical: CGFloat? = nil) {
        guard let superV = superView ?? superview else { return }
        superView?.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        superV.translatesAutoresizingMaskIntoConstraints = false
        
        if let horizontal = horizontal {
            leftAnchor.equalTo(superV.leftAnchor, constant: horizontal)
            rightAnchor.equalTo(superV.rightAnchor, constant: -horizontal)
        }
        if let vertical = vertical {
            topAnchor.equalTo(superV.topAnchor, constant: vertical)
            bottomAnchor.equalTo(superV.bottomAnchor, constant: -vertical)
        }
    }
    
    public func edges(superView: UIView? = nil, value: CGFloat) {
        edges(superView: superView, horizontal: value, vertical: value)
    }
    
    public func make(space: CGFloat, axis: UILayoutConstraintAxis, margin: Bool = false, views: UIView ...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            
            switch axis {
            case .horizontal:
                $0.topAnchor.equalTo(topAnchor)
                $0.bottomAnchor.equalTo(bottomAnchor)
            case .vertical:
                $0.leftAnchor.equalTo(leftAnchor)
                $0.rightAnchor.equalTo(rightAnchor)
            }
        }
        
        views.between { (before, view) in
            switch axis {
            case .horizontal:
                before.rightAnchor.equalTo(view.leftAnchor, constant: -space)
                before.widthAnchor.equalTo(view.widthAnchor)
            case .vertical:
                before.bottomAnchor.equalTo(view.topAnchor, constant: -space)
                before.heightAnchor.equalTo(view.heightAnchor)
            }
        }
        
        let value = margin ? space:0
        switch axis {
        case .horizontal:
            views.first?.leftAnchor.equalTo(leftAnchor, constant: value)
            views.last?.rightAnchor.equalTo(rightAnchor, constant: -value)
        case .vertical:
            views.first?.topAnchor.equalTo(topAnchor, constant: value)
            views.last?.bottomAnchor.equalTo(bottomAnchor, constant: -value)
        }
    }
    
    public func make(length: CGFloat, axis: UILayoutConstraintAxis, margin: Bool = false, views: UIView ...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            
            switch axis {
            case .horizontal:
                $0.widthAnchor.equalTo(length)
                $0.topAnchor.equalTo(topAnchor)
                $0.bottomAnchor.equalTo(bottomAnchor)
            case .vertical:
                $0.heightAnchor.equalTo(length)
                $0.leftAnchor.equalTo(leftAnchor)
                $0.rightAnchor.equalTo(rightAnchor)
            }
        }
        
        var guides: [UILayoutGuide] = []
        
        let newGuide: () -> UILayoutGuide = {
            let guide = UILayoutGuide()
            self.addLayoutGuide(guide)
            guides.append(guide)
            return guide
        }
        
        views.between { (before, view) in
            newGuide().between(first: before, second: view, axis: axis)
        }
        
        if margin {
            newGuide().between(first: self, second: views.first, axis: axis)
            newGuide().between(first: views.last, second: self, axis: axis)
        } else {
            switch axis {
            case .horizontal:
                views.first?.leftAnchor.equalTo(leftAnchor)
                views.last?.rightAnchor.equalTo(rightAnchor)
            case .vertical:
                views.first?.topAnchor.equalTo(topAnchor)
                views.last?.bottomAnchor.equalTo(bottomAnchor)
            }
        }
        
        guides.between { (before, guide) in
            switch axis {
            case .horizontal: before.widthAnchor.equalTo(guide.widthAnchor)
            case .vertical: before.heightAnchor.equalTo(guide.heightAnchor)
            }
        }
    }
}
