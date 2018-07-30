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
    var isUpdating = false
    var baseObjMapper: BaseObjectMapper = BaseObjectMapper()
    var dataArr = [Content]()

    override func viewDidLoad() {
        super.viewDidLoad()

        APIController.inst.getDataFromAPI(pageIndex: pageIndex) { data, err in
            if (err == nil && data != nil) {
                // success we should have the data ready here
                self.baseObjMapper = data!
                self.dataArr = self.baseObjMapper.content!
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.tableView.alpha = 1.0
                    self.tableView.isHidden = false
                })
                
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
        cell.loadViewsWith(data: self.dataArr[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
            {
                if !isUpdating {
                    isUpdating = true
                    self.pageIndex += 1
                    self.startPaging()
                }
            }
    }
    
    func startPaging() {
        APIController.inst.getDataFromAPI(pageIndex: pageIndex) { data, err in
            if (err == nil && data != nil) {
                // success we should have the data ready here
                self.baseObjMapper = data!
                
                if let data = data?.content {
                    data.forEach({ (cont) in
                        self.dataArr.append(cont)
                    })
                }
                
                self.tableView.reloadData()
                self.isUpdating = false
            }
        }
    }
}
