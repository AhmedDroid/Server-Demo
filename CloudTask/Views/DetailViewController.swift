//
//  DetailViewController.swift
//  CloudTask
//
//  Created by Baraa on 7/21/18.
//  Copyright © 2018 Cloud Connective. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        APIController.inst.getDataFromAPI(pageIndex: pageIndex) { data, err in
            if (err == nil) {
                // success we should have the data ready here
                let co = data?.content?.map({ (content) -> Content in
                    
                    return content
                })
            }
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

