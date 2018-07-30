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
        serverIP.text = data.ipAddress
        serverGateway.text = data.ipSubnetMask
        serverName.text = data.name
        serverFlags.text = "CPU 100%"
        serverFlags.textColor = UIColor.white
        serverFlags.layer.cornerRadius = 18
        serverFlags.layer.borderWidth = 0.5
        serverFlags.layer.borderColor = UIColor.darkGray.cgColor
        if (data.status?.id == 1) {
            // green
            serverIndicatorColor.image = UIImage(named: "circlegreen")
        } else if (data.status?.id == 2) {
            // orange
            serverIndicatorColor.image = UIImage(named: "circleorange")
        } else if (data.status?.id == 3) {
            // yellow
            serverIndicatorColor.image = UIImage(named: "circleyellow")
        } else {
            // red
            serverIndicatorColor.image = UIImage(named: "circlered")
        }
}
    
//    func layoutSubviews() {
//
//    }
}
