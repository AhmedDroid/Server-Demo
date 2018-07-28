//
//  MasterViewController.swift
//  CloudTask
//
//  Created by Baraa on 7/21/18.
//  Copyright © 2018 Cloud Connective. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        splitViewController?.maximumPrimaryColumnWidth = 100.0
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

