//
//  ShadowView.swift
//  CloudTask
//
//  Created by Baraa on 7/28/18.
//  Copyright © 2018 Cloud Connective. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable class ShadowView: UIView {

    @IBInspectable var corners: CGFloat = 0.0
    @IBInspectable var shadowColor: UIColor = UIColor.black

    @IBInspectable var shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        	layer.cornerRadius = corners
        layer.shadowColor = shadowColor.cgColor
        
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: corners)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}
