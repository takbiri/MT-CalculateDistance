//
//  GradientView.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/12/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import UIKit

class GradientView: UIView { // create custom Gradient for top of main view

    
    override func draw(_ rect: CGRect) {
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = rect
        
        gradientLayer.colors = [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor,#colorLiteral(red: 0.4156862745, green: 0.9921568627, blue: 0.937254902, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x:0.5, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.5, y:0.0)
        
        
        self.layer.addSublayer(gradientLayer)
        
    }

}
