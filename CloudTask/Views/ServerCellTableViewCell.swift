//
//  ServerCellTableViewCell.swift
//  CloudTask
//
//  Created by Baraa on 7/28/18.
//  Copyright © 2018 Cloud Connective. All rights reserved.
//

import UIKit

class ServerCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var serverIndicatorColor: UIImageView!
    @IBOutlet weak var serverFlags: UILabel!
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var clockButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var checkmarkButton: UIButton!
    @IBOutlet weak var serverIP: UILabel!
    @IBOutlet weak var serverGateway: UILabel!
    @IBOutlet weak var serverName: UILabel!
    @IBOutlet weak var serverLocation: UILabel!
    @IBOutlet weak var serverImage: UIImageView!
    
    @IBOutlet weak var holderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func loadViewsWith(data: Content) {
        serverImage.layer.cornerRadius = serverImage.frame.size.width/2
        serverImage.clipsToBounds = true
        serverIP.text = data.ipAddress
        serverGateway.text = data.ipSubnetMask
        serverName.text = data.name
        serverFlags.text = "CPU 100%"
}
    
//    func layoutSubviews() {
//
//    }
}
