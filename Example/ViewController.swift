//
//  ViewController.swift
//  Example
//
//  Created by Tatsuya Tanaka on 20180723.
//  Copyright © 2018年 tattn. All rights reserved.
//

import UIKit
import PullableSheet

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let content = UIViewController()
        content.view.backgroundColor = .clear

        let label = UILabel()
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        content.view.addSubview(label)
        label.sizeToFit()
        label.center.x = content.view.center.x
        label.frame.origin.y = 30
        label.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]

        PullableSheet(content: content).add(to: self)
    }
}

