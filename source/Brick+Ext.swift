//
//  Brick+Ext.swift
//  bricks
//
//  Created by Magic on 09/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import Foundation

extension UIView {
    @discardableResult
    public func right(length: CGFloat = 0) -> UIView {
        return right(view: superview, length: length)
    }
    @discardableResult
    public func left(length: CGFloat = 0) -> UIView {
        return left(view: superview, length: length)
    }
    @discardableResult
    public func top(length: CGFloat = 0) -> UIView {
        return top(view: superview, length: length)
    }
    @discardableResult
    public func bottom(length: CGFloat = 0) -> UIView {
        return bottom(view: superview, length: length)
    }
    @discardableResult
    public func centerX(offset: CGFloat = 0) -> UIView {
        return centerX(view: superview, offset: offset)
    }
    @discardableResult
    public func centerY(offset: CGFloat = 0) -> UIView {
        return centerY(view: superview, offset: offset)
    }
    @discardableResult
    public func center(offset: CGFloat = 0) -> UIView {
        return center(view: superview, offset: offset)
    }
}

extension Brick {
    @discardableResult
    public func right<T: Brick>(view: T?, length: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        rightAnchor.equalTo(view.leftAnchor, constant: -length)
        return self
    }
    
    @discardableResult
    public func left<T: Brick>(view: T?, length: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.equalTo(view.rightAnchor, constant: length)
        return self
    }
    
    @discardableResult
    public func top<T: Brick>(view: T?, length: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.equalTo(view.bottomAnchor, constant: length)
        return self
    }
    
    @discardableResult
    public func bottom<T: Brick>(view: T?, length: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.equalTo(view.topAnchor, constant: -length)
        return self
    }
    
    @discardableResult
    public func centerX<T: Brick>(view: T?, offset: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.equalTo(view.centerXAnchor, constant: offset)
        return self
    }
    
    @discardableResult
    public func centerY<T: Brick>(view: T?, offset: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.equalTo(view.centerYAnchor, constant: offset)
        return self
    }
    
    @discardableResult
    public func center<T: Brick>(view: T?, offset: CGFloat = 0) -> Self {
        guard let view = view else { return self }
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.equalTo(view.centerYAnchor, constant: offset)
        centerXAnchor.equalTo(view.centerXAnchor, constant: offset)
        return self
    }
    
    @discardableResult
    public func width(_ length: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.equalTo(length)
        return self
    }
    
    @discardableResult
    public func height(_ length: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.equalTo(length)
        return self
    }
    
    public func between<T: Brick>(first: T?, second: T?, axis: UILayoutConstraintAxis, offset: CGFloat = 0) {
        guard let first = first, let second = second else { return }
        first.translatesAutoresizingMaskIntoConstraints = false
        second.translatesAutoresizingMaskIntoConstraints = false

        if first.isDescendant(of: second) {
            switch axis {
            case .horizontal:
                first.rightAnchor.equalTo(leftAnchor, constant: -offset)
                second.rightAnchor.equalTo(rightAnchor, constant: offset)
            case .vertical:
                first.bottomAnchor.equalTo(topAnchor, constant: -offset)
                second.bottomAnchor.equalTo(bottomAnchor, constant: offset)
            }
        } else if second.isDescendant(of: first) {
            switch axis {
            case .horizontal:
                first.leftAnchor.equalTo(leftAnchor, constant: -offset)
                second.leftAnchor.equalTo(rightAnchor, constant: offset)
            case .vertical:
                first.topAnchor.equalTo(topAnchor, constant: -offset)
                second.topAnchor.equalTo(bottomAnchor, constant: offset)
            }
        } else {
            switch axis {
            case .horizontal:
                first.rightAnchor.equalTo(leftAnchor, constant: -offset)
                second.leftAnchor.equalTo(rightAnchor, constant: offset)
            case .vertical:
                first.bottomAnchor.equalTo(topAnchor, constant: -offset)
                second.topAnchor.equalTo(bottomAnchor, constant: offset)
            }
        }
    }
}
