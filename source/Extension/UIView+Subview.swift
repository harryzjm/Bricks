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
    func constraint(formats: String, metrics: [String: Any]? = nil, _ views: UIView ...) {
        var viewArr: [String: Any] = [:]
        views.enumerated().forEach { (index, v) in
            v.translatesAutoresizingMaskIntoConstraints = false
            viewArr["v\(index + 1)"] = v
        }
        
        formats.replacingOccurrences(of: " ", with: "")
            .components(separatedBy: ",")
            .map {
                NSLayoutConstraint.constraints(withVisualFormat: $0,
                                               options: NSLayoutConstraint.FormatOptions(),
                                               metrics: metrics,
                                               views: viewArr)
            }
            .forEach { NSLayoutConstraint.activate($0) }
    }
    
    func make(space: CGFloat, axis: NSLayoutConstraint.Axis, margin: Bool = false, fill: Bool = true, views: UIView ...) {
        make(space: space, axis: axis, margin: margin, fill: fill, views: views)
    }

    func make(space: CGFloat, axis: NSLayoutConstraint.Axis, margin: Bool = false, fill: Bool = true, views: [UIView]) {

        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        if fill, let view = views.first {
            switch axis {
            case .horizontal:
                view.topAnchor.equalTo(topAnchor)
                view.bottomAnchor.equalTo(bottomAnchor)
            case .vertical:
                view.leftAnchor.equalTo(leftAnchor)
                view.rightAnchor.equalTo(rightAnchor)
            @unknown default:
                fatalError()
            }
        }

        views.between { (before, view) in
            switch axis {
            case .horizontal:
                before.topAnchor.equalTo(view.topAnchor)
                before.bottomAnchor.equalTo(view.bottomAnchor)
                before.rightAnchor.equalTo(view.leftAnchor, constant: -space)
                before.widthAnchor.equalTo(view.widthAnchor)
            case .vertical:
                before.leftAnchor.equalTo(view.leftAnchor)
                before.rightAnchor.equalTo(view.rightAnchor)
                before.bottomAnchor.equalTo(view.topAnchor, constant: -space)
                before.heightAnchor.equalTo(view.heightAnchor)
            @unknown default:
                fatalError()
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
        @unknown default:
            fatalError()
        }
    }

    func make(length: CGFloat, axis: NSLayoutConstraint.Axis, margin: Bool = false, fill: Bool = true, views: UIView ...) {
        make(length: length, axis: axis, margin: margin, fill: fill, views: views)
    }

    func make(length: CGFloat, axis: NSLayoutConstraint.Axis, margin: Bool = false, fill: Bool = true, views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)

            switch axis {
            case .horizontal:
                $0.widthAnchor.equalTo(length)
            case .vertical:
                $0.heightAnchor.equalTo(length)
            @unknown default:
                fatalError()
            }
        }

        var guides: [UILayoutGuide] = []

        let newGuide: () -> UILayoutGuide = {
            let guide = UILayoutGuide()
            self.addLayoutGuide(guide)
            guides.append(guide)
            return guide
        }

        if fill, let view = views.first {
            switch axis {
            case .horizontal:
                view.topAnchor.equalTo(topAnchor)
                view.bottomAnchor.equalTo(bottomAnchor)
            case .vertical:
                view.leftAnchor.equalTo(leftAnchor)
                view.rightAnchor.equalTo(rightAnchor)
            @unknown default:
                fatalError()
            }
        }

        views.between { (before, view) in
            newGuide().between(first: before, second: view, axis: axis)

            switch axis {
            case .horizontal:
                before.topAnchor.equalTo(view.topAnchor)
                before.bottomAnchor.equalTo(view.bottomAnchor)
            case .vertical:
                before.leftAnchor.equalTo(view.leftAnchor)
                before.rightAnchor.equalTo(view.rightAnchor)
            @unknown default:
                fatalError()
            }
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
            @unknown default:
                fatalError()
            }
        }

        guides.between { (before, guide) in
            switch axis {
            case .horizontal: before.widthAnchor.equalTo(guide.widthAnchor)
            case .vertical: before.heightAnchor.equalTo(guide.heightAnchor)
            @unknown default:
                fatalError()
            }
        }
    }
}
