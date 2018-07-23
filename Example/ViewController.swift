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

        PullableSheet().add(to: self)
    }
}

