//
//  ViewController.swift
//  Gradients
//
//  Created by 신지훈 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //그라디언트 생성
        let gradienLayer = CAGradientLayer()
        gradienLayer.frame = view.bounds
        gradienLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemTeal.cgColor,
            UIColor.systemBlue.cgColor,
            UIColor.systemGreen.cgColor
        ]
        view.layer.addSublayer(gradienLayer)
        
        
        //그라디언트 버튼
        let button = GradientButton(frame: CGRect(x: 0, y: 0, width: 220, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Gradients Button", for: .normal)
        button.layer.cornerRadius = 90
    }


}

