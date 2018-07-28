//
//  DetailViewController.swift
//  CloudTask
//
//  Created by Baraa on 7/21/18.
//  Copyright © 2018 Cloud Connective. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var pageIndex = 0
    var content: BaseObjectMapper = BaseObjectMapper()

    override func viewDidLoad() {
        super.viewDidLoad()

        APIController.inst.getDataFromAPI(pageIndex: pageIndex) { data, err in
            if (err == nil && data != nil) {
                // success we should have the data ready here
                self.content = data!
                self.tableView.register(UINib(nibName: "ServerCellTableViewCell", bundle: nil), forCellReuseIdentifier: "dataCell")
                self.tableView.reloadData()
            }
        }
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! ServerCellTableViewCell)
        cell.loadViewsWith(data: content.content![indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return content.size ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

