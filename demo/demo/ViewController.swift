//
//  ViewController.swift
//  demo
//
//  Created by Magic on 09/03/2018.
//  Copyright © 2018 Magic. All rights reserved.
//

import UIKit
import bricks

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let container1 = UIView()
        let container2 = UIView()
        let container3 = UIView()
        let container4 = UIView()
        
        container1.compression(for: .all)
        
        view.make(space: 0, axis: .vertical, margin: true, views: container1, container2, container3, container4)
        
        container1.make(length: 20, axis: .horizontal, margin: true, views: newView(), newView(), newView(), newView())
        container2.make(length: 60, axis: .horizontal, views: newView(), newView(), newView(), newView())
        container3.make(space: 5, axis: .horizontal, views: newView(), newView(), newView(), newView())
        newView().edges(superView: container4, horizontal: 100, vertical: 5)
    }
    
    func newView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(hue: CGFloat(arc4random_uniform(255)) / 255, saturation: 1, brightness: 1, alpha: 1)
        return view
    }
}

