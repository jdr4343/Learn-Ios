//
//  GradientButton.swift
//  Gradients
//
//  Created by 신지훈 on 2021/08/14.
//

import UIKit

class GradientButton: UIButton {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemOrange.cgColor
        ]
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
