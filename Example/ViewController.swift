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

        let content = TableVC()//UIViewController()
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

class TableVC: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        (parent as? PullableSheet)?.scrollViewDidScroll(scrollView)
    }
}

